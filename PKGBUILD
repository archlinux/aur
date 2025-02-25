#!/usr/bin/env bash
#
# Maintainer: David Strawn <isomarcte at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

# shellcheck disable=SC2034
pkgbase=scala
pkgname=(scala scala-docs scala-sources)
pkgver=2.13.16
# shellcheck disable=SC2034
pkgrel=1
pkgdesc='A Java-interoperable language with object-oriented and functional features'
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
url='https://www.scala-lang.org'
# shellcheck disable=SC2034
license=('Apache-2.0')
# shellcheck disable=SC2034
makedepends=('git' 'sbt' 'jdk8-openjdk')
# shellcheck disable=SC2034
source=("scala-${pkgver}.tar.gz::https://github.com/scala/scala/archive/v${pkgver}.tar.gz"
        "scala-docs-${pkgver}.tar.xz::https://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
# shellcheck disable=SC2034
sha512sums=('2bdf3ccfa81974fc668214eab72c469d1819594a532d9c3e0fa68684d8085427fdce0a00983175f7c67803a023dc540cc757d8179427095306ee5738be851ceb'
            'aacc4e3033b698b2024b7dfd39ca4337a05cd51484f5c7cd7733d54ca85ffe1c0db96ca4ca2a71cc9f4a7d0a68bfa2d0cf02df0ae7a076fbf2b18fcd0a5e302f')

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

  install -d "${pkgdir:?}/usr/"{bin,share} "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/scala/"{bin,lib}
  cp -r "${srcdir}/scala-${pkgver}/build/pack/lib" "${pkgdir}/usr/share/scala/"
  install -m755 "${srcdir}/scala-${pkgver}/build/pack/bin/"{fsc,scala,scalac,scalap,scaladoc} "${pkgdir}/usr/share/scala/bin"

  ln -s '/usr/share/scala/bin/fsc' "${pkgdir}/usr/bin/fsc"
  ln -s '/usr/share/scala/bin/scala' "${pkgdir}/usr/bin/scala"
  ln -s '/usr/share/scala/bin/scalac' "${pkgdir}/usr/bin/scalac"
  ln -s '/usr/share/scala/bin/scalap' "${pkgdir}/usr/bin/scalap"
  ln -s '/usr/share/scala/bin/scaladoc' "${pkgdir}/usr/bin/scaladoc"
}

package_scala-docs() {
  replaces=('scala-doc' 'scala-devel-docs')
  pkgdesc='Scala documentation'
  depends=()

  mkdir -p "${pkgdir}/usr/share/doc/"
  cp -r "${srcdir}/scala-${pkgver}/api" "${pkgdir}/usr/share/doc/scala"
}

package_scala-sources() {
  replaces=('scala-src')
  pkgdesc='Scala sources'
  depends=()

  mkdir -p "${pkgdir}/usr/share/scala/"
  find "${srcdir}/scala-${pkgver}" -type f -name '*-sources.jar' | while read -r f; do
    install -Dm0644 "${f}" "${pkgdir}/usr/share/scala/src/$(basename -- "${f}")"
  done
}
