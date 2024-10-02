# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>

pkgname=choosenim
pkgdesc='Installs different versions of Nim compiler and tools and switches between them'
url='https://github.com/nim-lang/choosenim'
license=(BSD-3-Clause)
pkgver=0.8.9
pkgrel=1
arch=(x86_64)
depends=(glibc curl)
makedepends=(git)
provides=(nim nimble nimgrep nimpretty nimsuggest)
conflicts=(nim)
optdepends=(
  'clang: C/C++ backend'
  'gcc: C/C++ backend'
)
_nimver=2.0.8
install=choosenim.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nim-lang/choosenim/archive/refs/tags/v$pkgver.tar.gz"
        'choosenim-execv.patch::https://patch-diff.githubusercontent.com/raw/nim-lang/choosenim/pull/38.patch')
source_x86_64=("https://nim-lang.org/download/nim-2.0.8-linux_x64.tar.xz")
sha256sums=('56824e0bd694afe0eeb22cef1b58a1e1b7e31d7ff573692347210d2f3c46ef71'
            'cc3967087b2002a0e346aa65b628b89f9373c1755dfe3469d7ff88f1db322a9e')
sha256sums_x86_64=('c971320d391db30917b3b61c471cff4b3cd3cd883d4f7af099d3c9018cc15683')

prepare() {
  cd $pkgname-$pkgver
  # we compile proxyexe in a separate step
  sed -i -e '/static: compileProxyexe()/d' src/choosenimpkg/switcher.nim
  # Fix for https://github.com/nim-lang/choosenim/issues/13
  patch -p1 -N -r - -i "$srcdir"/choosenim-execv.patch

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
  nimble c -y -d:release --offline --nimbleDir:"$srcdir"/nimble src/choosenimpkg/proxyexe
  strip src/choosenimpkg/proxyexe
  nimble build -y -d:release --offline --nimbleDir:"$srcdir"/nimble
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -s bin/choosenim -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: sw=2 ts=2 et:
