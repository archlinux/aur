# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
_pkgname=ztdns
pkgname=ztdns
pkgver=20180604.r69_g5fdb3bc
pkgrel=1
pkgdesc='DNS server for a ZeroTier virtual network.'
url='hhttps://github.com/uxbh/ztdns'
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://github.com/uxbh/ztdns/releases/tag/$pkgver')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=(
	'glibc'
)
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git://github.com/uxbh/ztdns#branch=${BRANCH:-master}"
)

md5sums=(
	'SKIP'
)

backup=(
	'etc/.ztdns.toml'
)

install='ztdns.install'


prepare() {
	chmod u+w -R "$GOPATH"
}

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$_pkgname"
	local DATE=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local COUNT=$(git rev-list --count HEAD)
	local COMMIT=$(git rev-parse --short HEAD)
	local CHKSUM=$(git rev-list master | head -n1)
	printf "%s.%s_%s" "$DATE" "r${COUNT}" "g${COMMIT}"

}

build() {

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$srcdir/$_pkgname"

	if [ -L "$srcdir/$_pkgname" ]; then
		rm "$srcdir/$_pkgname" -rf
		mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
	fi

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

	mv "$srcdir/$_pkgname" "$srcdir/go/src/"

	cd "$srcdir/go/src/$_pkgname/"
	ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {

  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/etc

	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -Dm 755 "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done

	find "$srcdir/go/src/$_pkgname" -name "LICENSE" -type f | while read filename; do
		if [ "$(basename $filename)" == "LICENSE" ]; then
				install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT"
		fi
	done

	find "$srcdir/go/src/$_pkgname" -name ".ztdns.toml.example" -type f | while read filename; do
		if [ "$(basename $filename)" == ".ztdns.toml.example" ]; then
				install -Dm 644 .ztdns.toml.example "$pkgdir/etc/.ztdns.toml"
		fi
	done

	chmod u+w -R "$GOPATH"

}
