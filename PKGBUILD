# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info
pkgver=1.7
pkgrel=1
pkgdesc="provides information about the distributions' releases"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/distro-info"
license=('MIT')
depends=('distro-info-data>=0.59' 'glibc' 'python')
makedepends=('dpkg')
checkdepends=('python-setuptools' 'shunit2')
provides=('python-distro-info' 'python3-distro-info' 'perl-distro-info')
conflicts=('python-distro-info' 'python3-distro-info' 'perl-distro-info')
options=('!emptydirs')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('6fa91b888320b74cd4391941092601a9bc33f3427d1d0ba93efcb7f31bcecf7e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i \
    -e 's/^\(LDFLAGS = .*\)/\1 '"${LDFLAGS}/" \
    -e 's/ --install-layout=deb//g' \
    Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test-commandline
  make test-perl
  # We don't want to test all installed python versions -> don't use "make test"
  # additionally the pylint and flake8 tests seem to fail currently
  #cd python
  #for pythonver in {python2,python}; do
  #  $pythonver setup.py test
  #done
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # vendor can currently be only ubuntu or debian
  # with ubuntu you can build for PPA (with bzr-builddeb)
  make DESTDIR="$pkgdir/" VENDOR="ubuntu" install
  install -D -m 644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
