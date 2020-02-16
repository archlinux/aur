# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Interesting package I found on github for car hacking. you need to make you
# own dongle. instructions included

pkgname=cbm-git
pkgver=r19.a62ad24
pkgrel=1
pkgdesc="Car Backdoor Maker : A hardware backdoor tool is presented having several advanced features"
arch=('i686' 'x86_64')
url="https://github.com/UnaPibaGeek/CBM"
license=('UNKNOWN')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=("cbm")
conflicts=("cbm")
source=("${pkgname}::git+https://github.com/UnaPibaGeek/CBM.git"
	"git+https://github.com/UnaPibaGeek/thebicho.git"
	"cbm.desktop")
sha256sums=('SKIP'
            'SKIP'
            'd2a61a6ea69e11d72be5d5cebc33fa67a910db6bbdc0545f4d220fdac016cfdc')
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/src/"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/cbm"
  # Copy computer files.
  install -Dm644 README.md "${pkgdir}/usr/share/cbm/README.md"
  cd src
  install -Dm755 CBM "${pkgdir}/usr/bin/CBM"
  install -Dm755 frame_icon.png "${pkgdir}/usr/share/icons/car_backdoor.png"
  cd "${srcdir}"
  install -Dm644 cbm.desktop "${pkgdir}/usr/share/applications/cbm.desktop"

  # Now copy the firmware from thebicho repo:
  cd "${srcdir}/thebicho"
  cp -R firmware "${pkgdir}/usr/share/cbm/firmware"
  cp -R hardware-schematics "${pkgdir}/usr/share/cbm/hardware-schematics" 
}

