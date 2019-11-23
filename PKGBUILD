# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "Ferdi265" [AUR]
# Contributor: "downbtn" [AUR]
# Contributor: "Roliga" [AUR]
# Contributor: "donaldtrump" [AUR]

pkgname=osu-lazer-git
pkgver=2019.1122.0_7_g8da65fc90
pkgrel=1
pkgdesc='Freeware rhythm video game - lazer development version'
arch=('x86_64')
url='https://osu.ppy.sh'
license=('MIT')
makedepends=('git')
depends=('dotnet-sdk-bin'
         'ffmpeg'
         'libgl'
         'shared-mime-info')
optdepends=()
options=()
provides=('osu-lazer')
conflicts=('osu-lazer')
source=('git+https://github.com/ppy/osu.git'
        'git+https://github.com/ppy/osu-resources.git'
        'osu-launcher'
        'osu-lazer.desktop'
        'osu-lazer.png'
        'x-osu-lazer.xml')

sha256sums=('SKIP'
            'SKIP'
            '5e7620261f978a583a86c586754fcee0b6d0e5c12fbbfa939a38175ddaeca141'
            '2665c47e522ec7762a2a8ff3dcf32f254fd9e5eceac33a162c638f06b0fcb44e'
            '3b3a9075f79ca7f2a4fd34eb182a5c1ada6eb118a95e49c1526df516365bbfe5'
            'd22f0d922856639c7cc5f71bdd620cc8b3eb54af923b1a43703faac217b8b13b')

pkgver() {
	cd "$srcdir/osu"
	git describe --always --tags | sed -E -e 's/^(v|changelog-)//g' -e 's/-/_/g'
}

prepare() {
	cd "$srcdir/osu"

	# Prepare submodules
	git submodule init
	git config submodule.osu-resources.url "$srcdir/osu-resources"
	git submodule update --recursive

	# Download dependencies
	export TERM='xterm'
	dotnet restore osu.sln
}

build() {
	cd "$srcdir/osu"

	# Build
	export MONO_IOMAP='case'
	export TERM='xterm'
	dotnet build /property:Configuration=Release osu.Desktop
}

package() {
	# Wrapper script
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 'osu-launcher' "$pkgdir/usr/bin/osu-lazer"

	# MIME types
	mkdir -p "$pkgdir/usr/share/mime/packages"
	install -m644 "x-${pkgname%-git}.xml" "$pkgdir/usr/share/mime/packages/x-${pkgname%-git}.xml"

	# Add .desktop file
	mkdir -p "$pkgdir/usr/share/applications"
	install -m644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

	# Application icon
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -m644 "${pkgname%-git}.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

	# Copy license file
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -m644 "$srcdir/osu/LICENCE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	ln -s LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENCE"

	# Copy binaries
	cd "$srcdir/osu/osu.Desktop/bin/Release/netcoreapp3.0"
	mkdir -p "$pkgdir/usr/lib/${pkgname%-git}"
	for file in *.json *.dll *.pdb runtimes/linux-x64/native/*.so; do
		install -m755 "$file" "$pkgdir/usr/lib/${pkgname%-git}/${file##*/}"
	done
}

# vim: set sw=4 ts=4 noet:
