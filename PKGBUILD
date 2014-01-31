# Contributor: Jan Cholasta <grubber at grubber cz>
# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade
pkgver=3.1.0_b3
pkgrel=2
pkgdesc="SLADE3 Doom editor."
arch=('i686' 'x86_64')
url="http://slade.mancubus.net/"
license=('GPL')
depends=('fluidsynth' 'freeimage' 'ftgl' 'libmodplug' 'sfml' 'wxgtk>=3.0')
makedepends=('cmake' 'imagemagick' 'zip')
source=(https://github.com/sirjuddington/SLADE/archive/$pkgver.tar.gz
        git-76d98460.patch
        git-df5cd54e.patch
        git-54f7e8cb.patch
        slade.desktop)
md5sums=('121cdfac8f829904e6293842fefd4775'
         '46f472e312593da775779ebb0998ece6'
         'a08cfe25732ea04c9340b9189a857e7a'
         '358d0b8f5abef1c8f974dac37cae97cc'
         '49eb1692463e2aa93ea2754a5df7a6e4')

prepare() {
  cd SLADE-$pkgver

  patch -p1 <"$srcdir/git-76d98460.patch"
  patch -p1 <"$srcdir/git-df5cd54e.patch"
  patch -p1 <"$srcdir/git-54f7e8cb.patch"
}

build() {
  cd SLADE-$pkgver

  cmake -DCMAKE_CXX_FLAGS=-DNDEBUG \
        .
  make

  pushd dist/res
  zip -r ../slade.pk3 *
  popd

  convert "slade.ico[0]" slade.png
}

package() {
  cd SLADE-$pkgver

  install -Dm755 slade "$pkgdir/usr/bin/slade"
  install -Dm644 dist/slade.pk3 "$pkgdir/usr/share/slade3/slade.pk3"

  install -Dm644 slade.png "$pkgdir/usr/share/pixmaps/slade.png"
  install -Dm644 "$srcdir/slade.desktop" "$pkgdir/usr/share/applications/slade.desktop"
}
