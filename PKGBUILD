# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info
_python=python2
pkgver=0.10
pkgrel=1
pkgdesc="provides information about the distributions' releases"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/reportbug"
license=('MIT')
depends=('distro-info-data')
makedepends=('shunit2' 'perl' 'python-distribute' 'python2-distribute')
provides=('python-distro-info' 'python2-distro-info' 'perl-distro-info')
conflicts=('python-distro-info' 'python2-distro-info' 'perl-distro-info')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('1befc0430158f62a13a3c01ce4586ed5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/python3 setup.py/python2 setup.py/g' \
    -e 's/ --install-layout=deb//g' \
    Makefile
  make
}
check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test-commandline
  make test-perl
  cd python
  # We don't want to test all installed python versions -> don't use "make test"
  for pythonver in {python2,python}; do
    $pythonver setup.py test
  done
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  # vendor can currently be only ubuntu or debian
  # with ubuntu you can build for PPA (with bzr-builddeb)
  make DESTDIR="$pkgdir/" VENDOR="ubuntu" install
}

# vim:set ts=2 sw=2 et:
