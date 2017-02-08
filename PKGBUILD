# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Det <aur.archlinux.org/account/Det>
# Contributor: Nick Shvelidze <captain@pirrate.me>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

# Build notes:
# http://wiki.playonlinux.com/index.php/Building_PlayOnLinux_5

_pkgname=playonlinux5
pkgname=${_pkgname}-git
pkgver=r1609.55ea8a9f
pkgrel=1
epoch=2
pkgdesc="GUI for managing Windows programs under linux (development version based on Java)"
arch=('any')
url="http://www.playonlinux.com/"
license=('GPL')
makedepends=('git' 'maven' 'java-openjfx' 'java-environment>=8')
depends=('wine' 'java-runtime>=8')
options=(!strip)
source=(
	"${_pkgname}::git://github.com/PlayOnLinux/POL-POM-5.git"
	'PlayOnLinux5.desktop'
	'PlayOnLinux.sh'
	)
md5sums=(
	'SKIP'
	'7fe925810fc7ec6d8745817b1c541e7b'
	'60c82a463c2023368132c9b305887ada'
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
  if (( $(archlinux-java get | cut -d "-" -f2) < 8 )) || [[ ! -f /usr/bin/javac ]]; then

	# test for openjdk, fall back on other jdks if not found
	# Take the highest sorted version (alpahumericly,head -1)
	_openjdk=$(ls /usr/lib/jvm/java-{8,9}-openjdk/bin/javac 2>/dev/null | cut -d "/" -f-5)

	if [[ "${_openjdk}" ]]; then
		# choose the first one available
		export JAVA_HOME="${_openjdk[0]}"
	else
		# fall back to other JDKs
		export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
	fi

  fi

  # Build
  mvn package
  
}

package() {
  
  # Extract
  install -d "${pkgdir}/opt/"
  bsdtar -xf "${_pkgname}/phoenicis-dist/target/phoenicis-dist.zip"
  cp -r phoenicis-dist/ "${pkgdir}/opt/${_pkgname}/"

  # Launcher
  install -Dm755 "PlayOnLinux.sh"  "${pkgdir}/usr/bin/${_pkgname}"

  # Icon + Desktop
  install -Dm644 "$srcdir/${_pkgname}/phoenicis-library/src/main/resources/org/phoenicis/library/phoenicis.png" \
                 "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 PlayOnLinux5.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
