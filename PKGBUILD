# Maintainer : Bumsik Kim <k.bumsik@gmail.com>
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
pkgver=r2160.1c7cad3c
pkgrel=1
pkgdesc="GUI for managing Windows programs under linux (development version based on Java)"
arch=('any')
url="http://www.playonlinux.com/"
license=('GPL')
makedepends=('git' 'maven' 'java-openjfx' 'java-environment-openjdk>=8')
depends=('wine' 'java-openjfx' 'java-runtime-openjdk>=8')
options=(!strip)
source=(
	"${_pkgname}::git://github.com/PlayOnLinux/POL-POM-5.git"
	'PlayOnLinux5.desktop'
	'PlayOnLinux.sh'
	)
md5sums=(
	'SKIP'
	'7fe925810fc7ec6d8745817b1c541e7b'
	'84eb4201e3f3da463b916cbb116c0677'
	)

pkgver() {

  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )

}

build() {

  cd "${_pkgname}"

  # Set environment
  msg2 "Assessing Java build environment"

  # test for openjdk, fall back on other jdks if not found
  # Take the highest sorted version (alpahumericly,head -1)
  _openjdk=$(ls /usr/lib/jvm/java-{8,9}-openjdk/bin/javac 2>/dev/null | cut -d "/" -f-5)
  _openjdk_jetbeans=$(ls /usr/lib/jvm/java-{8,9}-openjdk-jetbrains/bin/javac 2>/dev/null | cut -d "/" -f-5)
  _oraclejdk=$(ls /usr/lib/jvm/java-{8,9}-jdk/bin/javac 2>/dev/null | cut -d "/" -f-5)

  if (( $(archlinux-java get | cut -d "-" -f2) < 8 )) || [[ ! -f /usr/bin/javac ]]; then

	if [[ "${_openjdk}" ]]; then
		# choose the first one available
		msg2 "Using OpenJDK for build"
		export JAVA_HOME="${_openjdk[0]}"

	elif [[ "${_oraclejdk}" ]]; then
		msg2 "Using Oracle JDK for build"
		export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)

	elif [[ "${_openjdk_jetbrains}" ]]; then
		msg2 "Using Jetbrains for build"
		export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-jdk-jetbrains*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)

	else
		# fall back to other JDKs
		export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
		msg2 "Using JDK $JAVA_HOME"
	fi

  else

	msg2 "Default Java JDK set is of verison 8 or higher, proceeding..."
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
		export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
		msg2 "Switching to Oracle JDK"

	else
		msg2 "ERROR: Could not find a proper java build environment. Exiting"
		exit 1
	fi

  fi

  # Build
  mvn package
  
}

package() {
  
  # Extract
  install -d "${pkgdir}/opt/"
  bsdtar -xf "${_pkgname}/phoenicis-dist/target/phoenicis.zip"
  cp -r phoenicis/ "${pkgdir}/opt/${_pkgname}/"

  # Launcher
  install -Dm755 "PlayOnLinux.sh"  "${pkgdir}/usr/bin/${_pkgname}"

  # Icon + Desktop
  install -Dm644 "$srcdir/${_pkgname}/phoenicis-library/src/main/resources/org/phoenicis/library/phoenicis.png" \
                 "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 PlayOnLinux5.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Fix permissions on pkg lib dir
  chmod -R 755 "${pkgdir}/opt/${_pkgname}/lib"

}
