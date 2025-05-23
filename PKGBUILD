## Maintainer: Speykious <spey.aur@speykious.dev>

pkgname=mercury-mapper
pkgver="4.0.8"
pkgrel=5
pkgdesc="A chart editor for Mercury. \"Forked\" from BAKKA-Avalonia, re-written for stability and ease of use. (Patched for better use of config folders.)"
arch=('x86_64')
url="https://github.com/Yasu3D/MercuryMapper"
license=('MIT')
depends=(libgl dotnet-runtime libbass libbass_fx libbassflac libbassopus)
makedepends=(dotnet-runtime dotnet-sdk)
provides=(mercury-mapper)
conflicts=(mercury-mapper-bin)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yasu3D/MercuryMapper/archive/refs/tags/v$pkgver.tar.gz"
	    "$pkgname.png::https://raw.githubusercontent.com/Yasu3D/MercuryMapper/refs/heads/master/Assets/AppIcon.png"
	    "$pkgname-LICENCE.md::https://raw.githubusercontent.com/Yasu3D/MercuryMapper/refs/heads/master/LICENSE"
	    "$pkgname.xml"
	    "$pkgname.desktop"
	    "$pkgname-0_update-version.patch"
	    "$pkgname-1_xdg-folders.patch"
	    "$pkgname-2_open-chart-from-shell-args.patch"
	    "$pkgname")
sha256sums=('a8d86045d7c1e8dc4a1741d43ae95bf563b70e5df926b123be352c59613cc04e'
            '95df58bef2d8a34d7f0daee739e28ca78c0dd9f7b6a401d9ad376e32b4718cc1'
            '7574c0121b5d56f8186d6cd6df664547a575315fa19c91480272c205bca457c4'
            '26cfe5c5b1b49abb7ec65bef6ab0d50bab80ca051947aa1db843fd64874e3abe'
            '4a80e56619e7b012473dd06f45a85e306f30f274b23f1085cfa5085e0ad2fc8e'
            '8d4712c03f1160409dd69f920d13debe89bae4bc9ff725684200f69591c48a5b'
            '98e24c328663f89e9b9d5644a5e57243346bd8c6b116d813dda0bc2275db898a'
            'ed71d13d12329f946b0fb186156fbf88dedc1539f26247a5502399e06a1d544e'
            'd01a1b63c3cda5aaf243ad10a6476a09098c8347f95d959b0b3330a0e71d067c')

prepare() {
	cd "$srcdir/MercuryMapper-$pkgver"
	patch --quiet -p1 -i "$srcdir/$pkgname-0_update-version.patch"
	patch --quiet -p1 -i "$srcdir/$pkgname-1_xdg-folders.patch"
	patch --quiet -p1 -i "$srcdir/$pkgname-2_open-chart-from-shell-args.patch"

	dotnet clean -v:q
}

build() {
	cd "$srcdir/MercuryMapper-$pkgver"
	dotnet build --configuration Release -v:q --property WarningLevel=0
}

check() {
	cd "$srcdir/MercuryMapper-$pkgver"
	dotnet test -v:q
}

package() {
	install -dm755 "$pkgdir/usr/lib/MercuryMapper"
	cp -rp "$srcdir/MercuryMapper-$pkgver/bin/Release/net8.0/"* "$pkgdir/usr/lib/MercuryMapper/"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$pkgname-LICENCE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
