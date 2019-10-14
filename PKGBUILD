# Maintainer: Daniel Moch <daniel@danielmoch.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian at liem dot se>

_name=slock
pkgname=slock-pam
pkgver=1.4
pkgrel=1
pkgdesc="A simple screen locker for X with patch for PAM auth"
arch=('x86_64')
url="https://tools.suckless.org/slock"
license=('MIT')
provides=('slock')
conflicts=('slock')
depends=('libxext' 'libxrandr' 'pam')
makedepends=('pam')
source=("https://dl.suckless.org/tools/$_name-$pkgver.tar.gz"
        'https://tools.suckless.org/slock/patches/pam_auth/slock-pam_auth-20190207-35633d4.diff')
sha256sums=('b53849dbc60109a987d7a49b8da197305c29307fd74c12dc18af0d3044392e6a'
            '4ccb97fc919c7bb63c380116c7fbb783277de4388b72a1d9e02932ba938b9036')

prepare() {
  cd "$srcdir/slock-$pkgver"
  sed -i 's|static const char \*group = "nogroup";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
  patch -Np1 -i "${srcdir}/slock-pam_auth-20190207-35633d4.diff"
}

build() {
  cd "$srcdir/slock-$pkgver"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/slock-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
