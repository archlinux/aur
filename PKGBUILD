# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>

pkgname=choosenim
pkgdesc='Installs different versions of Nim compiler and tools and switches between them'
url='https://github.com/nim-lang/choosenim'
license=(BSD-3-Clause)
pkgver=0.8.5
pkgrel=1
arch=(x86_64)
depends=(glibc curl)
makedepends=(git nim nimble)
provides=(nim nimble nimgrep nimpretty nimsuggest)
optdepends=(
  'clang: C/C++ backend'
  'gcc: C/C++ backend'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nim-lang/choosenim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11c3cfdc8623a5882cbec03a863915a7d1be1bd92e9c0f167b23b772bf44d756')

prepare() {
  cd $pkgname-$pkgver
  # we compile proxyexe in a separate step
  sed -i -e '/static: compileProxyexe()/d' src/choosenimpkg/switcher.nim
  # download third-party dependencies here instead of during build
  nimble install -y --depsOnly --nimbleDir:"$srcdir"/nimble
}

build() {
  cd $pkgname-$pkgver
  nimble c -y -d:release --offline --nimbleDir:"$srcdir"/nimble src/choosenimpkg/proxyexe
  nimble build -y -d:release --offline --nimbleDir:"$srcdir"/nimble
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -s bin/choosenim -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: sw=2 ts=2 et:
