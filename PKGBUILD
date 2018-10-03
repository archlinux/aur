_pkgname="kst"
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=2.0.8r3357.9db9477d
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="http://kst-plot.kde.org"
license=('GPL')
depends=('gsl' 'qt5-base' 'qt5-svg' 'muparser' 'python2-scipy>=0.9' 'python2-numpy>=1.6' 'cfitsio' 'python2-pyside')
optdepends=(
  'getdata: provides support for files in the Dirfile format'
  'libmatio: provides support for Matlab binary files'
)
makedepends=('cmake')
#install=$pkgname.install
source=("git://github.com/Kst-plot/kst.git" "0001-Build-fixes-for-Qt-5.11.patch")
md5sums=('SKIP' 'b655a89d78c7dc80f7692f5c218e05dc')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "2.0.8r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
conflicts=("kst")
build() {
  cd "${srcdir}/${_pkgname}"
  cp -r ./cmake/pyKst/* ./pyKst/
  cmake ./ \
  -Dkst_release=2 \
  -Dkst_version_string=2.0.8 \
  -Dkst_svnversion=0 \
  -Dkst_python=1 \
  -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
  -Dkst_python_prefix=/usr/lib/python2.7 \
  -Dkst_install_prefix=/usr \
  -Dkst_qt5=ON
}
prepare(){
	cd "${srcdir}/${_pkgname}"
	patch -p1 < ../0001-Build-fixes-for-Qt-5.11.patch
}
package() {
  cd "${srcdir}/${_pkgname}"
  make -j$(nproc) DESTDIR="${pkgdir}" install
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
