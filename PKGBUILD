# Maintainer: Steven Spangler <132ikl@gmail.com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=linx-client
pkgver=1.5.2
pkgrel=2
pkgdesc='Simple client for linx-server'
arch=('x86_64' 'i686' 'arm')
url='https://github.com/andreimarcu/linx-client'
license=('GPLv3')
makedepends=('go' 'git' 'mercurial')
source=(
    "https://github.com/andreimarcu/linx-client/archive/v$pkgver.tar.gz"
    'golinx-mod-import.patch'
)
sha512sums=(
    '84c678aa10946200cf91e0f70d925321959bf060961dd98d091c2fb004b180edcb1bb0cd4b1e7297d0268193be487b828b71eafdbb186003ec10832800ae2974'
    '71656633e0ce8564a2405299f53b128e0447343d80824d7d9c690bb98786d08cf0e990e8f4aa88b72bfa74c5c1bf4978d47c15ed20b2f2550b4b8906afa96755'
)

prepare() {
    cd $pkgname-$pkgver
	patch -p0 < "$srcdir/golinx-mod-import.patch"

    GOPATH=$PWD/go go mod init "${url#https://}"
    GOPATH=$PWD/go go mod tidy -v -e -go 1.16
}

build() {
    case $CARCH in
        x86_64) go_arch=amd64;;
        i686) go_arch=386;;
        arm) go_arch=arm;;
    esac

    cd $pkgname-$pkgver

	CGO_CPPFLAGS="${CPPFLAGS}" \
	CGO_CFLAGS="${CFLAGS}" \
	CGO_CXXFLAGS="${CXXFLAGS}" \
	CGO_LDFLAGS="${LDFLAGS}" \
	GOPATH="$PWD/go" \
	GOARCH="$go_arch" \
	GOOS=linux go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		-o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 linx-client -t "$pkgdir/usr/bin"
}
