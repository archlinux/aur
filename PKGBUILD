# Maintainer: Nguyen Chinh Huu <huupoke12@gmail.com>
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "Ferdi265" [AUR]
# Contributor: "downbtn" [AUR]
# Contributor: "Roliga" [AUR]
# Contributor: "donaldtrump" [AUR]

pkgname=osu-lazer-git
pkgver=2020.312.0.r111.7be5ef4737
pkgrel=1
pkgdesc="An open source, free-to-win rhythm game"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ppy/osu"
license=('MIT')
groups=()
depends=('dotnet-runtime>=3.1' 'ffmpeg' 'libgl')
makedepends=('git' 'dotnet-sdk>=3.1.0.sdk100')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!strip)
install=
source=("$pkgname::git+https://github.com/ppy/osu.git"
	'osu-lazer-git.sh'
	'osu-lazer-git.desktop'
	'osu-lazer-git.xml')
noextract=()
sha256sums=('SKIP'
            'b0e3f6195988220421bee1484aa4a7260c2861e92fa7b0bf0f3141a60cdc439b'
            '6e977d250974783ca02a61cb8cad9b1d8683bcb1ee289d9e1ce2b4ad431b9773'
            '8e7c18bcb146cf161a84025934ef2cbe9395b0008535faaeaca4bc4d56194f8f')


pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/$pkgname"
	env DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet build -c Release osu.Desktop
}


package() {
	# Launcher, Desktop and MIME
	cd "$srcdir"
	install -Dm755 osu-lazer-git.sh "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 osu-lazer-git.desktop "$pkgdir/usr/share/applications/sh.ppy.osu.${pkgname%-git}.desktop"
	install -Dm644 osu-lazer-git.xml "$pkgdir/usr/share/mime/packages/${pkgname%-git}.xml"
	
	# Libraries
	cd "$srcdir/$pkgname/osu.Desktop/bin/Release/netcoreapp3.1"
	find . -maxdepth 1 -type f \! -name 'osu!' -exec install -Dm755 "{}" "$pkgdir/usr/lib/${pkgname%-git}/{}" \;
	
	# Icon and License
	cd "$srcdir/$pkgname"
	install -Dm644 assets/lazer.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
