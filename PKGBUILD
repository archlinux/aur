# Maintainer: @RubenKelevra
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.5.1.r89.gb786c32b6
pkgrel=3
pkgdesc='A peer-to-peer hypermedia distribution protocol'
url="https://github.com/ipfs/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=("go>=2:1.14.2-1" git)
optdepends=('fuse2: for mounting/advanced use'
            'bash-completion: bash completion support')
provides=("$_pkgname")
conflicts=("$_pkgname" go-pie)
source=("git+${url}.git")

b2sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p "${srcdir}/../go"
	export GOPATH="${srcdir}/../go"
	export PATH="$PATH:$GOPATH/bin"
	# fix for broken version
	chmod u+w -R "$GOPATH"
	go get -d -v ./...
}


pkgver() {
	cd "$srcdir/$_pkgname"
	#VERSION=$(grep -E "^const CurrentVersionNumber = " version.go | awk '{ print $4 }' | sed 's/"//g')
	VERSION=$(git tag | grep -vE "floodsub|sharding-pre" | grep -ve "-dev" | sed 's/-/~/g' | sort --version-sort --reverse | sed 's/~/-/g' | head -n1)
	COUNT=$(git rev-list "$VERSION.." --count)
	CHKSUM=$(git rev-list master | head -n1)
	VERSION=$(echo "$VERSION" | sed 's/^v//' | sed 's/-//')
	printf "%s.%s.%s" "$VERSION" "r$COUNT" "g${CHKSUM:0:9}"
}

build() {
	cd "$srcdir/$_pkgname"
	export GOPATH="${srcdir}/../go"
	export PATH="$PATH:$GOPATH/bin"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	make GOFLAGS="-buildmode=pie -trimpath -modcacherw" build 
}

package() {
	cd "$srcdir/$_pkgname"
	#avoid migrations on bootup (see #7269)
	sed -i 's/--migrate//g' misc/systemd/ipfs.service
	#increase timeouts (see #7283)
	sed -i 's/MemorySwapMax=0/MemorySwapMax=0\n\nTimeoutStartSec=15min\nTimeoutStopSec=15min\nTimeoutAbortSec=15min/' misc/systemd/ipfs.service
	install -Dm 755 cmd/ipfs/ipfs "$pkgdir/usr/bin/ipfs"
	install -Dm 644 misc/systemd/ipfs-api.socket "$pkgdir/usr/lib/systemd/system/ipfs-api.socket"
	install -Dm 644 misc/systemd/ipfs-gateway.socket "$pkgdir/usr/lib/systemd/system/ipfs-gateway.socket"
	install -Dm 644 misc/systemd/ipfs.service "$pkgdir/usr/lib/systemd/system/ipfs.service"
	# systemd-sysusers
	install -Dm 644 "misc/systemd/ipfs-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ipfs.conf"
	install -Dm 644 misc/completion/ipfs-completion.bash "$pkgdir/usr/share/bash-completion/completions/ipfs"
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MIT" LICENSE-MIT
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/APACHE" LICENSE-APACHE
	install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	chmod u+w -R "$GOPATH"
}
