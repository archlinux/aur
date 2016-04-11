# Maintainer: Darshit Shah <darnir@gmail.com>

_gitname=wget
pkgname=$_gitname-git
pkgver=1.17.1.r30.gd263770
pkgrel=1
pkgdesc="A network utility to retrieve files from the Web"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/wget/wget.html"
license=('GPL3')
depends=('libutil-linux' 'gnutls' 'libidn' 'libpsl>=0.7.1-3' 'gpgme')
optdepends=("ca-certificates: HTTPS Downloads")
checkdepends=('perl' 'perl-http-daemon' 'perl-io-socket-ssl' 'python')
makedepends=('git' 'perl' 'rsync')
provides=('wget')
conflicts=('wget')
backup=('etc/wgetrc')
install=wget.install
source=("git://git.savannah.gnu.org/${_gitname}.git"
        "git://git.savannah.gnu.org/gnulib.git")
md5sums=('SKIP' 'SKIP')

build() {
  cd $_gitname
  git submodule init
  git config submodule.gnulib.url "$srcdir/gnulib"
  ./bootstrap
  ./configure --prefix=/usr --without-included-regex --enable-nls --enable-dependency-tracking --with-ssl=gnutls --sysconfdir=/etc --enable-assert --with-metalink
  make
}

prepare() {
  cd $_gitname
  cat >> doc/sample.wgetrc <<EOF

# default root certs location
ca_certificate=/etc/ssl/certs/ca-certificates.crt
EOF
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd $_gitname
  #Use the tag from the last commit.
  git describe --always | sed 's/^v//; s/-/.r/; s/-/./g'
}

check() {
  cd $_gitname
  make check clean all
}

# vim:set ts=2 sw=2 tw=0 et:
