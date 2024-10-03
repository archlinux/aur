#!/usr/bin/env bash
#
# Maintainer: David Strawn <isomarcte at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

# shellcheck disable=SC2034
pkgbase=scala
pkgname=(scala scala-docs scala-sources)
pkgver=2.13.15
# shellcheck disable=SC2034
pkgrel=2
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
sha512sums=('fdb5daf8758a69e83b02fb6aad1d10e6f2378a40593d39a536ffdb7603120db3d62961f14c83c960970ac44dfe83b58f02842d9e14642df307aa4b539abcf1e3'
            'cbb9b2a40f9f29ace702c3971b32fbd4f7325f5a2a2b0f36e9b101d447ea4fa8944cdcbeca434c3cb5ce41451549da5fbf8ca3160bd408d2577129bf9afce905')

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

  ln -s "${srcdir}/scala-${pkgver}/build/share/scala/bin/fsc" "${pkgdir}/usr/bin/fsc"
  ln -s "${srcdir}/scala-${pkgver}/build/share/scala/bin/scala" "${pkgdir}/usr/bin/scala"
  ln -s "${srcdir}/scala-${pkgver}/build/share/scala/bin/scalac" "${pkgdir}/usr/bin/scalac"
  ln -s "${srcdir}/scala-${pkgver}/build/share/scala/bin/scalap" "${pkgdir}/usr/bin/scalap"
  ln -s "${srcdir}/scala-${pkgver}/build/share/scala/bin/scaladoc" "${pkgdir}/usr/bin/scaladoc"
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
