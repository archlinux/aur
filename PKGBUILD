# Maintainer: faith <valters.tomsons@protonmail.com>
pkgname=yuzu-mainline-git-bin
pkgver=0.0.2
pkgrel=2
pkgdesc='Open-source emulator for Nintendo Switch (git)'
arch=('x86_64')
url='https://github.com/yuzu-emu/yuzu-mainline'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu' 'yuzu-cmd')
depends=('sdl2' 'gpm' 'zip' 'openssl' 'zstd' 'sndio')
options=(!strip)

prepare()
{
	cd "$srcdir"
	echo "Getting latest release url..."
	yuzuurl=$(curl https://api.github.com/repos/yuzu-emu/yuzu-mainline/releases/latest | grep "/yuzu-linux.*.tar.xz" | cut -d : -f 2,3 | tr -d \")

	if [ -z "$yuzuurl" ]
	then
		echo "Failed to retrieve yuzu url, exiting..."
		exit 1
	else
		echo "Url found: $yuzuurl"
	fi

	echo "Downloading yuzu github release..."
	curl -L $yuzuurl --output yuzu-linux.tar.xz
}

package()
{
        cd "$srcdir"
        tar -xf yuzu-linux.tar.xz --strip 1
        install -Dm755 "$srcdir/yuzu" "$pkgdir/usr/bin/yuzu"
        install -Dm755 "$srcdir/yuzu-cmd" "$pkgdir/usr/bin/yuzu-cmd"
}
