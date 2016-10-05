# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=yay
pkgver=28
pkgrel=1
pkgdesc="Yet another pacman wrapper with AUR support"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
  'pacman'
  'sudo'
  'tar'
)
makedepends=(
	'go'
	'git'
)

source=(
	"yay::git://github.com/Jguer/yay.git#branch=${BRANCH:-master}"
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
	# local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	echo "${count}"
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

	cd "$srcdir/.go/src/$pkgname/"
	ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

	git submodule update --init

	go get -v \
		-gcflags "-trimpath $GOPATH/src" -ldflags "-X main.version=${PKGVER}"
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
