# Maintainer: Vasiliy Nikitin <nvasya95@gmail.com>
pkgname=kotatsu-dl-git
_pkgname=kotatsu-dl
pkgver=0.2
pkgrel=3
pkgdesc='Manga downloader with a Java gui'
url='https://github.com/KotatsuApp/kotatsu-dl'
arch=('any')
license=('GPL3')
depends=('java-environment>=11')
makedepends=(git)
source=(git+$url.git)
noextract=("${source[@]##*/}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/$_pkgname"
	./gradlew jar
}

package() {
	# mkdirs
	mkdir -p ${pkgdir}/opt/${_pkgname}/
	mkdir -p ${pkgdir}/usr/share/applications/
	# copy built files
	cp -p $(find ${srcdir}/${_pkgname}/build/libs -name '*.jar') ${pkgdir}/opt/${_pkgname}/kotatsu-dl.jar
	cp -p ${srcdir}/${_pkgname}/build/resources/main/icon_256.png ${pkgdir}/opt/${_pkgname}/${_pkgname}.png
	cp -p ${srcdir}/${_pkgname}/${_pkgname}.sh ${pkgdir}/opt/${_pkgname}/${_pkgname}.sh
	cp -p ${srcdir}/${_pkgname}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
