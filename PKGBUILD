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
## COMPONENT variable
## 0 -> build normal (with debug symbols)
## 1 -> release (default)
## 2 -> static
## 3 -> debug
## https://github.com/brave/brave-browser/wiki#clone-and-initialize-the-repo
if [ -z ${COMPONENT+x} ]; then
  COMPONENT=1
fi
##

_reponame=brave-browser
pkgname=brave
pkgver=1.10.97
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=('x86_64')
url='https://www.brave.com/download'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'libva')
makedepends=('git' 'npm' 'python2' 'icu' 'glibc' 'gperf' 'java-runtime-headless' 'clang' 'python2-setuptools')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'libpipewire02: WebRTC desktop sharing under Wayland'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: for storing passwords in KWallet on KDE desktops'
            'sccache: For faster builds')
source=("git+https://github.com/brave/brave-browser.git#tag=v${pkgver}"
        'brave-vaapi-enable.patch'
        'chromium-no-history.patch'
        'brave-launcher'
        'brave-browser.desktop')
arch_revision=e8defe050ab6138cc8ad4db936ad85c3b71bbde8
for Patches in \
        clean-up-a-call-to-set_utf8.patch \
        iwyu-std-numeric_limits-is-defined-in-limits.patch \
        add-missing-algorithm-header-in-crx_install_error.cc.patch \
        libstdc-fix-incomplete-type-in-AXTree-for-NodeSetSiz.patch \
        include-memory-header-to-get-the-definition-of-std-u.patch \
        make-some-of-blink-custom-iterators-STL-compatible.patch \
        avoid-double-destruction-of-ServiceWorkerObjectHost.patch \
        v8-remove-soon-to-be-removed-getAllFieldPositions.patch \
        chromium-fix-vaapi-on-intel.patch \
        chromium-83-gcc-10.patch \
        chromium-skia-harmony.patch
do
  source+=("${Patches}::https://git.archlinux.org/svntogit/packages.git/plain/trunk/${Patches}?h=packages/chromium&id=${arch_revision}")
done

# VAAPI patches from chromium-vaapi in AUR
source+=("vdpau-support.patch::https://aur.archlinux.org/cgit/aur.git/plain/vdpau-support.patch?h=chromium-vaapi&id=7c05464a8700b1a6144258320b2b33b352385f77")

sha256sums=('SKIP'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            '131ed439a0ecb41df4ef6460c98c0a410c035d5eab0093214f627d65cff5bded'
            '725e2d0c32da4b3de2c27a02abaf2f5acca7a25dcea563ae458c537ac4ffc4d5'
            'fa6ed4341e5fc092703535b8becaa3743cb33c72f683ef450edd3ef66f70d42d'
            '58c41713eb6fb33b6eef120f4324fa1fb8123b1fbc4ecbe5662f1f9779b9b6af'
            '675fb3d6276cce569a641436465f58d5709d1d4a5f62b7052989479fd4aaea24'
            '0e2a78e4aa7272ab0ff4a4c467750e01bad692a026ad9828aaf06d2a9418b9d8'
            '50687079426094f2056d1f4806dc30fc8d6bad16190520e57ba087ec5db1d778'
            '071326135bc25226aa165639dff80a03670a17548f2d2ff5cc4f40982b39c52a'
            '3d7f20e1d2ee7d73ed25e708c0d59a0cb215fcce10a379e3d48a856533c4b0b7'
            'd793842e9584bf75e3779918297ba0ffa6dd05394ef5b2bf5fb73aa9c86a7e2f'
            'e042024423027ad3ef729a7e4709bdf9714aea49d64cfbbf46a645a05703abc2'
            'e495f2477091557b15bff2c99831e0a3db64ea2ebde7dcb22857a6469c944b9a'
            '3e5ba8c0a70a4bc673deec0c61eb2b58f05a4c784cbdb7c8118be1eb6580db6d'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '0ec6ee49113cc8cc5036fa008519b94137df6987bf1f9fbffb2d42d298af868a')

prepare() {
    cd "${_reponame}"

    # Patch to download only sources, but not all history
    patch -Np1 -i "${srcdir}"/chromium-no-history.patch

    # Apply Brave patches
    patch -Np1 -i "${srcdir}"/brave-vaapi-enable.patch

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

    # https://crbug.com/893950
    sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
        third_party/blink/renderer/core/xml/*.cc \
        third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
        third_party/libxml/chromium/*.cc

    # https://chromium-review.googlesource.com/c/chromium/src/+/2145261
    patch -Np1 -i "${srcdir}"/clean-up-a-call-to-set_utf8.patch

    # https://chromium-review.googlesource.com/c/chromium/src/+/2153111
    patch -Np1 -F3 -i "${srcdir}"/iwyu-std-numeric_limits-is-defined-in-limits.patch

    # https://chromium-review.googlesource.com/c/chromium/src/+/2152333
    patch -Np1 -i "${srcdir}"/add-missing-algorithm-header-in-crx_install_error.cc.patch

    # https://chromium-review.googlesource.com/c/chromium/src/+/2132403
    patch -Np1 -i "${srcdir}"/libstdc-fix-incomplete-type-in-AXTree-for-NodeSetSiz.patch

    # https://chromium-review.googlesource.com/c/chromium/src/+/2164645
    patch -Np1 -i "${srcdir}"/include-memory-header-to-get-the-definition-of-std-u.patch

    # https://chromium-review.googlesource.com/c/chromium/src/+/2174199
    patch -Np1 -i "${srcdir}"/make-some-of-blink-custom-iterators-STL-compatible.patch

    # https://chromium-review.googlesource.com/c/chromium/src/+/2094496
    patch -Np1 -i "${srcdir}"/avoid-double-destruction-of-ServiceWorkerObjectHost.patch

    # https://crbug.com/v8/10393
    patch -Np1 -d v8 <"${srcdir}"/v8-remove-soon-to-be-removed-getAllFieldPositions.patch

    # Fixes from Gentoo
    patch -Np1 -i "${srcdir}"/chromium-83-gcc-10.patch

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}"/chromium-skia-harmony.patch

    # Patch from rpmfusion: chromium-freeworld
    patch -Np1 -i "${srcdir}"/chromium-fix-vaapi-on-intel.patch

    # Fix VA-API on Nvidia
    patch -Np1 -i "${srcdir}"/vdpau-support.patch

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

    ## See explanation on top to select your build
    case ${COMPONENT} in
        0)
            msg2 "Normal build (with debug)"
            npm run build
            ;;
        2)
            msg2 "Static build"
            npm run build -- Static
            ;;
        3)
            msg2 "Debug build"
            npm run build -- Debug
            ;;
        *)
            msg2 "Release build"
            npm run build Release
    esac 
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
