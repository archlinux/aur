# Maintainer: @RubenKelevra
# Contributor: Sameer Puri <purisame@spuri.io>

_pkgname=git-remote-ipld
pkgname=$_pkgname-git
pkgver=0.0.0.r0.g501d5f2ce
pkgrel=1
epoch=1
pkgdesc='git IPLD remote helper'
url="https://github.com/ipfs-shipyard/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('git')
makedepends=("go>=2:1.14.4-1" git 'go-ipfs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")

b2sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	#VERSION=$(grep -E "^const CurrentVersionNumber = " version.go | awk '{ print $4 }' | sed 's/"//g')
	VERSION=$(git tag | grep -vE "floodsub|sharding-pre" | grep -ve "-dev" | sed 's/-/~/g' | sort --version-sort --reverse | sed 's/~/-/g' | head -n1)
	if [ -z "$VERSION" ]; then
		VERSION="0.0.0"
		COUNT=0
	else
		COUNT=$(git rev-list "$VERSION.." --count)
	fi
	CHKSUM=$(git rev-list master | head -n1)
	VERSION=$(echo "$VERSION" | sed 's/^v//' | sed 's/-//')
	printf "%s.%s.%s" "$VERSION" "r$COUNT" "g${CHKSUM:0:9}"
}

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p "${srcdir}/../go"
	export GOPATH="${srcdir}/../go"
	export PATH="$PATH:$GOPATH/bin"
	# fix for broken version
	chmod u+w -R "$GOPATH"
	go get -d -v ./...
}

build() {
	cd "$srcdir/$_pkgname"
	export GOPATH="${srcdir}/../go"
	export PATH="$PATH:$GOPATH/bin"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	make GOFLAGS="-buildmode=pie -trimpath -modcacherw"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm 755 cmd/$_pkgname/$_pkgname "${pkgdir}/usr/bin/git-remote-ipld"
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	# make sure the gopath is writeable
	chmod u+w -R "$GOPATH"
}
