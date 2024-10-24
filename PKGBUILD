# Maintainer: Sir_Delajolie <remilabelle at outlook dot com>

pkgname=genshin-fps-unlock-git
_pkgname=${pkgname%-git}
pkgver=v3.3.0.r7.g36c8b72
pkgrel=1
pkgdesc="Unlocks the 60 fps cap in Genshin Impact"
arch=('x86_64')
url="https://github.com/34736384/genshin-fps-unlock"
options=(!lto)
install=config.install
license=('MIT')
makedepends=('git' 'dotnet-sdk-bin>=8' 'mingw-w64-gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/34736384/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dvm755 -t "$pkgdir/usr/share/$_pkgname" "unlockfps_nc/bin/ReleaseMin/net8.0-windows/win-x64/publish/unlockfps_nc.exe"

	# Create empty config with write acces to games group since the unlocker should not be run as root
	local _config="fps_config.json"
	echo '{}' > "$_config"
	install -Dvm664 -ggames -t "$pkgdir/etc/$_pkgname" "$_config"

	# link to config in /etc since the executable tries to write it elsewhere
	ln -sv "/etc/$_pkgname/$_config" "$pkgdir/usr/share/$_pkgname/$_config"
}
