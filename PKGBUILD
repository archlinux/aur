# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II/Final Doom-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz
        0001-bash-completion-Build-from-actual-shell-script-templ.patch)
sha512sums=('7b0a78e6521781f46997b3a9d0fb4bcdbae249bab1d2c926e3e48087dfc7f6963ae99291b0294e7555f96c3ddc6412d592a9020f20694d200f1ef7c3a8432a66'
            '88521a56d4075942e0219ce435d6c4e0a1f0ce4e5160730c33129b849230250c5fd7554b39d4838e5dd5aeedaf927e5b275642b795befd257dc799ff48870e1b')

prepare() {
  # GitHub's generated archive prefix kind of sucks.
  mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -rf share/man/man5/default.cfg.5              \
         share/man/man6/chocolate-{server,setup}.6
}
