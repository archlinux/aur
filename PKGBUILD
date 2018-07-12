# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "donaldtrump" [AUR]

pkgname=osu-lazer-git
pkgver=2018.710.0_10_g882a6afec
pkgrel=1
pkgdesc='Freeware rhythm video game - lazer development version'
arch=('x86_64')
url='https://osu.ppy.sh'
license=('MIT')
makedepends=('mono'
             'msbuild-stable'
             'git')
depends=('dotnet-sdk'
         'ffmpeg'
         'libgl')
optdepends=()
options=()
provides=('osu-lazer')
conflicts=('osu-lazer')
source=('git+https://github.com/ppy/osu.git'
        'git+https://github.com/ppy/osu-framework'
        'git+https://github.com/ppy/osu-resources'
        'osu-launcher'
        'osu-lazer.desktop'
        'osu-lazer.png'
        'x-osu-lazer.xml')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '09c1cd74f65806aa3064d9eabee440e2d205d8b50cf12bafc41cb338681ba3e9'
            '2665c47e522ec7762a2a8ff3dcf32f254fd9e5eceac33a162c638f06b0fcb44e'
            '3b3a9075f79ca7f2a4fd34eb182a5c1ada6eb118a95e49c1526df516365bbfe5'
            'd22f0d922856639c7cc5f71bdd620cc8b3eb54af923b1a43703faac217b8b13b')

case "$CARCH" in
	x86_64)
		_arch=x64
		;;
	i686)
		_arch=x86
		;;
esac

pkgver() {
	cd "$srcdir/osu"
	git describe --always --tags | sed -E -e 's/^(v|changelog-)//g' -e 's/-/_/g'
}

prepare() {
	cd "$srcdir/osu"

	# Prepare submodules
	git submodule init
	git config submodule.osu-framework.url "$srcdir/osu-framework"
	git config submodule.osu-resources.url "$srcdir/osu-resources"
	git submodule update --recursive

	# Download dependencies
	export TERM='xterm'
	dotnet restore
}

build() {
	cd "$srcdir/osu"

	# Build
	export MONO_IOMAP='case'
	export TERM='xterm'
	msbuild /property:Configuration=Release
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

	# Copy binaries
	cd "$srcdir/osu/osu.Desktop/bin/Release/netcoreapp2.1"
	mkdir -p "$pkgdir/usr/lib/${pkgname%-git}"
	for file in *.dll *.json *.pdb *.so; do
		install -m755 "$file" "$pkgdir/usr/lib/${pkgname%-git}/$file"
	done
}

# vim: set sw=4 ts=4 noet:
