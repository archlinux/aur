# Maintainer: Vasiliy Nikitin <nvasya95@gmail.com>
pkgname=kotatsu-dl-git
_pkgname=kotatsu-dl
pkgver=0.1
pkgrel=1
pkgdesc='Easy-to-use cli manga downloader with a 1k+ sources supported'
url='https://github.com/KotatsuApp/kotatsu-dl'
arch=('any')
license=('GPL3')
makedepends=(git)
depends=('java-runtime-headless>=17')
optdepends=('bash-completion: bash completion support')
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
	./gradlew shadowJar
	cd "${srcdir}/$_pkgname/build/libs"
	cat \
	  <(echo '#!/bin/sh')\
	  <(echo 'exec java -jar $0 "$@"')\
	  <(echo 'exit 0')\
	  kotatsu-dl.jar > kotatsu-dl
	chmod +x ./kotatsu-dl
	_KOTATSU_DL_COMPLETE=bash ./kotatsu-dl > ./kotatu-dl-completion.bash
}

package() {
	# mkdirs
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/etc/bash_completion.d
	# copy built files
	install -Dm0755 -t ${pkgdir}/usr/bin ${srcdir}/${_pkgname}/build/libs/kotatsu-dl
	install -Dm0755 -t ${pkgdir}/etc/bash_completion.d ${srcdir}/${_pkgname}/build/libs/kotatu-dl-completion.bash
}
