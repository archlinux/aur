_pkgname="kst"
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=2.0.8r3428.606588ce
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="http://kst-plot.kde.org"
license=('GPL')
depends=('hdf5<1.12.1' 'gsl' 'qt5-base' 'qt5-svg' 'muparser' 'python-scipy>=0.9' 'python-numpy>=1.6' 'cfitsio' 'python-pyside2')
optdepends=(
  'getdata: provides support for files in the Dirfile format'
  'libmatio: provides support for Matlab binary files'
)
makedepends=('cmake')
#install=$pkgname.install
source=("git+https://invent.kde.org/graphics/kst-plot.git" "0001-Fixed-HDF5-patch-for-archlinux-users.patch")
md5sums=('SKIP' '4913f0bdccfa8adba09f6b6bf5bb2d11')
provides=("${_pkgname}")
pkgver() {
  cd "${srcdir}/${_pkgname}-plot"
  printf "2.0.8r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
conflicts=("${_pkgname}")
build() {
  cd "${srcdir}/${_pkgname}-plot"
  cp -r ./cmake/pyKst/* ./pyKst/
  cmake ./ \
  -Dkst_release=2 \
  -Dkst_version_string=2.0.8 \
  -Dkst_svnversion=0 \
  -Dkst_python=1 \
  -DPYTHON_EXECUTABLE=/usr/bin/python \
  -Dkst_python_prefix=/usr/lib/python \
  -Dkst_install_prefix=/usr \
  -Dkst_qt5=ON \
  -Dkst_merge_files=ON \
  -DCMAKE_CXX_FLAGS="-DH5_USE_110_API"
}
prepare(){
	cd "${srcdir}/${_pkgname}-plot"
	patch -p1 < ../0001-Fixed-HDF5-patch-for-archlinux-users.patch
}
package() {
  cd "${srcdir}/${_pkgname}-plot"
  make -j$(nproc) DESTDIR="${pkgdir}" install
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/${_pkgname}-plot/LICENSE"
}
