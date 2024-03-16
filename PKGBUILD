# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=cabal-fmt-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.1.11.r0.gce46d2a
pkgrel=1
pkgdesc="Format .cabal files"
arch=('i686' 'x86_64')
url="https://github.com/phadej/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('cabal-install')
source=("${pkgname}::git+${url}.git")
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
  git describe --long --tags --match='v*' \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cabal v2-configure \
    -O --jobs --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests
  cabal v2-build
}

check() {
  cd "$pkgname"
  cabal v2-test
}

package() {
  cd "$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  cabal v2-install --install-method=copy --installdir "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
