# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

_reponame=brave-browser
pkgname=brave
pkgver=0.71.114
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
        'add-missing-include-for-unique_ptr.patch'
        'dns_util-make-DohUpgradeEntry-non-const.patch'
        'fix-shutdown-crash-in-ProfileManager.patch'
        'fix-spammy-unique-font-matching-log.patch'
        'brave-vaapi-enable.patch'
        'brave-launcher'
        'brave-browser.desktop')
sha256sums=('SKIP'
            '7496762a1953b15a48d3e5503fb76d9835940afd850a45b7de976de9f51479f9'
            'd081f2ef8793544685aad35dea75a7e6264a2cb987ff3541e6377f4a3650a28b'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '49052e8aa630c4aa57bf46823edc32b7b309493275163c3bb3f9fd390c73356e'
            '69694ab12a5ced389916c0c5e8c7bdc191544f576b134ddfb2fe9d4ed9ec4494'
            '4f81612c28957987f7344d8ce2b95a4a63136a8319c9751819436b11c62df057'
            '6fbffe59b886195b92c9a55137cef83021c16593f49714acb20023633e3ebb19'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            '43f442d9ffacd69a1ca770b029083aaa544d48c052939a66e58a868d91ebde70'
            '2191ba32800a423f37b7a667093e2bdef5762fe5111fee1d5067e66e26564488')

prepare() {
    # Apply Brave patches
    cd "${_reponame}"
    patch -Np1 -i "${srcdir}/brave-vaapi-enable.patch"

    # Hack to prioritize python2 in PATH
    mkdir -p "${srcdir}/bin"
    ln -sf /usr/bin/python2 "${srcdir}/bin/python"
    ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
    export PATH="${srcdir}/bin:${PATH}"

    # Prepare the environment
    npm install
    npm run init

    # Apply Chromium patches
    cd src/
    patch -Np1 -i "${srcdir}/chromium-vaapi-fix.patch"

    # Missing include in third_party/blink/public/platform/web_rtc_rtp_source.h
    patch -Np1 -i "${srcdir}/add-missing-include-for-unique_ptr.patch"

    # https://crbug.com/957519#c23
    patch -Np1 -i "${srcdir}/dns_util-make-DohUpgradeEntry-non-const.patch"

    # https://crbug.com/1005244
    patch -Np1 -i "${srcdir}/fix-shutdown-crash-in-ProfileManager.patch"

    # https://crbug.com/1005508
    patch -Np1 -i "${srcdir}/fix-spammy-unique-font-matching-log.patch"

    # Load Widevine CDM if available
    patch -Np1 -i "${srcdir}/chromium-widevine.patch"

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}/chromium-skia-harmony.patch"

    # Hacky patching
    sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn
}

build() {
    cd "${_reponame}"

    # Hack to prioritize python2 in PATH
    mkdir -p "${srcdir}/bin"
    ln -sf /usr/bin/python2 "${srcdir}/bin/python"
    ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
    export PATH="${srcdir}/bin:${PATH}"

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
