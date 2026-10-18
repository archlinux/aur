# Maintainer: Jonathan Lahav <j.lahav@gmail.com>

pkgname=husk-lang
_name=husk
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight Haskell implementation compiled to Chez Scheme"
arch=('x86_64')
url="https://github.com/SoleSoul/husk"
license=('MIT')
depends=('chez-scheme')
optdepends=('rlwrap: line editing and history in the REPL')
provides=('husk')
conflicts=('husk')
options=('!strip')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64c023f6c944798d195ffa97c462e2ff05fcb834d3ee220bdd39f9f5eb6b0b15')

build() {
  cd "$_name-$pkgver"
  # Compile the compiler ahead of time; the launcher only rebuilds it when
  # its sources are newer.
  HUSK_NO_CACHE=1 bin/husk --version
}

check() {
  cd "$_name-$pkgver"
  HUSK_NO_CACHE=1 HUSK_NO_RLWRAP=1 tests/run.sh
}

package() {
  cd "$_name-$pkgver"
  install -d "$pkgdir/usr/lib/$_name"
  cp -r bin src lib "$pkgdir/usr/lib/$_name/"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_name/bin/husk" "$pkgdir/usr/bin/husk"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/*.md
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
