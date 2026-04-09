# Maintainer: AlexanderGhosty <byck.sash@gmail.com>
pkgname=fispro
pkgver=3.8
pkgrel=5
pkgdesc='Fuzzy inference systems software'
arch=('x86_64')
url='https://www.fispro.org/'
license=('CECILL-2.1')
options=('!makeflags')
depends=(
  'bash'
  'cblas'
  'gsl'
  'java-runtime=8'
  'libx11'
  'libglvnd'
  'libxext'
)
makedepends=(
  'jdk8-openjdk'
  'maven'
)
source=(
  "${pkgname}-${pkgver}-sources.zip::https://www.fispro.org/download/install/sources/fispro-${pkgver}-sources.zip"
  "${pkgname}.desktop"
  "${pkgname}-launcher.sh"
)
sha256sums=(
  '4d6b7da7a6214061e9b5ddf7f46e5d7046c8cb7316d916f81636a1bd47f4dcce'
  'd218790c1dcd8f02527589705eafdf9b1ccfac3099726e77d2b3abb457bd1669'
  'ddf23354d057f0f5c6ce8a5d76762938c449b7ab4c8282890d5d67f5bb5aee20'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-sources/fispro/fispro-main"

  # Upstream archive misses src/fmpp used to generate fis.Version.
  # Provide the generated class directly for reproducible builds.
  if [[ ! -f src/main/java/fis/Version.java ]]; then
    install -dm755 src/main/java/fis
    cat > src/main/java/fis/Version.java <<'EOF'
package fis;

public final class Version {
  public static final String VERSION = "3.8";

  private Version() {
  }
}
EOF
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-sources"

  export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
  export PATH="${JAVA_HOME}/bin:${PATH}"

  make -j1 MAVEN_COMMAND="mvn -B -Dmaven.repo.local=${srcdir}/.m2/repository -Dexec.skip=true"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-sources"

  local appdir="${pkgdir}/usr/lib/${pkgname}"
  make INSTALL_PATH="${appdir}" install

  chmod 755 "${appdir}/fispro.sh"

  install -Dm755 "${srcdir}/${pkgname}-launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "fispro/resources/class/resources/fispro.icon.16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 "fispro/resources/class/resources/fispro.icon.32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 "fispro/resources/class/resources/fispro.icon.48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"

  install -Dm644 "${appdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${appdir}/GSL-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/GSL-LICENSE"
  install -Dm644 "${appdir}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
