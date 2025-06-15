# Contributor:  TDY <tdy@archlinux.info>

pkgname=echinus-git
pkgver=0.4.9.r35.g987e139
pkgrel=1
pkgdesc="A window manager for X in the spirit of dwm"
arch=('i686' 'x86_64')
url="https://plhk.ru/"
license=('MIT')
depends=('libxft' 'libxrandr')
makedepends=('git' 'pkgconfig')
optdepends=('ourico: complementary taskbar for echinus')
provides=('echinus')
conflicts=('echinus')
install=echinus.install
source=($pkgname::git+https://github.com/polachok/echinus.git
        fix-incompatible-pointer-types.patch
        echinus.desktop)
sha256sums=('SKIP'
            'e31aa3b0a8804e98d9d066206a2ee861b7b806c6ed4b12e973f150d6c85cfefb'
            '8e86f3550b66701fe2f481b556df05b0d06647b470f1adb8bfa50cd55df4bf9b')

pkgver() {
  cd $pkgname
  git tag 0.4.9 5786ee16a2281ec3a782a99824e5ad15cda7ec77 || :
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p1 < ../fix-incompatible-pointer-types.patch
}

build() {
  cd $pkgname
  make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" CONF=/share/echinus/examples install
  install -Dm644 echinus.1 "$pkgdir/usr/share/man/man1/echinus.1"
  install -Dm644 README "$pkgdir/usr/share/doc/echinus/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../echinus.desktop \
    "$pkgdir/usr/share/xsessions/echinus.desktop"
}

# vim:set ts=2 sw=2 et:
