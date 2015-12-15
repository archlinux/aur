# Maintainer: Tinxy <arch at tinx dot eu>

pkgname=dvbcut-qt4
pkgver=273.3c1f90f
pkgrel=3
pkgdesc='QT4 port of dvbcut, an MPEG2 video editing software'
arch=('i686' 'x86_64')
url='https://github.com/nextghost/dvbcut-qt4'
license=('GPL2')
depends=('desktop-file-utils' 'qt4' 'ffmpeg' 'libao' 'libmad')
optdepends=('mplayer: for video playback inside of DVBCUT')
makedepends=('git')
conflicts=("dvbcut")
install="$pkgname.install"
source=("$pkgname::git+https://github.com/nextghost/dvbcut-qt4.git"
        "file_dialog.patch")
sha256sums=('SKIP'
            "0a8aff42f7543d1d31cf1ff6f8112e915b48d2a44d4da45afd37d27eecabcdac")

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list HEAD --count).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
  # Applying patch
  patch src/dvbcut.cpp < "${srcdir}/file_dialog.patch"
  qmake-qt4 dvbcut.pro
  make
  # Adjust desktop file
  sed -i -n "/TryExec=.*/d;s/Exec=.*/Exec=\/usr\/bin\/dvbcut/g;s/Icon=.*/Icon=\/usr\/share\/dvbcut\/icons\/dvbcut.svg/g;p;" src/${pkgname%-*}.desktop
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/dvbcut "${pkgdir}/usr/bin/dvbcut"
  install -Dm644 dvbcut.1 "${pkgdir}/usr/share/man/man1/dvbcut.1"
  install -Dm644 src/dvbcut.desktop "${pkgdir}/usr/share/applications/dvbcut.desktop"
  install -Dm644 dvbcut.svg "${pkgdir}/usr/share/dvbcut/icons/dvbcut.svg"
}
