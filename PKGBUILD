#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
_pkgname="gdx-texture-packer-gui"
pkgname="${_pkgname}-git"
pkgver=r640.d4ada4e
pkgrel=1
pkgdesc="A gui for the command line gdx-texturepacker"
arch=('any')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
conflicts=("gdx-texture-packer-gui")
makedepends=('jdk8-openjdk' 'git-lfs')
depends=('java-runtime')

prepare() {
	if [ ! -e gdx-texture-packer-gui ]; then
		git clone --recursive https://github.com/crashinvaders/gdx-texture-packer-gui
	fi
}

pkgver() {
	cd "$srcdir/$_pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build() {
	cd "$srcdir/$_pkgname"
	JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ ./gradlew distRelease
}

package() {
	install -Dm644 "${srcdir}/$_pkgname/distribution/output/gdx-texture-packer.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
	mkdir -p ${pkgdir}/usr/bin
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_pkgname}/${_pkgname}.jar' \"\$@\"\n" > "${pkgdir}/usr/bin/${_pkgname}"
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
