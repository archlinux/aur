# Maintainer: Austin Choi <austin.c.percussion@gmail.com>
pkgname=dusk-lang-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Compiler for the dusk programming language, a systems language with generational memory safety (release binary)"
# The release binary is the x86_64 linux build the release's stage ladder
# proved; other platforms build from source through dusk-lang-git.
arch=('x86_64')
url="https://github.com/choice404/dusk"
license=('MIT OR Apache-2.0')
# dusk shells out to clang at run time to link, and the IR it emits targets
# exactly one LLVM major version, so pin to LLVM 22.x.
depends=('clang>=22' 'clang<23')
optdepends=('git: package fetching through the dawn tool')
provides=('dusk-lang')
conflicts=('dusk-lang' 'dusk-lang-git' 'dawn')
options=('!debug')
# Nothing is compiled here: the compiler, the package tool, and the share
# archive (the standard library, the C runtime, and the docs) all come from
# the tagged release, written by the same stage ladder that proved the binary,
# so the three always agree and every checksum is known before the tag moves.
source=("dusk-bin-${pkgver}::https://github.com/choice404/dusk/releases/download/v${pkgver}/dusk"
        "dawn-bin-${pkgver}::https://github.com/choice404/dusk/releases/download/v${pkgver}/dawn"
        "dusk-share-${pkgver}.tar.gz::https://github.com/choice404/dusk/releases/download/v${pkgver}/dusk-share.tar.gz")
sha256sums=('dba96038226cd35ae5f1993a47b0bea5eca3678ad53902d8f6bc60ad5a4b939c'
            '61f97eee92a9356adf6faf9eee6c277aa3a1e10e54769e5b698de7d0763fbe2b'
            'c7956f13d111c71dbc2d20fa08ed29847a9314134b83f729271fbe0f7745cedd')
noextract=("dusk-bin-${pkgver}" "dawn-bin-${pkgver}")

check() {
  # The binaries must be the release they claim to be before they are installed.
  chmod +x "dusk-bin-${pkgver}" "dawn-bin-${pkgver}"
  [ "$(./dusk-bin-${pkgver} version)" = "dusk ${pkgver}" ]
  [ "$(./dawn-bin-${pkgver} version)" = "dawn ${pkgver}" ]
}

package() {
  install -Dm755 "dusk-bin-${pkgver}" "$pkgdir/usr/bin/dusk"
  install -Dm755 "dawn-bin-${pkgver}" "$pkgdir/usr/bin/dawn"
  cd "dusk-share-${pkgver}"
  install -dm755 "$pkgdir/usr/share/dusk-lang"
  cp -r lib runtime "$pkgdir/usr/share/dusk-lang/"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 spec.md "$pkgdir/usr/share/doc/$pkgname/spec.md"
}
