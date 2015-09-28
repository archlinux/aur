_pkgname="kst"
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=2.0.8
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="http://kst-plot.kde.org"
license=('GPL')
depends=('gsl' 'qt4' 'muparser' 'python2-scipy>=0.9' 'python2-numpy>=1.6' 'cfitsio' 'python2-pyside')
optdepends=(
  'getdata: provides support for files in the Dirfile format'
  'libmatio: provides support for Matlab binary files'
)
makedepends=('cmake')
#install=$pkgname.install
source=("git://github.com/Kst-plot/kst.git" "0001-Fixed-compilation-error-for-ambiguous-overload-off-a.patch")
md5sums=('SKIP' '43dad5d63cf1d3415a5dda3df2e02c08')
pkgver() {
  cd "${srcdir}/${_pkgname}"

  2.0.8-$(git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
}
conflicts=("kst")
build() {
  cd "${srcdir}/${_pkgname}"
  cp -r ./cmake/pyKst/* ./pyKst/
  cmake ./ \
  -Dkst_release=2 \
  -Dkst_version_string=$(pkgver) \
  -Dkst_svnversion=0 \
  -Dkst_python=1 \
  -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
  -Dkst_python_prefix=/usr/lib/python2.7 \
  -Dkst_install_prefix=/usr/
}
prepare(){
	cd "${srcdir}/${_pkgname}"
	patch -p1 < ../0001-Fixed-compilation-error-for-ambiguous-overload-off-a.patch 
}
package() {
  cd "${srcdir}/${_pkgname}"
  make -j$(nproc) DESTDIR="${pkgdir}" install
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}