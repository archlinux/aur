# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=cabal-fmt-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.1.6.r1.g6651ffd
pkgrel=1
pkgdesc="Format .cabal files"
arch=('i686' 'x86_64')
url="https://github.com/phadej/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('cabal-install')
source=("${pkgname}::git+${url}.git"
    0001-Build-with-GHC-8.10.4-and-9.0.1.patch)
sha256sums=('SKIP'
            '32deb5f7a9278a989980fb19740504c362cdc8787717ee506ec2c3bb3f13690b')

# based on fanficfare-git -- upstream doesn't consistently tag versions, so we
# have to create them for them
pkgver() {
  cd "$pkgname"
  git tag -f \
    v"$(sed -n '/^version:/{s/^version:\s*//;p}' *.cabal)" \
    "$(git blame -L /^version:/,+1 *.cabal -p | head -n1 | cut -d' ' -f1)"
  git describe --long --tags --match='v*' \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git am ../0001-Build-with-GHC-8.10.4-and-9.0.1.patch
  # patch --forward --strip=1 \
  #   --input="${srcdir}/0001-Build-with-GHC-8.10.4-and-9.0.1.patch"
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
