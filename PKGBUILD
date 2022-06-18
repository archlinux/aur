# former maintainer: Jeremy Audet <jerebear@protonmail.com>
#
# namcap warns that 'libcups' is an unnecessary dependency. This is untrue.
# Splitter will produce the following exception if libcups is not installed:
#
#     Exception in thread "main" java.lang.UnsatisfiedLinkError:
#     /usr/lib/jvm/java-7-openjdk/jre/lib/amd64/headless/libmawt.so:
#     libcups.so.2: cannot open shared object file: No such file or directory
#
# namcap also warns that 'java-environment' is a dependency. This is untrue:
# java-runtime suffices.

pkgname=splitter
pkgrel=1
pkgver=652
pkgdesc='Utility for splitting OpenStreetMap maps into tiles.'
url='http://www.mkgmap.org.uk/'
license=(GPL)
arch=(any)
depends=(java-runtime=8 sh libcups)
source=("http://www.mkgmap.org.uk/download/${pkgname}-r${pkgver}.zip")
sha256sums=('782cac7257f92bdef1f4f59675d812206fb8ed105440b2b510337755193a15aa')

package() {
  cd "${srcdir}/${pkgname}-r${pkgver}"

  # Install the executable and jar file.
  mkdir -p "${pkgdir}/usr/bin"
  echo """#!/usr/bin/env sh
java -jar /usr/share/java/splitter/splitter.jar \$@""" > "${pkgdir}/usr/bin/${pkgname}"
  chmod a+x "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  # Install libraries. Destination dir created when installing jar file.
  cp -r lib/ "${pkgdir}/usr/share/java/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
