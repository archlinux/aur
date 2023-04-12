#!/usr/bin/env bash
#
# Maintainer: David Strawn <isomarcte at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

# shellcheck disable=SC2034
pkgbase=scala
pkgname=(scala scala-docs scala-sources)
pkgver=2.13.10
# shellcheck disable=SC2034
pkgrel=2
pkgdesc='A Java-interoperable language with object-oriented and functional features'
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
url='https://www.scala-lang.org'
# shellcheck disable=SC2034
license=('Apache')
# shellcheck disable=SC2034
makedepends=('git' 'sbt' 'jdk8-openjdk')
# shellcheck disable=SC2034
source=("scala-${pkgver}.tar.gz::https://github.com/scala/scala/archive/v${pkgver}.tar.gz"
        "scala-docs-${pkgver}.tar.xz::https://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
# shellcheck disable=SC2034
sha512sums=('7a89ee746d892640faf0ad3a91715c91bd174acbae22fde7dcbc16a71c6bd84d4f448071fd497a778ef5aaba48c306150e591ad1d2c263764aeac79bcc021529'
            '0ccbae59327b7a2254115d729f08c75e80c3d0f07a4ebd0f7947307b1cbd4a77a9581a8baa6bba0f98472485b441e5daaf153b9c78c0613c7886e9dc3e8650b3')

prepare() {
  chmod 0755 "${srcdir:?}/${pkgbase}-${pkgver}/tools"/*
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}" || exit 1

  ORIGINAL_PATH="${PATH:?}"
  JDK8_BIN_PATH='/usr/lib/jvm/java-8-openjdk/bin'

  if [ -d "${JDK8_BIN_PATH:?}" ]
  then
      # Force compilation with jdk8. This is because if it compiles
      # with a jdk > 8, Scala's type inference on certain calls to
      # java.nio classes can infer a more specific method type which
      # doesn't exist in jdk 8.
      export PATH="${JDK8_BIN_PATH:?}:${PATH:?}"
  fi

  sbt dist/mkPack packageSrc packageDoc

  PATH="${ORIGINAL_PATH:?}"
}

package_scala() {
  depends=('java-environment')
  optdepends=('scala-docs'
              'scala-sources'
              'graphviz: generate diagrams')

  cd "${srcdir}/scala-${pkgver}/build/pack" || exit 1

  install -d "${pkgdir:?}/usr/"{bin,share} "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/scala/"{bin,lib}
  cp -r lib "${pkgdir}/usr/share/scala/"
  install -m755 bin/{fsc,scala,scalac,scalap,scaladoc} "${pkgdir}/usr/share/scala/bin"

  ln -s '../share/scala/bin/fsc' "${pkgdir}/usr/bin/fsc"
  ln -s '../share/scala/bin/scala' "${pkgdir}/usr/bin/scala"
  ln -s '../share/scala/bin/scalac' "${pkgdir}/usr/bin/scalac"
  ln -s '../share/scala/bin/scalap' "${pkgdir}/usr/bin/scalap"
  ln -s '../share/scala/bin/scaladoc' "${pkgdir}/usr/bin/scaladoc"
}

package_scala-docs() {
  replaces=('scala-doc' 'scala-devel-docs')
  pkgdesc='Scala documentation'
  depends=()

  cd "${srcdir}/scala-${pkgver}" || exit 1
  mkdir -p "${pkgdir}/usr/share/doc/"
  cp -r api "${pkgdir}/usr/share/doc/scala"
}

package_scala-sources() {
  replaces=('scala-src')
  pkgdesc='Scala sources'
  depends=()

  cd "${srcdir}/scala-${pkgver}" || exit 1
  mkdir -p "${pkgdir}/usr/share/scala/"
  find . -type f -name '*-sources.jar' | while read -r f; do
    install -Dm0644 "${f}" "${pkgdir}/usr/share/scala/src/$(basename -- "${f}")"
  done
}
