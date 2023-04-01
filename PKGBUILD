# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

pkgbase=scala
pkgname=(scala scala-docs scala-sources)
pkgver=2.13.8
pkgrel=1
_watch="https://github.com/scala/scala/releases"
_distdate=20190531-142000
_distsha=43e040ff7e
pkgdesc="A Java-interoperable language with object-oriented and functional features"
arch=('any')
url="https://www.scala-lang.org"
license=('Apache')
depends=('java-environment=8' 'java-runtime=8')
makedepends=('git' 'sbt')
source=("scala-${pkgver}.tar.gz::https://github.com/scala/scala/archive/v${pkgver}.tar.gz"
        "scala-docs-${pkgver}.tar.xz::https://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
sha512sums=('cba6a474ec0f1ec926b345b1905a79ea03055bb7dba3863d11002a18ee05dafd68d58e4351e253754fac6493c82dc117608613fba5dc2cc641ef23dc046ad3ee'
            '0b985701e6873d083203dfde88b5c695d449638933c42699c46fc88221ed7b83f14723b2903bfbc93a5406bf58a679c78c3427ce0651acd91b76fea78be47877')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  chmod 0755 tools/*
  echo -e "#!/bin/bash\necho ${_distdate}" > "tools/get-scala-commit-date"
  echo -e "#!/bin/bash\necho ${_distsha}" > "tools/get-scala-commit-sha"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sbt dist/mkPack packageSrc packageDoc
}

package_scala() {
  depends=('java-runtime')
  optdepends=('scala-docs'
              'scala-sources'
              'graphviz: generate diagrams')

  cd "${srcdir}/${pkgname}-${pkgver}/build/pack"

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

package_scala-docs() {
  replaces=('scala-doc' 'scala-devel-docs')
  pkgdesc="Scala documentation"
  depends=()

  cd "${srcdir}/scala-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/doc/"
  cp -r api "${pkgdir}/usr/share/doc/scala"
  install -Dm0644 "${srcdir}/scala-${pkgver}/doc/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_scala-sources() {
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
