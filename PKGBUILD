# Maintainer: Kristian <morguldir@protonmail.com
# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "donaldtrump" [AUR]


pkgname=osu-lazer
pkgver=2018.616.0
pkgrel=4
pkgdesc="Freeware rhythm video game - lazer version $pkgver, which is the last version with mono support"
arch=('x86_64')
license=('MIT' 'custom:CC-BY-NC 4.0')
url='https://osu.ppy.sh/'
depends=(ffmpeg libbass libgl mono)
makedepends=(git msbuild dotnet-sdk)
provides=(osu-lazer)
conflicts=(osu-lazer-git)

source=(
	"https://github.com/ppy/osu/archive/$pkgver.tar.gz"
	'git+https://github.com/ppy/osu-resources/'
	'osu-launcher'
    'osu-lazer.desktop'
    'osu-lazer.png'
    'x-osu-lazer.xml'
)

sha512sums=(
	41544a90713579c5e1bce47bdf91429f68cd48f315adfc1f8f34deb98c972c896da398f91c03b38e2338881b05f48412da2c8d8da2c766b53f577751f698187e
	SKIP
	bc8596bd5c4e0bef53272d3bc583ab28b820d7e539d74923c22cdf79c7b5946bb71a18fcce2a368db89f6dc16e8015d4196d3347b997e23ba523449e88579c59	
	6565bd871ff336acc35b001ac22077b58bebdf3dd64dbdbb2b210771466753afb650062320394cb2e7f3283aa658a6891904befb3833babeeb5afe65f14f9b34
	2e855797c904f39b4dd81cee2022305dce95310f14a37d2ec7b22673a6f26be2782ea6370836ccbdebe8ffc46ecd5b11d44d77a81db19e0d7c26aa40343ff300
	a243b0e00c2ae22b23fc57ba6eb355d2d51005bc77461ff91af1719aa704c940a95ad4ae435339868f6177c8743e5f02522c377e7a20730d2773a11d39ef89ee
)

prepare()
{
	if ! test -e "$srcdir/osu-$pkgver/osu-resources/*";
	then
		mv "$srcdir/osu-resources" "$srcdir/osu-$pkgver/"
	fi

	cd "$srcdir/osu-$pkgver"
	dotnet restore
}

build()
{
	cd "$srcdir/osu-$pkgver"
    msbuild /property:Configuration=Release
 
}

package()
{
	# Wrapper script
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 'osu-launcher' "$pkgdir/usr/bin/osu-lazer"

    # MIME types
    mkdir -p "$pkgdir/usr/share/mime/packages"
    install -m644 "x-$pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$pkgname.xml"

    # Add .desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Application icon
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Compiled binaries
    cd "$srcdir/osu-$pkgver/osu.Desktop/bin/Release/net471"
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    for binary in *.exe *.dll; do
        install -m755 "$binary" "$pkgdir/usr/lib/$pkgname/$binary"
    done

    # Native libraries
    install -m755 "libbass.so" "$pkgdir/usr/lib/$pkgname/libbass.so"
    install -m755 "libbass_fx.so" "$pkgdir/usr/lib/$pkgname/libbass_fx.so"
    install -m755 "libe_sqlite3.so" "$pkgdir/usr/lib/$pkgname/libe_sqlite3.so"

	# osu-lazer licence
	cd "$srcdir/osu-$pkgver/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/osu-lazer/"
	install -m644 "LICENCE" "$pkgdir/usr/share/licenses/$pkgname/osu-lazer/MIT"

	# osu-resources licence
	cd "$srcdir/osu-$pkgver/osu-resources/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/osu-resources/"
	install -m644 "LICENCE.md" "$pkgdir/usr/share/licenses/$pkgname/osu-resources/CC-BY-NC 4.0"
}
