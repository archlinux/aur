# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=ndecrypt
pkgname=$_pkgname-git
pkgver=0.2.5.r1.g71199ee
pkgrel=3
pkgdesc="DS/3DS Encryption Tool"
arch=('x86_64')
url="https://github.com/SabreTools/NDecrypt"
license=('MIT')
depends=('dotnet-runtime-6.0' 'gcc-libs' 'glibc')
makedepends=('dotnet-sdk>=6' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i 's/\(NDecrypt\)\.exe/\1/' $_pkgname/NDecrypt/Program.cs
}

build() {
	export DOTNET_CLI_TELEMETRY_OPTOUT=true
	export DOTNET_NOLOGO=true
	dotnet publish $_pkgname/NDecrypt \
		--configuration Release \
		--framework net6.0 \
		--output build \
		--runtime linux-x64 \
		--self-contained false
}

package() {
	# shellcheck disable=SC2154
	install -d "$pkgdir"/usr/{bin,lib}
	cp -dr --no-preserve=ownership build "$pkgdir"/usr/lib/$_pkgname
	ln -s -t "$pkgdir"/usr/bin ../lib/$_pkgname/NDecrypt
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
