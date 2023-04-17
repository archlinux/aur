# Maintainer: defektive <sirbradleyd@gmail.com>
pkgname=docker-dnsmasq
pkgver=20211118.9_62c4564
pkgrel=1
pkgdesc="Daemon to add docker containers to dnsmasq"
arch=('i686' 'x86_64')
license=('mit')
depends=(
	'docker'
	'dnsmasq'
)
makedepends=(
	'go'
	'git'
)

source=(
	"docker-dnsmasq::git+https://github.com/defektive/docker-dnsmasq"
	"docker-dnsmasq.service"
)

md5sums=('SKIP'
         'b130c034d31318433ed81e71114edb4d')

backup=(
)

pkgver() {
	cd "$srcdir/$pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
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

	git submodule init
	git submodule update

	echo "Running 'go get'..."
	GO15VENDOREXPERIMENT=1 go get \
		-ldflags="-X github.com/defektive/docker-dnsmasq/cmd.version=$pkgver-$pkgrel"
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
	install -DT -m0755 "$srcdir/docker-dnsmasq.service" "$pkgdir/usr/lib/systemd/system/docker-dnsmasq.service"
}
