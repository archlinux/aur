# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
_pkgname=scala
pkgbase=scala_2.12
pkgname=(scala_2.12 scala-docs_2.12 scala-sources_2.12)
pkgver=2.12.18
pkgrel=1
_watch="https://github.com/scala/scala/releases"
_distdate=20181127-085200
_distsha=38cd84d976
pkgdesc="A Java-interoperable language with object-oriented and functional features. This is the maintenance version of Scala 2.12."
arch=('any')
url="https://www.scala-lang.org"
license=('Apache')
depends=('java-environment>=8' 'java-runtime>=8')
conflicts=('scala' 'scala-docs' 'scala-sources' 'java-environment<8')
makedepends=('git' 'sbt')
source=("scala-${pkgver}.tar.gz::https://github.com/scala/scala/archive/v${pkgver}.tar.gz"
        "scala-docs-${pkgver}.tar.xz::https://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
sha512sums=('26e424ae2350502f40899bc812200a943492c5cfa7c6f7252912d853db1986ed1b48a0337f78ba4061b7ec69ba2899b690af65fbd66773b3e0a9d685203c35b5'
            '3d434c9a1782df29163d8c8119bf7f0250723d034a01f2b2ea9c396683a4a0c69a5e93950248145d26a234e01fbf6a77f0ded7061e6068ce0f71c0069093165d')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod 0755 tools/*
  echo -e "#!/bin/bash\necho ${_distdate}" > "tools/get-scala-commit-date"
  echo -e "#!/bin/bash\necho ${_distsha}" > "tools/get-scala-commit-sha"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sbt dist/mkPack packageSrc packageDoc
}

package_scala_2.12() {
  depends=('java-runtime')
  optdepends=('scala-docs_2.12'
              'scala-sources_2.12'
              'graphviz: generate diagrams')

  cd "${srcdir}/${_pkgname}-${pkgver}/build/pack"

  install -d "${pkgdir}/usr/"{bin,share} "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/scala/"{bin,lib}
  cp -r lib "${pkgdir}/usr/share/scala/"
  install -m755 bin/{fsc,scala,scalac,scalap,scaladoc} "${pkgdir}/usr/share/scala/bin"
  install -Dm0644 "${srcdir}/scala-${pkgver}/doc/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  ln -s "../share/scala/bin/fsc" "${pkgdir}/usr/bin/fsc"
  ln -s "../share/scala/bin/scala" "${pkgdir}/usr/bin/scala"
  ln -s "../share/scala/bin/scalac" "${pkgdir}/usr/bin/scalac"
  ln -s "../share/scala/bin/scalap" "${pkgdir}/usr/bin/scalap"
  ln -s "../share/scala/bin/scaladoc" "${pkgdir}/usr/bin/scaladoc"
}

package_scala-docs_2.12() {
  replaces=('scala-doc' 'scala-devel-docs')
  pkgdesc="Scala documentation. This is the maintenance version of Scala 2.12."
  depends=()

  cd "${srcdir}/scala-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/doc/"
  cp -r api "${pkgdir}/usr/share/doc/scala"
  install -Dm0644 "${srcdir}/scala-${pkgver}/doc/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_scala-sources_2.12() {
  replaces=('scala-src')
  pkgdesc="Scala sources. This is the maintenance version of Scala 2.12."
  depends=()

  cd "${srcdir}/scala-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/scala/"
  find . -type f -name '*-sources.jar' | while read f; do
    install -Dm0644 "${f}" "${pkgdir}/usr/share/scala/src/$(basename -- ${f})"
  done
  install -Dm0644 "${srcdir}/scala-${pkgver}/doc/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

