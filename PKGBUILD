# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>

_nimver=2.2.4
pkgname=choosenim
pkgdesc='Installs different versions of Nim compiler and tools and switches between them'
url='https://github.com/nim-lang/choosenim'
license=(BSD-3-Clause)
pkgver=0.8.16
pkgrel=1
arch=(x86_64)
depends=(curl glibc)
makedepends=(git)
provides=(nim nimble nimgrep nimpretty nimsuggest)
conflicts=(nim)
optdepends=(
  'clang: C/C++ backend'
  'gcc: C/C++ backend'
)
install=choosenim.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nim-lang/choosenim/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("https://nim-lang.org/download/nim-$_nimver-linux_x64.tar.xz")
sha256sums=('b8549caa82bdc61025867262f11852ff948e0873f9ba27536b81e8473d5bc5e8')
sha256sums_x86_64=('791802138aaf19c8579232c50b4998ce2ae2928b791127ce5b4ef3c7af53fb46')

prepare() {
  cd $pkgname-$pkgver
  # we compile proxyexe in a separate step
  sed -i -e 's/compileProxyexe()/discard/' src/choosenimpkg/switcher.nim

  if [[ "$CARCH" = "x86_64" ]]; then
    # use official Nim binary distribution for bootstrapping
    export PATH="$srcdir/nim-$_nimver/bin:/usr/bin:/usr/local/bin"
  fi

  # download third-party dependencies here instead of during build
  nimble install -y --depsOnly --nimbleDir:"$srcdir"/nimble
}

build() {
  cd $pkgname-$pkgver
  if [[ "$CARCH" = "x86_64" ]]; then
    export PATH="$srcdir/nim-$_nimver/bin:/usr/bin:/usr/local/bin"
  fi
  nimble c -y -d:release -d:strip --offline --nimbleDir:"$srcdir"/nimble src/choosenimpkg/proxyexe
  nimble build -y -d:release --offline --nimbleDir:"$srcdir"/nimble
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -s bin/choosenim -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: sw=2 ts=2 et:
