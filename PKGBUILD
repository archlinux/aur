# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=cabal-fmt-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.1.6.r2.g166bcb4
pkgrel=1
pkgdesc="Format .cabal files"
arch=('i686' 'x86_64')
url="https://github.com/phadej/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('cabal-install')
source=("git+${url}.git" 0001-Build-with-GHC-8.10.4-and-9.0.1.patch)
sha256sums=('SKIP'
            '32deb5f7a9278a989980fb19740504c362cdc8787717ee506ec2c3bb3f13690b')

# based on fanficfare-git
pkgver() {
  cd "${srcdir}/${_pkgname}"
  git tag -f \
    v"$(sed -n '/^version:/{s/^version:\s*//;p}' *.cabal)" \
    "$(git blame -L /^version:/,+1 *.cabal -p | head -n1 | cut -d' ' -f1)"
  git describe --long --tags --match='v*' \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    git am ../0001-Build-with-GHC-8.10.4-and-9.0.1.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  cabal new-configure \
    -O --jobs --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests
  cabal new-build
}

check() {
  cd "${srcdir}/${_pkgname}"
  cabal new-test
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cabal new-install --install-method=copy --installdir "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
