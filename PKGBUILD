# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64-git
pkgver=1.1.1.r9.e24fcff
pkgrel=2
pkgdesc="A game made in under 2 weeks for Celeste's 6th Anniversary (git)"
arch=(x86_64)
url="https://github.com/ExOK/Celeste64"
license=('custom:celeste64')
groups=()
depends=()
makedepends=('git' 'dotnet-sdk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('!strip' '!debug')
source=('celeste64::git+https://github.com/ExOK/Celeste64'
				'celeste64.desktop')
sha256sums=('SKIP'
            '9906284626f846e34c55807a60126b2bf034697adab5ef15c2665e18f5abd795')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	dotnet restore
}

build() {
	cd "$srcdir/${pkgname%-git}"
	dotnet build -c Release --ucr
	awk '/License/{license=1} license{print}' ReadMe.md >License.txt
}

package() {
	cd "$srcdir/${pkgname%-git}"
	dotnet publish -c Release --no-build -o "$pkgdir"/opt/celeste64
	cp -r Content "$pkgdir"/opt/celeste64
	install -Dm 644 "$srcdir"/celeste64.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 License.txt -t "$pkgdir"/usr/share/licenses/celeste64
	install -Dm 644 Source/License.txt "$pkgdir"/usr/share/licenses/celeste64/SourceLicense.txt
}
