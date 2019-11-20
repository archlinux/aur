# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
_pkgname=scala
pkgbase=scala_2.12
pkgname=(scala_2.12 scala-docs_2.12 scala-sources_2.12)
pkgver=2.12.10
pkgrel=1
_watch="https://github.com/scala/scala/releases"
_distdate=20181127-085200
_distsha=38cd84d976
pkgdesc="A Java-interoperable language with object-oriented and functional features. This is the maintenance version of Scala 2.12."
arch=('any')
url="http://www.scala-lang.org"
license=('Apache')
depends=('java-environment=8' 'java-runtime=8')
conflicts=('scala' 'scala-docs' 'scala-sources' 'java-environment<7')
makedepends=('git' 'sbt')
source=("scala-${pkgver}.tar.gz::https://github.com/scala/scala/archive/v${pkgver}.tar.gz"
        "scala-docs-${pkgver}.tar.xz::http://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
sha512sums=('30079ee83e89c189e84e94068f261aafe1fd7fe0cb4177e2802ac85372c4c2272c5af2b57424ab90e5236cbaca2f30936635f8f3bb4bfb2c748483e9c52ae96e'
            '476115e85ce5f7e75613341ca6c88da1fccdf3b4e8d28d20af7ac65734c4fd970a85a1453e7c93f5ca2af12b2644942a0a08f46f0a3075604161b9fe0e957044')

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
  pkgdesc="Scala documentation"
  depends=()

  cd "${srcdir}/scala-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/doc/"
  cp -r api "${pkgdir}/usr/share/doc/scala"
  install -Dm0644 "${srcdir}/scala-${pkgver}/doc/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_scala-sources_2.12() {
  replaces=('scala-src')
  pkgdesc="Scala sources"
  depends=()

  cd "${srcdir}/scala-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/scala/"
  find . -type f -name '*-sources.jar' | while read f; do
    install -Dm0644 "${f}" "${pkgdir}/usr/share/scala/src/$(basename -- ${f})"
  done
  install -Dm0644 "${srcdir}/scala-${pkgver}/doc/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

