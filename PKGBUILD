#! /bin/bash

pkgname="darkmod"
provides=("${pkgname}")
conflicts=("${pkgname}")

arch=("x86_64")
pkgver=2.07.1
pkgrel=1

pkgdesc="First person forgery stealth game"
license=("GPL3" "BSD" "CCPL")
url="http://www.thedarkmod.com"

depends=("curl" "glew" "libjpeg-turbo" "libpng" "libpng12" "libpulse" "libxxf86vm" "openal")
makedepends=("git")
source=("git+https://gitlab.com/es20490446e/darkmod-linux-packager.git")
md5sums=("SKIP")


build () {
	"${srcdir}/darkmod-linux-packager/build.sh"
}


package () {
	mv "${srcdir}/darkmod-linux-packager/build/usr" "${pkgdir}"
}


pkgver () {
	Release=$(Release)
	Revision=$(Revision "${Release}")
	echo "${Release}${Revision}"
}


Release () {
	curl --silent "http://www.thedarkmod.com/downloads/" |
	grep "http://www.thedarkmod.com/sources/" |
	sed -E 's/."([^"]+)"./\1/' |
	cut --delimiter='/' --fields=5 |
	cut --delimiter='.' --fields=2,3
}


Revision () {
	Release="${1}"
	Hotfix=$(
		curl --silent "https://svn.thedarkmod.com/publicsvn/darkmod_src/tags/" |
		grep "${Release}h")

	if [ "${Hotfix}" != "" ]; then
		echo ".1"
	fi
}

