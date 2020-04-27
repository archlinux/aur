# Maintainer: @RubenKelevra
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.5.0rc4.r7.g0c57175f0
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
source=("git+${url}.git"
	"ipfs.service"
	"ipfs@.service")

b2sums=('SKIP'
	'd3463151a9f209784a6bf8fb91b0001d19c1c91732430d5d3744cbb861e3ca80fd18fe481ef3ef91061a6f59931dbcf8d063f50a319ab1bb2a2c1ba0ac9175f1'
	'364d9043d1df256af620b52a967c45d8324f0a5b05879466b95f03f3871531678b521140e3a4fe746f9f9b1d171050ab08320628860967176344c968ba7ddae7')

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p $srcdir/go
	export GOPATH="${srcdir}"/go
	export PATH=$PATH:$GOPATH/bin
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
	export GOPATH="${srcdir}"/go
	export PATH=$PATH:$GOPATH/bin
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	make GOFLAGS="-buildmode=pie -trimpath -modcacherw" build 
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm 755 cmd/ipfs/ipfs "$pkgdir/usr/bin/ipfs"
	install -Dm 644 "$srcdir"/ipfs.service "$pkgdir/usr/lib/systemd/user/ipfs.service"
	install -Dm 644 "$srcdir"/ipfs@.service "$pkgdir/usr/lib/systemd/system/ipfs@.service"
	install -Dm 644 misc/completion/ipfs-completion.bash "$pkgdir/usr/share/bash-completion/completions/ipfs"
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MIT" LICENSE-MIT
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/APACHE" LICENSE-APACHE
	install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	chmod u+w -R "$GOPATH"
}

