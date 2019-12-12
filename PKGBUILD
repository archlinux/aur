# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env USE_SCCACHE=1 BUILD_RELEASE=0 makepkg -sc
##
## sccache for faster builds - https://github.com/brave/brave-browser/wiki/sccache-for-faster-builds
## Valid numbers between: 0 and 1
## Default is: 0 => not use sccache
if [ -z ${USE_SCCACHE+x} ]; then
  USE_SCCACHE=0
fi
##
## build release or not
## https://github.com/brave/brave-browser/wiki#clone-and-initialize-the-repo
if [ -z ${BUILD_RELEASE+x} ]; then
  BUILD_RELEASE=1
fi
##

_reponame=brave-browser
pkgname=brave
pkgver=1.1.20
pkgrel=2
pkgdesc='A web browser that stops ads and trackers by default'
arch=('x86_64')
url='https://www.brave.com/download'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'libva')
makedepends=('git' 'npm' 'python2' 'icu' 'glibc' 'gperf' 'java-runtime-headless' 'clang')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: for storing passwords in KWallet on KDE desktops'
            'sccache: For faster builds')
source=("https://github.com/brave/brave-browser/archive/v${pkgver}.tar.gz"
        'brave-vaapi-enable.patch'
        'chromium-vaapi-fix.patch'
        'brave-launcher'
        'brave-browser.desktop')
arch_revision=becfa71f57e28821900f1ec06b2863f1886fbf60
for Patches in \
  launch_manager.h-uses-std-vector.patch \
  include-algorithm-to-use-std-lower_bound.patch \
  icu65.patch \
  fix-spammy-unique-font-matching-log.patch \
  chromium-skia-harmony.patch
do
  source+=("${Patches}::https://git.archlinux.org/svntogit/packages.git/plain/trunk/${Patches}?h=packages/chromium&id=${arch_revision}")
done

sha256sums=('0e4977f7e4f891dca2e2326c2892cea57b79d1765476959fe7932ceda08649bc'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            'c9caa800028a725484a327f4464b1689fc91d5bf0c0ca69259a1a1421f03e073'
            '43f442d9ffacd69a1ca770b029083aaa544d48c052939a66e58a868d91ebde70'
            '2191ba32800a423f37b7a667093e2bdef5762fe5111fee1d5067e66e26564488'
            'bd0fae907c451252e91c4cbf1ad301716bc9f8a4644ecc60e9590a64197477d3'
            '1f906676563e866e2b59719679e76e0b2f7f082f48ef0593e86da0351a586c73'
            '1de9bdbfed482295dda45c7d4e323cee55a34e42f66b892da1c1a778682b7a41'
            '6fbffe59b886195b92c9a55137cef83021c16593f49714acb20023633e3ebb19'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1')

prepare() {
    # Apply Brave patches
    cd "${_reponame}-${pkgver}"
    patch -Np1 -i "${srcdir}/brave-vaapi-enable.patch"

    # Hack to prioritize python2 in PATH
    mkdir -p "${srcdir}/bin"
    ln -sf /usr/bin/python2 "${srcdir}/bin/python"
    ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
    export PATH="${srcdir}/bin:${PATH}"

    msg2 "Prepare the environment..."
    npm install
    npm run sync -- --all --run_hooks --run_sync || npm run init
    #npm run init

    msg2 "Apply Chromium patches..."
    cd src/
    patch -Np1 -i "${srcdir}/chromium-vaapi-fix.patch"

    # https://crbug.com/819294
    patch -Np1 -i "${srcdir}/launch_manager.h-uses-std-vector.patch"
    patch -Np1 -i "${srcdir}/include-algorithm-to-use-std-lower_bound.patch"

    # https://crbug.com/1014272
    patch -Np1 -i "${srcdir}/icu65.patch"

    # https://crbug.com/1005508
    patch -Np1 -i "${srcdir}/fix-spammy-unique-font-matching-log.patch"

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}/chromium-skia-harmony.patch"

    # Hacky patching
    sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn
}

build() {
    cd "${_reponame}-${pkgver}"

    export CC=clang
    export CXX=clang++
    export AR=ar
    export NM=nm

    # Hack to prioritize python2 in PATH
    mkdir -p "${srcdir}/bin"
    ln -sf /usr/bin/python2 "${srcdir}/bin/python"
    ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
    export PATH="${srcdir}/bin:${PATH}"

    if [ "$USE_SCCACHE" -eq "1" ]; then
        echo "sccache = /usr/bin/sccache" >> .npmrc
    fi

    if [ "$BUILD_RELEASE" = "0" ]; then
        msg2 "Building debug symbols and without being an official build"
        npm run build -- Release --debug_build=true --official_build=false
    else
        msg2 "Starting the release compile"
        npm run build Release
    fi
}

package() {
    install -d -m0755 "${pkgdir}/usr/lib/${pkgname}/"

    # Copy necessary release files
    cd "${_reponame}-${pkgver}/src/out/Release"
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
    install -Dm0644 "${_reponame}-${pkgver}/src/brave/app/theme/brave/product_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_reponame}-${pkgver}/LICENSE"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_reponame}-${pkgver}/src/brave/components/brave_sync/extension/brave-sync/node_modules/electron/dist/LICENSES.chromium.html"
}

# vim:set ts=4 sw=4 et:
