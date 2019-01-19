# Maintainer: Peter Roberts <me@peter-r.co.uk>
pkgname=zoom-parallel
pkgver=0.0.4
pkgrel=1
pkgdesc="Parallel command executor with a focus on simplicity and good cross-platform behaviour "
arch=("x86_64")
url="https://github.com/pwr22/zoom"
license=('MIT')
depends=("glibc")
makedepends=("go-pie")
source=("https://github.com/pwr22/zoom/archive/v$pkgver.tar.gz")
sha256sums=("89af374fe89ea082e6b3b9e9b1d33b0008b650378c5ea77fb1f776cc3d769802")

_cmdname=zoom # name of the command - there's a clash so the package name is longer

# Go stuff based on https://wiki.archlinux.org/index.php/Go_package_guidelines#Basic_PKGBUILD

build() {
	cd "$_cmdname-$pkgver"
	GOPATH="$srcdir/go" go build

	go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$_cmdname" .
}

package() {
	cd "$_cmdname-$pkgver"
	install -Dm755 "$_cmdname" "$pkgdir/usr/bin/$_cmdname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
