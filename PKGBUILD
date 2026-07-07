# Maintainer: effeffe <filippo dot falezza at outlook dot it>

pkgname=osp-tracker-git
_pkgname=osp-tracker
pkgver=6.3.5
arch=('x86_64')
pkgrel=2
pkgdesc='Tracker video analysis and modeling tool'
url='http://physlets.org/tracker/'
license=('GPL3')
provides=('osp-tracker')
conflicts=('osp-tracker')
depends=(
  'gtk2'
  'gconf'
  'java-runtime'
)
makedepends=(
  'java-environment=8'
  'rsync'
)
source=(
  tracker::git+https://github.com/OpenSourcePhysics/tracker.git#tag=version_${pkgver}
  osp::git+https://github.com/OpenSourcePhysics/osp.git#tag=version_${pkgver}
  "tracker.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '73664881f365a5640ca0c4ef83776105522ce3594f6961f2505766fea6bc361b'
)

build() {

  cd "${srcdir}"
  rm -Rf build # clear build if pre-existent
  mkdir build
  
  rsync -av "${srcdir}/osp/src/" "${srcdir}/build/"
  rsync -av "${srcdir}/tracker/src/" "${srcdir}/build/"

  cd "${srcdir}/build"
  local classpath="."
  # Aggregate all foundational libraries and video engine jars bundled upstream
  for jar in "${srcdir}/tracker/jars"/*.jar "${srcdir}/tracker/libraries"/*.jar; do
    if [ -f "$jar" ]; then
      classpath="${classpath}:${jar}"
    fi
  done
  msg2 'Starting Tracker compile'
  find . -name "*.java" > sources.txt
  /usr/lib/jvm/java-8-openjdk/bin/javac -cp "${classpath}" -d . @sources.txt
  /usr/lib/jvm/java-8-openjdk/bin/jar cfe tracker.jar org.opensourcephysics.cabrillo.tracker.Tracker .

}

package() {

  msg2 'Creating package'
  install -Dm644 "${srcdir}/build/tracker.jar" "${pkgdir}/opt/tracker/tracker.jar"

  # Extract and link all native xuggle / formatting jar libraries
  mkdir -p "${pkgdir}/opt/tracker/lib"
  cp "${srcdir}/tracker/jars"/*.jar "${pkgdir}/opt/tracker/lib/"
  cp "${srcdir}/tracker/libraries"/*.jar "${pkgdir}/opt/tracker/lib/"

  # Create execution binary referencing full classpath
  local runtime_cp="/opt/tracker/tracker.jar"
  for jar in "${pkgdir}/opt/tracker/lib"/*.jar; do
    if [ -f "$jar" ]; then
      runtime_cp="${runtime_cp}:/opt/tracker/lib/$(basename "$jar")"
    fi
  done

  cat <<EOF > "${pkgdir}/opt/tracker/tracker.sh"
#!/bin/sh
exec /usr/lib/jvm/java-8-openjdk/jre/bin/java -cp "${runtime_cp}" org.opensourcephysics.cabrillo.tracker.Tracker "\$@"
EOF
  chmod +x "${pkgdir}/opt/tracker/tracker.sh"

  msg2 'Creating desktop file and symlinks'
  install -D -m755 "${pkgdir}/opt/tracker/tracker.sh" ${pkgdir}/usr/bin/${_pkgname}
  install -D -m755 tracker.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m644 ${srcdir}/build/./org/opensourcephysics/cabrillo/tracker/resources/images/tracker_icon_32.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

}
