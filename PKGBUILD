# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nim-legacy
_pkgname=Nim
_csourcesver=0.20.0
pkgver=1.0.6
pkgrel=1
pkgdesc='Imperative, multi-paradigm, compiled programming language'
url='https://nim-lang.org/'
arch=('x86_64')
license=('MIT')
depends=('python' 'bash')
options=('!emptydirs')
conflicts=('nim')
provides=('nim')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/nim-lang/Nim/archive/v${pkgver}.tar.gz
        csources-${_csourcesver}.tar.gz::https://github.com/nim-lang/csources/archive/v${_csourcesver}.tar.gz)
sha256sums=('f5826ee7a00059243f00898a47e910fd89484f7aa8ad8c91e2b914a013b83ed0'
            '5e6fd15d90df1a8cb7614c4ffc70aa8c4198cd854d7742016202b96dd0228d3c')
sha512sums=('ce5f97f2c6b84781647889646dc3d58c640f73d1b734ce32198526fa8fbe4a118a40c1c86610c990b30921ecc800087ac98ca3c22d479727b6a0096ca241fbd0'
            '4da00678cb92cfd3b2425e4698cbbef8111c711f9457ba969367638437b5fad7928ca0a91fd24f53dcd9d341cfc420e87ec85d245767531bc57ccafd6feba258')

prepare() {
  cd ${_pkgname}-${pkgver}
  [[ -d csources ]] || mv ../csources-${_csourcesver} csources
  rm bin/empty.txt
}

build() {
  cd ${_pkgname}-${pkgver}
  export PATH="${srcdir}/${_pkgname}-${pkgver}/bin:${PATH}"

  msg2 "Building nim"
  (cd csources
    sh build.sh
  )
  msg2 "Building koch"
  nim c -d:release koch
  ./koch boot -d:release -d:nativeStacktrace -d:useGnuReadline

  msg2 "Building libs"
  (cd lib
    nim c --app:lib -d:createNimRtl -d:release nimrtl.nim
  )
  msg2 "Building tools"
  (cd tools
    nim c -d:release nimgrep.nim
  )
  msg2 "Building nimsuggest"
  nim c -d:release nimsuggest/nimsuggest.nim
}

package() {
  cd ${_pkgname}-${pkgver}
  export PATH="${srcdir}/${_pkgname}-${pkgver}/bin:${PATH}"

  ./koch install "${pkgdir}"

  install -d "${pkgdir}/usr/lib"
  cp -a lib "${pkgdir}/usr/lib/nim"
  cp -a compiler "${pkgdir}/usr/lib/nim"
  install -Dm 644 compiler.nimble "${pkgdir}/usr/lib/nim/compiler"
  install -m 755 lib/libnimrtl.so "${pkgdir}/usr/lib/libnimrtl.so"

  # Fix FS#48118, related to the doc2 command
  ln -s /usr/share/nim/doc "${pkgdir}/usr/lib/nim/doc"

  install -Dm 644 config/* -t "${pkgdir}/etc"
  install -Dm 755 bin/* tools/nimgrep nimsuggest/nimsuggest -t "${pkgdir}/usr/bin"

  # Fix FS#50252, unusual placement of header files
  install -d "${pkgdir}/usr/include"
  cp -a "${pkgdir}/usr/lib/nim/"*.h "${pkgdir}/usr/include"

  install -d "${pkgdir}/usr/share/nim/doc"
  cp -a examples doc/* "${pkgdir}/usr/share/nim/doc"

  install -Dm 644 copying.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/nim"
}
