# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nim-legacy
_pkgname=Nim
pkgver=0.17.2
pkgrel=2
pkgdesc='Imperative, multi-paradigm, compiled programming language - legacy version to compile pakku'
url='https://nim-lang.org/'
arch=('x86_64')
license=('MIT')
depends=('python' 'bash')
options=('!emptydirs')
conflicts=('nim')
provides=('nim')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/nim-lang/Nim/archive/v${pkgver}.tar.gz
        csources-${pkgver}.tar.gz::https://github.com/nim-lang/csources/archive/v${pkgver}.tar.gz)
sha256sums=('eb8a98c7e576e8d858de98473569a29c539308fc7bb15a086b3f2b73d675f752'
            '7eb28ba7d5a03d02fc1c1fd9089c037de9c058d327fd6e95d599db63d9afa9c8')
sha512sums=('02d773a338cf4aeeedd614fbd694feb4b64c620e63415a979e9f4fdf29d306315ab8a07d81f7a5389744d6f526eee2b1774a1ee7a6911f5bd03bdbb0e30061e7'
            '4a8f1e87bd96ab33998b0d3415c0ba9560b78795e0396d8af8b588a93c23477097f2c5388b4e612fbc142b490480326b394a933c805a3585cd6f3d7e8390e3e6')

prepare() {
  cd ${_pkgname}-${pkgver}
  mv ../csources-${pkgver} csources
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
  cp -a examples web doc/* "${pkgdir}/usr/share/nim/doc"

  install -Dm 644 copying.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/nim" "${pkgdir}/usr/lib/nim/lib/nimcache"
}

# vim: ts=2 sw=2 et:
