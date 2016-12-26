# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=go-dwmstatus
pkgver=1.26
pkgrel=1
pkgdesc="DWM status bar written in go. Fork without mdp support and with PulseAudio support for volume."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/petRUShka/go-dwmstatus"
license=('GPL')
depends=(
  'sudo'
)
makedepends=(
	'go'
	'git'
)
conflicts=()


source=(
	"go-dwmstatus::git://github.com/petRUShka/go-dwmstatus.git#branch=${BRANCH:-master}"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$pkgname"
	local count=$(git rev-list --count HEAD)
	echo "1.${count}"
}

build() {
	cd "$srcdir/$pkgname"

	if [ -L "$srcdir/$pkgname" ]; then
		rm "$srcdir/$pkgname" -rf
		mv "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"
	fi

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/$pkgname" "$srcdir/.go/src/"

	go get -v \
		-gcflags "-trimpath $GOPATH/src" \
		-ldflags="-X main.version=$pkgver"
}

package() {
  #install executable
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done

	cd "$srcdir/.go/src/$pkgname"
}
