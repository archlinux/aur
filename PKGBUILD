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
pkgver=1.12.107
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
arch_revision=2efd12e6db7c47f6d433971406fb271a1fb0c839
for Patches in \
        chromium-ffmpeg-4.3.patch \
        force-mp3-files-to-have-a-start-time-of-zero.patch \
        chromium-fix-vaapi-on-intel.patch \
        chromium-skia-harmony.patch
do
  source+=("${Patches}::https://git.archlinux.org/svntogit/packages.git/plain/trunk/${Patches}?h=packages/chromium&id=${arch_revision}")
done

# VAAPI patches from chromium-vaapi in AUR
#source+=("vdpau-support.patch::https://aur.archlinux.org/cgit/aur.git/plain/vdpau-support.patch?h=chromium-vaapi&id=7c05464a8700b1a6144258320b2b33b352385f77")

sha256sums=('SKIP'
            '2b07eabd8b3d42456d2de44f6dca6cf2e98fa06fc9b91ac27966fca8295c5814'
            'c090e4d26847831a719aea4a8cf722b7f6b6726bd7b6bf4da984e59567095917'
            '725e2d0c32da4b3de2c27a02abaf2f5acca7a25dcea563ae458c537ac4ffc4d5'
            'fa6ed4341e5fc092703535b8becaa3743cb33c72f683ef450edd3ef66f70d42d'
            '5390304b5f544868985ce00a3ec082d4ece2dacb1c73cdb35dd4facfea12449a'
            'abc3fad113408332c3b187b083bf33eba59eb5c87fa3ce859023984b5804623c'
            'e495f2477091557b15bff2c99831e0a3db64ea2ebde7dcb22857a6469c944b9a'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1')

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

    # https://chromium-review.googlesource.com/c/chromium/src/+/2268221
    patch -Np1 -i "${srcdir}"/force-mp3-files-to-have-a-start-time-of-zero.patch

    # https://crbug.com/1095962
    patch -Np1 -i "${srcdir}"/chromium-ffmpeg-4.3.patch

    # https://crbug.com/skia/6663#c10
    patch -Np0 -i "${srcdir}"/chromium-skia-harmony.patch

    # Patch from rpmfusion: chromium-freeworld
    patch -Np1 -i "${srcdir}"/chromium-fix-vaapi-on-intel.patch

    # Fix VA-API on Nvidia
#    patch -Np1 -i "${srcdir}"/vdpau-support.patch

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
