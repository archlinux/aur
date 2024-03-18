# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64
pkgver=1.1.1
pkgrel=2
pkgdesc="A game made in under 2 weeks for Celeste's 6th Anniversary"
arch=(x86_64)
url="https://github.com/ExOK/Celeste64"
license=('custom:celeste64')
groups=()
depends=()
makedepends=('dotnet-sdk')
replaces=()
backup=()
options=('!strip' '!debug')
source=("Celeste64-$pkgver.tar.gz::https://github.com/ExOK/Celeste64/archive/refs/tags/v$pkgver.tar.gz"
				'celeste64.desktop')
sha256sums=('5f78ce9043a77bd0811974d65a043f7d538cf1dcf1947680625bde255a89a72d'
            '9906284626f846e34c55807a60126b2bf034697adab5ef15c2665e18f5abd795')

prepare() {
	cd "$srcdir/Celeste64-$pkgver"
	dotnet restore
}

build() {
	cd "$srcdir/Celeste64-$pkgver"
	dotnet build -c Release --ucr
	awk '/License/{license=1} license{print}' ReadMe.md >License.txt
}

package() {
	cd "$srcdir/Celeste64-$pkgver"
	dotnet publish -c Release --no-build -o "$pkgdir"/opt/celeste64
	cp -r Content "$pkgdir"/opt/celeste64
	install -Dm 644 "$srcdir"/celeste64.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 License.txt -t "$pkgdir"/usr/share/licenses/celeste64
	install -Dm 644 Source/License.txt "$pkgdir"/usr/share/licenses/celeste64/SourceLicense.txt
}
