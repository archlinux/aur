# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=ndecrypt
pkgname=$_pkgname-git
pkgver=0.5.0.r1.ge637920
pkgrel=1
pkgdesc="DS/3DS Encryption Tool"
arch=('x86_64')
url="https://github.com/SabreTools/NDecrypt"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('dotnet-sdk>=10' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 --exclude=rolling | sed 's/[^-]*-g/r&/;s/-/./g'
}

build() {
	local options=(
		--configuration Release
		--framework net10.0
		--output build
		--runtime linux-x64
		--self-contained false
	)
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_NOLOGO=1
	dotnet publish $_pkgname/NDecrypt "${options[@]}"
}

package() {
	depends+=('dotnet-runtime-10.0')
	# shellcheck disable=SC2154
	install -d "$pkgdir"/usr/{bin,lib}
	cp -dr --no-preserve=ownership build "$pkgdir"/usr/lib/$_pkgname
	ln -s -t "$pkgdir"/usr/bin ../lib/$_pkgname/NDecrypt
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
