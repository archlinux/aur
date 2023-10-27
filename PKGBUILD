# Maintainer: Vasiliy Nikitin <nvasya95@gmail.com>
pkgname=kotatsu-dl-git
_pkgname=kotatsu-dl
pkgver=1.0
pkgrel=1
pkgdesc='Manga downloader with a simple gui'
url='https://github.com/KotatsuApp/kotatsu-dl'
arch=('any')
license=('GPL3')
makedepends=(git jdk17-openjdk)
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
	./gradlew packageReleaseAppImage
}

package() {
	# mkdirs
	mkdir -p ${pkgdir}/opt/${_pkgname}/
	mkdir -p ${pkgdir}/usr/share/applications/
	# copy built files
	cp -pr ${srcdir}/${_pkgname}/build/compose/binaries/main-release/app/kotatsu-dl/* ${pkgdir}/opt/${_pkgname}
	cp -p ${srcdir}/${_pkgname}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
