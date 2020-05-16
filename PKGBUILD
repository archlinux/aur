# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: Det <aur.archlinux.org/account/Det>
# Contributor: Nick Shvelidze <captain@pirrate.me>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>
# Contributor: Kristóf Marussy <kris7topher@gmail.com>

# Build notes:
# http://wiki.playonlinux.com/index.php/Building_PlayOnLinux_5

_pkgname=playonlinux5
pkgname=${_pkgname}-git
pkgver=r2553.b523e3f9e
pkgrel=1
pkgdesc="GUI for managing Windows programs under linux (development version based on Java)"
arch=('any')
url="http://www.playonlinux.com/"
license=('GPL')
makedepends=('git' 'maven' 'java-openjfx' 'java-environment-openjdk>=11')
depends=('wine' 'java-openjfx' 'java-runtime-openjdk>=11')
options=(!strip)
source=(
	"${_pkgname}::git://github.com/PlayOnLinux/POL-POM-5.git"
	'PlayOnLinux5.desktop'
	'PlayOnLinux.sh'
	)
sha512sums=('SKIP'
            '1eaae868c6db9c1db5e6c2138475dfac4036be49d6a7a9e4e59a10cf72dedcc213030d08fba16a6e62d46616dea5e3f502f9cfebc2db280a38c05e301ab6258e'
            '448f3851a1f48272b73535b3a8646401f773034c0ea6108002947b7072d463e5b8ec56530fdf0c60f2f716f418032776dab170dd03fd4d9518b9be8b2d21cb5a')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  cd "${srcdir}/${_pkgname}"

  # Set environment
  msg2 "Assessing Java build environment"

  # test for openjdk, fall back on other jdks if not found
  # Take the highest sorted version (alpahumericly,head -1)
  _openjdk=$(ls /usr/lib/jvm/java-11-openjdk/bin/javac 2>/dev/null | cut -d "/" -f-5)
  _openjdk_jetbeans=$(ls /usr/lib/jvm/java-11-openjdk-jetbrains/bin/javac 2>/dev/null | cut -d "/" -f-5)
  _oraclejdk=$(ls /usr/lib/jvm/java-11-jdk/bin/javac 2>/dev/null | cut -d "/" -f-5)

  if (( $(archlinux-java get | cut -d "-" -f2) < 8 )) || [[ ! -f /usr/bin/javac ]]; then

	if [[ "${_openjdk}" ]]; then
		# choose the first one available
		msg2 "Using OpenJDK for build"
		export JAVA_HOME="${_openjdk[0]}"

	elif [[ "${_oraclejdk}" ]]; then
		msg2 "Using Oracle JDK for build"
		export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)

	elif [[ "${_openjdk_jetbrains}" ]]; then
		msg2 "Using Jetbrains for build"
		export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk-jetbrains*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)

	else
		# fall back to other JDKs
		export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
		msg2 "Using JDK $JAVA_HOME"
	fi

  else

	msg2 "Default Java JDK set is of version 11 or higher, proceeding..."
	msg2 "Using: $(archlinux-java get)"
	export JAVA_HOME="/usr/lib/jvm/default"

  fi

  # Test for JavaFX (required)
  JAVA_FX=$(find $JAVA_HOME/ -name "javafx.properties")
  if [[ -n "$JAVA_FX" ]]; then
    JAVA_FX_BOOLEAN="True"
  else
    JAVA_FX_BOOLEAN="False"
  fi

  msg2 "JavaFX Capabale? $JAVA_FX_BOOLEAN"

  if [[ "$JAVA_FX_BOOLEAN" = "False" ]]; then
    msg2 "Forcing proper Java (if available)"

	if [[ "${_openjdk}" ]]; then
		export JAVA_HOME="${_openjdk[0]}"
		msg2 "Switching to OpenJDK"

	elif [[ "${_oraclejdk}" ]]; then
		export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
		msg2 "Switching to Oracle JDK"

	else
		msg2 "ERROR: Could not find a proper java build environment. Exiting"
		exit 1
	fi

  fi

  # Build
  mvn package -DskipTests
  
}

package() {
  cd "${srcdir}/${_pkgname}"  
  # Extract
  install -d "${pkgdir}/opt/"
  bsdtar -xf "${srcdir}/${_pkgname}/phoenicis-dist/target/phoenicis-flatpak.zip"
  cp -r phoenicis-flatpak/ "${pkgdir}/opt/${_pkgname}/"

  # Launcher
  install -Dm755 "${srcdir}/PlayOnLinux.sh"  "${pkgdir}/usr/bin/${_pkgname}"

  # Icon + Desktop
  install -Dm644 "$srcdir/${_pkgname}/phoenicis-library/src/main/resources/org/phoenicis/library/phoenicis.png" \
                 "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/PlayOnLinux5.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Fix permissions on pkg lib dir
  chmod -R 755 "${pkgdir}/opt/${_pkgname}/lib"

}
