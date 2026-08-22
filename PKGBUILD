# Maintainer: Austin Choi <austin.c.percussion@gmail.com>
pkgname=dusk-lang-bin
pkgver=1.15.1
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
sha256sums=('bf0e41c62dd122ab26aa7a28c574486e1a6737c4345635e7f5d52bde0c228367'
            '7c6b5a7b5ea34eda46fcce5533720d05451a03e0514c253f20c402fa0ccb5c27'
            'dcea7ab38b4752abf16fc7659c8bf4f3976609b1997b754c57e6a92967b2c766')
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
