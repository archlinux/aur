# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>

pkgname=choosenim
pkgdesc='Installs different versions of Nim compiler and tools and switches between them'
url='https://github.com/nim-lang/choosenim'
license=(BSD-3-Clause)
pkgver=0.8.12
pkgrel=3
arch=(x86_64)
depends=(curl glibc)
makedepends=(git)
provides=(nim nimble nimgrep nimpretty nimsuggest)
conflicts=(nim)
optdepends=(
  'clang: C/C++ backend'
  'gcc: C/C++ backend'
)
_nimver=2.2.0
install=choosenim.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nim-lang/choosenim/archive/refs/tags/v$pkgver.tar.gz"
        'choosenim-execv.patch')
source_x86_64=("https://nim-lang.org/download/nim-$_nimver-linux_x64.tar.xz")
sha256sums=('ddb5fe412849d18ee4f851af4bdca3d00d81e2222f7d90993b26e45b168b899c'
            '3338ca31166f91500ea55b0f72eca54caedf622adba4a8794b41cb9778a83169')
sha256sums_x86_64=('942e047879fd81193b2ff3c105436a0c5016800c4e97864f90039ae204f89ded')

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
