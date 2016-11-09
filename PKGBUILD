# Maintainer: aksr <aksr at t-com dot me>
pkgname=scrollz-git
pkgver=2.3.r1646.8eae44d
pkgrel=1
pkgdesc="An advanced IRC client based on ircII client."
arch=('i686' 'x86_64')
url="https://github.com/ScrollZ/ScrollZ"
license=('custom')
groups=()
depends=('ncurses' 'openssl')
makedepends=('git')
optdepends=()
provides=('scrollz')
conflicts=('scrollz')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+git://github.com/ScrollZ/ScrollZ.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/ScrollZ.//')" \
         "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  patch -p1 -i $srcdir/makefile.diff
}

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr   \
              --enable-regexp \
              --enable-fish   \
              --enable-ipv6   \
              --with-openssl  \
              --with-default-server=chat.freenode.net:6667
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

