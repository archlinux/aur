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
pkgver=1.8.86
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=('x86_64')
url='https://www.brave.com/download'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'libva')
makedepends=('git' 'npm' 'python2' 'icu' 'glibc' 'gperf' 'java-runtime-headless' 'clang')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'libpipewire02: WebRTC desktop sharing under Wayland'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: for storing passwords in KWallet on KDE desktops'
            'sccache: For faster builds')
source=("git+https://github.com/brave/brave-browser.git#tag=v${pkgver}"
        'brave-vaapi-enable.patch'
        'brave-launcher'
        'brave-browser.desktop')
arch_revision=12619d0d3664de241e95cf22e96f07838d17e6c2
for Patches in \
        rename-Relayout-in-DesktopWindowTreeHostPlatform.patch \
        rebuild-Linux-frame-button-cache-when-activation.patch \
        icu67.patch \
        chromium-widevine.patch \
        chromium-skia-harmony.patch
do
  source+=("${Patches}::https://git.archlinux.org/svntogit/packages.git/plain/trunk/${Patches}?h=packages/chromium&id=${arch_revision}")
done

# VAAPI patches from chromium-vaapi in AUR
source+=("vaapi-build-fix.patch::https://aur.archlinux.org/cgit/aur.git/plain/vaapi-build-fix.patch?h=chromium-vaapi&id=2421d695f494fd04797ac6eda81e66857664b854"
         "vdpau-support.patch::https://aur.archlinux.org/cgit/aur.git/plain/vdpau-support.patch?h=chromium-vaapi&id=2421d695f494fd04797ac6eda81e66857664b854")

sha256sums=('SKIP'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            '43f442d9ffacd69a1ca770b029083aaa544d48c052939a66e58a868d91ebde70'
            '2191ba32800a423f37b7a667093e2bdef5762fe5111fee1d5067e66e26564488'
            'ae3bf107834bd8eda9a3ec7899fe35fde62e6111062e5def7d24bf49b53db3db'
            '46f7fc9768730c460b27681ccf3dc2685c7e1fd22d70d3a82d9e57e3389bb014'
            '5315977307e69d20b3e856d3f8724835b08e02085a4444a5c5cefea83fd7d006'
            '709e2fddba3c1f2ed4deb3a239fc0479bfa50c46e054e7f32db4fb1365fed070'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            'fad5e678d62de0e45db1c2aa871628fdc981f78c26392c1dccc457082906a350'
            '0ec6ee49113cc8cc5036fa008519b94137df6987bf1f9fbffb2d42d298af868a')

prepare() {
    # Apply Brave patches
    cd "${_reponame}"
    patch -Np1 -i "${srcdir}/brave-vaapi-enable.patch"

    # Hack to prioritize python2 in PATH
    mkdir -p "${srcdir}/bin"
    ln -sf /usr/bin/python2 "${srcdir}/bin/python"
    ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
    export PATH="${srcdir}/bin:${PATH}"

    msg2 "Prepare the environment..."
    npm install
    npm run sync -- --all --run_hooks --run_sync || npm run init

    msg2 "Apply Chromium patches..."
    cd src/

    # https://crbug.com/1049258
    patch -Np1 -i "${srcdir}"/rename-Relayout-in-DesktopWindowTreeHostPlatform.patch
    patch -Np1 -i "${srcdir}"/rebuild-Linux-frame-button-cache-when-activation.patch

    # https://crbug.com/v8/10393
    patch -Np3 -d v8 -i "${srcdir}"/icu67.patch

    # Load bundled Widevine CDM if available (see chromium-widevine in the AUR)
    # M79 is supposed to download it as a component but it doesn't seem to work
    patch -Np1 -i "${srcdir}"/chromium-widevine.patch

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}"/chromium-skia-harmony.patch

    # Fix VA-API on Intel and Nvidia
#    patch -Np1 -i "${srcdir}"/vdpau-support.patch || true
#    patch -Np1 -i "${srcdir}"/vaapi-build-fix.patch || true

    # Force script incompatible with Python 3 to use /usr/bin/python2
    sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

    # Hacky patching
    sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn
}

build() {
    cd "${_reponame}"

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
    cd "${_reponame}/src/out/Release"
    cp -a --reflink=auto \
        locales \
        resources \
        brave \
        brave_*.pak \
        chrome_*.pak \
        icudtl.dat \
        resources.pak \
        v8_context_snapshot.bin \
        "${pkgdir}/usr/lib/brave/"
        # In v1.3.115 sync is disabled, so natives_blob.bin is not available. Remember to put it back when sync is working again

    cd "${srcdir}"
    install -Dm0755 brave-launcher "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/applications/" "${_reponame}.desktop"
    install -Dm0644 "${_reponame}/src/brave/app/theme/brave/product_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_reponame}/LICENSE"
}

# vim:set ts=4 sw=4 et:
