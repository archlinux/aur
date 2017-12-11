# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Gour <gour@atmarama.net>
#
# namcap warns that 'java-environment' is a dependency. This is untrue:
# java-runtime suffices.
#

pkgname=mkgmap-svn
_pkgname=mkgmap
pkgver=3617
pkgrel=1
pkgdesc='Create maps for Garmin GPS devices from OpenStreetMap (OSM) data.'
url='http://www.mkgmap.org.uk'
license=(GPL2)
arch=(any)
depends=(java-runtime)
makedepends=(subversion apache-ant)
conflicts=("${_pkgname}")
source=("${_pkgname}" "svn+http://svn.mkgmap.org.uk/${_pkgname}/trunk")
sha256sums=('135dfbca5146cea34ef48ed6908a817efdfbbcccbb8adfbbb6a100f58c2c7bb6'
            'SKIP')

pkgver() {
  # -c makes svnversion show the version of "trunk", not the version of the
  # repository as a whole. Unfortunately, -c also makes svnversion show the full
  # range of revisions that comprise "trunk". For example:
  #
  # svnversion => 2756
  # svnversion -c => 53:2754
  #
  # Use parameter expansion trickery to strip off the leading number and colon.
  cd trunk
  local readonly ver="$(svnversion -c)"
  echo "${ver#*:}"
}

build() {
  cd "${srcdir}/trunk"
  ant
}

package() {
  cd "${srcdir}/trunk/dist"

  # Install the executable, jar file and man page.
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.jar" \
    "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  install -Dm644 "doc/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  # Install libraries. Destination dir created when installing jar file.
  cp -r lib/ "${pkgdir}/usr/share/java/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
