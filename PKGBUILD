pkgname=mkgmap-splitter-svn
_pkgname=mkgmap-splitter
pkgver=653
pkgrel=1
pkgdesc='Split .osm or .pbf files to be processed by mkgmap for Garmin GPS devices'
url='http://www.mkgmap.org.uk'
license=(GPL2)
arch=(any)
depends=(java-runtime)
makedepends=(subversion apache-ant jdk8-openjdk)
conflicts=("${_pkgname}")
source=("${_pkgname}" "svn+https://svn.mkgmap.org.uk/mkgmap/splitter/trunk")
sha256sums=('d82a5189b5802c05a3e666888ea9fc90243864ae85eb113c7146ccc698ea22f0'
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
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
  ant
}

package() {
  cd "${srcdir}/trunk/dist"

  # Install the executable, jar file and man page.
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "splitter.jar" "${pkgdir}/usr/share/java/mkgmap/splitter.jar"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -r "doc"/* "${pkgdir}/usr/share/doc/${_pkgname}"

  # Install libraries. Destination dir created when installing jar file.
  mkdir -p "${pkgdir}/usr/share/java/${_pkgname}"
  cp -r "lib"/* "${pkgdir}/usr/share/java/${_pkgname}"

}
