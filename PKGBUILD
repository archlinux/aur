# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=brave
pkgver=0.66.99
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=('x86_64')
url='https://www.brave.com/download'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'libva')
makedepends=('git' 'npm' 'python2' 'icu' 'glibc' 'gperf' 'java-runtime-headless')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'libgnome-keyring: Enable GNOME keyring support')
source=("git+https://github.com/brave/brave-browser.git#tag=v${pkgver}"
        'chromium-vaapi-fix.patch'
        'brave-vaapi-enable.patch'
        'brave-launcher'
        'brave.desktop')
sha256sums=('SKIP'
            '333b1e0997ad8831906f66550efc73f51b8650ec3436a247d920b5d12e2169de'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            '43f442d9ffacd69a1ca770b029083aaa544d48c052939a66e58a868d91ebde70'
            '2191ba32800a423f37b7a667093e2bdef5762fe5111fee1d5067e66e26564488')

prepare() {
    # Apply Brave patches
    cd brave-browser
    patch -Np1 -i "${srcdir}/brave-vaapi-enable.patch"

    # Hack to prioritize python2 in PATH
    mkdir -p "${HOME}/bin"
    ln -s /usr/bin/python2 "${HOME}/bin/python"
    ln -s /usr/bin/python2-config "${HOME}/bin/python-config"
    export PATH="${HOME}/bin:${PATH}"

    # Prepare the environment
    npm install
    npm run init

    # Apply Chromium patches
    cd src/
    patch -Np1 -i "${srcdir}/chromium-vaapi-fix.patch"

    # Hacky patching
    sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn
}

build() {
    cd brave-browser
    npm run build Release
}

package() {
    install -d -m0755 "${pkgdir}/usr/lib/brave/"

    # Copy necessary release files
    cd brave-browser/src/out/Release
    cp -a --reflink=auto \
        locales \
        resources \
        brave \
        brave_*.pak \
        chrome_*.pak \
        icudtl.dat \
        natives_blob.bin \
        resources.pak \
        v8_context_snapshot.bin \
        "${pkgdir}/usr/lib/brave/"

    cd "${srcdir}"
    install -Dm0755 brave-launcher "${pkgdir}/usr/bin/brave"
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" brave.desktop
    install -Dm0644 brave-browser/src/brave/app/theme/brave/product_logo_128.png "${pkgdir}/usr/share/pixmaps/brave.png"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" brave-browser/LICENSE
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" brave-browser/src/brave/components/brave_sync/extension/brave-sync/node_modules/electron/dist/LICENSES.chromium.html
}

# vim:set ts=4 sw=4 et:
