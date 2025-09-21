# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=cabal-fmt-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.1.13.r3.gecdbe89
pkgrel=2
pkgdesc='Format .cabal files'
arch=('i686' 'x86_64')
url="https://github.com/phadej/${_pkgname}"
license=('GPL-3.0-or-later' 'BSD-3-Clause')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp')
makedepends=('git' 'cabal-install' 'ghc')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# based on fanficfare-git -- upstream doesn't consistently tag versions, so we
# have to create them for them
pkgver() {
  cd "$pkgname"
  cabalVer=v"$(awk -F' *: *' '$1 ~ /^[Vv]ersion/ { print $2 }' *.cabal)"
  if ! git show-ref --tags "$cabalVer" --quiet; then
    git tag "$cabalVer" \
      "$(git blame -L /^version:/,+1 *.cabal -p | head -n1 | cut -d' ' -f1)"
  fi
  git describe --tags --long --match='v*' \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cabal update hackage.haskell.org,$(TZ=UTC date +@%s --date='today 00:00')
  cabal configure --prefix=/usr --docdir=/usr/share/doc/"$pkgname" \
    --enable-tests
  cabal build --only-dependencies
}

build() {
  cd "$pkgname"
  cabal build --offline
}

check() {
  cd "$pkgname"
  cabal test
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cabal install --install-method=copy --installdir "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et
