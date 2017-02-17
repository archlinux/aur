# Maintainer: zargbell <zargbell@yandex.ru>

pkgname=pixiecore
pkgver=17.02.01.0153
pkgrel=1
epoch=
pkgdesc="An all-in-one tool for easy netbooting"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/google/netboot/tree/master/pixiecore"
license=('GPL2')
groups=()
depends=()
makedepends=('go' 'git' 'curl' 'jq')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
#validpgpkeys=()


prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p $GOPATH

	export GOBIN="$GOPATH/bin"
	mkdir -p $GOBIN

	go env

	gopkgFR="$(git config --global http.https://gopkg.in.followRedirects || true)"

	git config --global http.https://gopkg.in.followRedirects true
}

pkgver(){
	# date last comment
	curl -s 'https://api.github.com/repos/google/netboot/commits?per_page=1' | jq -c -r '.[].commit.committer.date | fromdate | strftime("%y.%m.%d.%H%M")'
}

build() {
	go get -v go.universe.tf/netboot/cmd/pixiecore

	case "${gopkgFR}" in
		   "" ) git config --global --unset http.https://gopkg.in.followRedirects;;
		    * ) git config --global http.https://gopkg.in.followRedirects "${gopkgFR}";;
	esac
}


package() {
	install -Dm755 "$GOBIN/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
