# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=micmac-git
pkgver=1.0.beta14.r761.g2a4685757
pkgrel=1
pkgdesc="Free open-source photogrammetry software tools - Version GIT"
arch=('i686' 'x86_64')
url='http://micmac.ensg.eu'
license=('custom:CECILL-B')
depends=('python-argparse' 'libx11')
makedepends=('cmake' 'doxygen' 'git')
optdepends=('opencl-headers' 'qt5-base' 'imagemagick' 'exiv2' 'proj')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!staticlibs')
source=("git+https://github.com/micmacIGN/micmac.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_PATH_BIN=/usr/bin \
  -DBUILD_PATH_LIB=/usr/lib \
  -DWITH_CPP11=ON \
  -DWERROR=0 -DWITH_CCACHE=OFF \
  -DWITH_INTERFACE=OFF  \
  -DWITH_DOXYGEN=ON \
  -DWITH_ETALONPOLY=ON \
  -DWITH_HEADER_PRECOMP=ON \
  -DWITH_OPENCL=OFF \
  -DWITH_OPEN_MP=OFF ..
  make
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir"/usr/share/micmac/scripts
  cp -dr --no-preserve=ownership "${srcdir}/${pkgname%-git}/include" "$pkgdir"/usr/
  install -Dm755 "$srcdir"/${pkgname%-git}/binaire-aux/linux/ann_mec_filtre.LINUX \
	  "$pkgdir"/usr/bin/ann_mec_filtre.LINUX
  install -Dm755 "$srcdir"/${pkgname%-git}/binaire-aux/linux/Conv_VSFM_MM \
	  "$pkgdir"/usr/bin/Conv_VSFM_MM
  install -Dm755 "$srcdir"/${pkgname%-git}/binaire-aux/linux/siftpp_tgi.LINUX \
	  "$pkgdir"/usr/bin/siftpp_tgi.LINUX
  cp -dr --no-preserve=ownership "$srcdir"/${pkgname%-git}/data "$pkgdir"/usr/share/micmac
  cp -dr --no-preserve=ownership "$srcdir"/${pkgname%-git}/scripts/noodles_exe_parallel.py \
     "$pkgdir"/usr/share/micmac/scripts/noodles_exe_parallel.py
  install -Dm644 "$srcdir"/${pkgname%-git}/COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
  rm -rfv "$pkgdir"/home
}
