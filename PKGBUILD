# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

_reponame=brave-browser
pkgname=brave
pkgver=0.69.132
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
        'chromium-widevine.patch'
        'chromium-skia-harmony.patch'
        'include-memory-in-one_euro_filter.h.patch'
        'link-against-harfbuzz-subset.patch'
        'fix-wrong-string-initialization-in-LinkedHashSet.patch'
        'include-limits-in-web_time_range.cc.patch'
        'brave-vaapi-enable.patch'
        'brave-launcher'
        'brave-browser.desktop')
sha256sums=('SKIP'
            '333b1e0997ad8831906f66550efc73f51b8650ec3436a247d920b5d12e2169de'
            'd081f2ef8793544685aad35dea75a7e6264a2cb987ff3541e6377f4a3650a28b'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '33a5bcd1df2cc7aa7467fa882790ef143a4497d2b704c9e1ea86c8ede90c2d90'
            'ab986e4b723dfcedab1bc8dcada07526facae28a8a7ff3345f658532c1d99987'
            '840f555020751ec284dca35b9317a9dd7dc69fcb910ea1cae2dd7cc9b237dfb7'
            'd3dfe3c86901a11636972a774ed6c941ac76e38c9e4a384f458043a0a03291a9'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            '43f442d9ffacd69a1ca770b029083aaa544d48c052939a66e58a868d91ebde70'
            '2191ba32800a423f37b7a667093e2bdef5762fe5111fee1d5067e66e26564488')

prepare() {
    # Apply Brave patches
    cd "${_reponame}"
    patch -Np1 -i "${srcdir}/brave-vaapi-enable.patch"

    # Hack to prioritize python2 in PATH
    mkdir -p "${srcdir}/bin"
    ln -s /usr/bin/python2 "${srcdir}/bin/python"
    ln -s /usr/bin/python2-config "${srcdir}/bin/python-config"
    export PATH="${srcdir}/bin:${PATH}"

    # Prepare the environment
    npm install
    npm run init

    # Apply Chromium patches
    cd src/
    patch -Np1 -i "${srcdir}/chromium-vaapi-fix.patch"

    # https://crbug.com/819294
    patch -Np1 -i "${srcdir}/include-memory-in-one_euro_filter.h.patch"

    # https://groups.google.com/a/chromium.org/d/msg/chromium-packagers/UyJsVJ5QqWo/jSv5z7-rEQAJ
    patch -Np1 -i "${srcdir}/link-against-harfbuzz-subset.patch"

    # https://crbug.com/980025
    patch -Np1 -i "${srcdir}/fix-wrong-string-initialization-in-LinkedHashSet.patch"

    # https://crbug.com/992832
    patch -Np1 -i "${srcdir}/include-limits-in-web_time_range.cc.patch"

    # Load Widevine CDM if available
    patch -Np1 -i "${srcdir}/chromium-widevine.patch"

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}/chromium-skia-harmony.patch"

    # Hacky patching
    sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn
}

build() {
    cd "${_reponame}"
    npm run build Release
}

package() {
    install -d -m0755 "${pkgdir}/usr/lib/${pkgname}/"

    # Copy necessary release files
    cd "${_reponame}/src/out/Release"
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
    install -Dm0755 brave-launcher "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" "${_reponame}.desktop"
    install -Dm0644 "${_reponame}/src/brave/app/theme/brave/product_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_reponame}/LICENSE"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_reponame}/src/brave/components/brave_sync/extension/brave-sync/node_modules/electron/dist/LICENSES.chromium.html"
}

# vim:set ts=4 sw=4 et:
