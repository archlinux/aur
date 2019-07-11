# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=brave
pkgver=0.66.99
pkgrel=2
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
        'chromium-system-icu.patch'
        'chromium-non-const-deltas.patch'
        'libstdc-do-not-assume-unique_ptr-has-ostream-operator.patch'
        'disallow-partial-swaps-for-linux-based-on-gl_version.patch'
        'chromium-fix-window-flash-for-some-WMs.patch'
        'chromium-widevine.patch'
        'chromium-skia-harmony.patch'
        'chromium-vaapi-fix.patch'
        'brave-vaapi-enable.patch'
        'brave-launcher'
        'brave.desktop')
sha256sums=('SKIP'
            'e2d284311f49c529ea45083438a768db390bde52949995534034d2a814beab89'
            '09c5f16b726ef7031d74807b534fbbfa49a7276ee2a239b70602de2704fa197c'
            'e309dfd9d790f32cb1d23103726ac25e405b6ae6757a1c957a8395667d753908'
            '1e4686de75c019f38a3ed947463e429a777d5387fd29310deef2108c58617b07'
            '183d8cc712f0bcf1afcb01ce90c4c104a4c8d8070a06f94974a28b007d9e2ce4'
            'd081f2ef8793544685aad35dea75a7e6264a2cb987ff3541e6377f4a3650a28b'
            '5887f78b55c4ecbbcba5930f3f0bb7bc0117c2a41c2f761805fcf7f46f1ca2b3'
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

    # https://chromium-review.googlesource.com/1584292
    patch -Np1 -i "${srcdir}/libstdc-do-not-assume-unique_ptr-has-ostream-operator.patch"

    # https://crbug.com/973216
    patch -Np1 -i "${srcdir}/disallow-partial-swaps-for-linux-based-on-gl_version.patch"

    # https://crbug.com/956061
    patch -Np1 -i "${srcdir}/chromium-fix-window-flash-for-some-WMs.patch"

    # Load Widevine CDM if available
    patch -Np1 -i "${srcdir}/chromium-widevine.patch"

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}/chromium-skia-harmony.patch"

    # https://bugs.gentoo.org/661880#c21
    patch -Np1 -i "${srcdir}/chromium-system-icu.patch"

    # https://bugs.gentoo.org/686982#c5
    patch -Np1 -i "${srcdir}/chromium-non-const-deltas.patch"

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
