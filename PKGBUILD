# Maintainer: @RubenKelevra <cyrond@gmail.com>

_pkgname=git-lfs-ipfs
pkgname=$_pkgname-git
pkgver=0.0.0.r0.g03db01295
pkgrel=1
pkgdesc='A git-lfs custom transfer & extension that makes it easy to store large files with IPFS.'
url="https://github.com/sameer/$_pkgname"
arch=('x86_64')
license=('MIT' 'Apache')

depends=(git git-lfs)
makedepends=(git cargo rust)

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
	cd "$srcdir/$_pkgname/git-lfs-ipfs-cli"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}


build() {
	cd "$srcdir/$_pkgname/git-lfs-ipfs-cli"
	cargo build --release --frozen

}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm 755 -t "$pkgdir/usr/bin" "target/release/${_pkgname}-cli"
        install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
