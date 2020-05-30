# Maintainer: shulhan <ms@kilabit.info>
pkgname=awwan-git
pkgver=0.1.1.20200530150425.8ac2120686d7
pkgrel=1
pkgdesc="Configuration management software"
arch=('i686' 'x86_64' 'armv7h')
url="https://sr.ht/~shulhan/awwan"
license=('custom:BSD')

provides=('awwan')

makedepends=('git' 'go>=1.13')
source=(
	"$pkgname::git+https://git.sr.ht/~shulhan/awwan"
)
sha1sums=(
	'SKIP'
)

pkgver() {
	cd ${pkgname}

	GIT_LAST_COMMIT=$(git log -n 1 --date=local --pretty=format:'%ct')
	DATE=$(date -u --date=@${GIT_LAST_COMMIT} +%Y%0m%0d%0H%0M%0S)
	HASH=$(git log -n 1 --pretty=format:'%h' --abbrev=12)
	TAG=$(git describe --abbrev=0 --tags || echo "")

	if [[ "${TAG}" == "" ]]; then
		TAG="0.0.0"
	else
		TAG=$(echo ${TAG} | sed 's/v//')
		IFS=. read MAJOR MINOR PATCH <<<"${TAG}"
		PATCH=$((PATCH+1))
		TAG=${MAJOR}.${MINOR}.${PATCH}
	fi

	echo ${TAG}.${DATE}.${HASH}
}

build() {
	cd ${pkgname}
	make
}

package() {
	cd ${pkgname}
	install -D     ./awwan   ${pkgdir}/usr/bin/awwan
	install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
