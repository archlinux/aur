# Maintainer: laptander <dev-laptander a|t yandex d|o|t ru>

_gitroot="https://github.com/LongSoft/UEFITool.git"
_gitname="UEFITool"
_gitbranch="new_engine"
pkgname=uefitool-new_engine-git
pkgver=r230.cd1cc09
pkgrel=1
pkgdesc="UEFI firmware image viewer and editor, UEFIExtract, UEFIFind and UEFIPatch"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://forums.mydigitallife.info/threads/48979-UEFITool-UEFI-firmware-image-viewer-and-editor"
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=('uefitool' 'uefiextract' 'uefifind') # 'uefipatch'
conflicts=('uefitool' 'uefiextract' 'uefifind') # 'uefipatch'
source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  for tool in UEFITool UEFIExtract UEFIFind; do # Add UEFIPatch, when it will be ready
    cd "${srcdir}/${_gitname}/${tool}"
    qmake-qt5 ${tool,,}.pro
    make
  done
}

package() {
  for tool in UEFITool UEFIExtract UEFIFind; do # Add UEFIPatch, when it will be ready
    cd "${srcdir}/${_gitname}/${tool}"
    install -D -m755 ${tool} "${pkgdir}/usr/bin/${tool,,}"

    if [ $tool == "UEFITool" ]; then
        install -Dm644 "uefitool.desktop" "$pkgdir/usr/share/applications/uefitool.desktop"
        for RxR in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
            install -Dm644 "icons/uefitool_${RxR}.png" "$pkgdir/usr/share/icons/hicolor/${RxR}/apps/uefitool.png"
        done
    fi

    #if [ $tool == "UEFIPatch" ]; then
    #  install -D -m644 patches.txt "${pkgdir}/usr/share/${_gitname,,}/patches.txt"
    #fi

  done
}
