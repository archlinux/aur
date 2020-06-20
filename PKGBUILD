# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Original: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian at liem dot se>

pkgname=slock-bgimage
_pkgname=slock
pkgver=1.4
pkgrel=1
pkgdesc="A simple screen locker for X(patched to allow background images)"
arch=('x86_64' 'i686' 'pentium4')
url="https://tools.suckless.org/slock"
license=('MIT')
depends=('libxext' 'libxrandr')
providies=("slock")
conflicts=("slock")
source=("https://dl.suckless.org/tools/${_pkgname}-$pkgver.tar.gz" "slock-image.patch")
#source=("slock-$pkgver.tar.bz2::https://hg.suckless.org/slock/archive/$_pkgver.tar.gz")
sha256sums=('b53849dbc60109a987d7a49b8da197305c29307fd74c12dc18af0d3044392e6a'
            'b782b0117c966b32d95cd0bd8b3acf570d2455a133e6b9033854ffc7c9ac81ca')

prepare() {
  cd "$srcdir/slock-$pkgver"
  patch -N < ../slock-image.patch
  sed -i 's|static const char \*group = "nogroup";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
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

