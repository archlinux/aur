#!/usr/bin/env bash
#
# Maintainer: David Strawn <isomarcte at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

# shellcheck disable=SC2034
pkgbase=scala
pkgname=(scala scala-docs scala-sources)
pkgver=2.13.12
# shellcheck disable=SC2034
pkgrel=1
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
sha512sums=('3b1b3c86bfb625e8e95d073d7b54983e71bf00d13b9f2cc837e5a4a3e67e42b6a9750599e4f4c6125d449d5bfa9d0e4c738842af37bfce1b07f8288aaaaff22f'
            '28b1ad2399ebdb04a1dcb553ccf62ba7facce0035f95265c6f33297ec9c5191c70c0150932ee9df29c22cd80934e18a419a5ccbe76fa95f12e5ec708081dae68')

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
