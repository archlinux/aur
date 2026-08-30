# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=WiiUDownloader
pkgname=wiiudownloader
pkgver=2.103
pkgrel=1
pkgdesc="Allows to download encrypted wiiu files from nintendo's official servers"
arch=('x86_64')
url="https://github.com/Xpl0itU/WiiUDownloader"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'hicolor-icon-theme' 'libx11' 'gtk3' 'gdk-pixbuf2' 'cairo' 'pango' 'fontconfig')
makedepends=('go' 'gendesk' 'python')
options=('!debug')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a29c4cd97da1655076aadbe94cda017851d1ad6f09d9e804e75dad67704618f9')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p "$srcdir/$_pkgname-$pkgver/build"
	gendesk -n \
	-f \
	--pkgname=$pkgname \
	--pkgdesc="$pkgdesc" \
	--name=$_pkgname \
	--exec="/usr/bin/$pkgname" \
	--icon="$pkgname" \
	--terminal=false
	python3 grabTitles.py
	pushd ./cmd/WiiUDownloader
	GOPATH="$srcdir" go mod download -modcacherw
	popd
}

build() {
	cd "$_pkgname-$pkgver/cmd/$_pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	GOPATH="$srcdir" go build -v .

}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "cmd/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "data/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	install -Dm644 "$srcdir/$_pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
