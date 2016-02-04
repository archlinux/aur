_pkgname="kst"
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=2.0.8r3108.084d3ad
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="http://kst-plot.kde.org"
license=('GPL')
depends=('gsl' 'qt5-base' 'muparser' 'python2-scipy>=0.9' 'python2-numpy>=1.6' 'cfitsio' 'python2-pyside')
optdepends=(
  'getdata: provides support for files in the Dirfile format'
  'libmatio: provides support for Matlab binary files'
)
makedepends=('cmake')
#install=$pkgname.install
source=("git://github.com/Kst-plot/kst.git" "0001-Fixed-compilation-error-for-ambiguous-overload-off-a.patch" "0001-fixed-issue-where-src-kst-CMakeLists.txt-was-referri.patch")
md5sums=('SKIP' '43dad5d63cf1d3415a5dda3df2e02c08' '7e908388bf2127b499fb2f60c1e9907f')
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
	patch -p1 < ../0001-Fixed-compilation-error-for-ambiguous-overload-off-a.patch
	patch -p1 < ../0001-fixed-issue-where-src-kst-CMakeLists.txt-was-referri.patch
}
package() {
  cd "${srcdir}/${_pkgname}"
  make -j$(nproc) DESTDIR="${pkgdir}" install
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}