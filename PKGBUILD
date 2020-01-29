# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nim-legacy
_pkgname=Nim
pkgver=0.18.0
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
        csources-${pkgver}.tar.gz::https://github.com/nim-lang/csources/archive/v${pkgver}.tar.gz)
sha256sums=('9b9982f349fb96db44020a6da14fa683179b637a3d94782e2c99156ac613e187'
            'e9aff9d58661ea852ae424ba34fc3750b45fb31982645a3038de2300bea2d17c')
sha512sums=('b4c4ca78bfb310eba7cd105cc43bdb64b013ef90e06613e8d9af460b3f57ccdb4d4fc49f100bb4a5c0f06d45664197b68e69d5bf8ac724c0c849863082aa3a66'
            'e89324e3d091e1a29b5d0110bf9de7fba2438ce1f37bddcfd5cb4dde3bf31ab906c4576b623a5d70504c3430dad737898474e17d6c0eef41c1effd438d0cc571')

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
