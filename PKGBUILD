# Maintainer: gardenapple <gardenapple at posteo.net>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=open-hexagon-git
pkgver=2.0.6.r463.gf42c0404
_assetsver=1
pkgrel=1
epoch=1
pkgdesc='Challenging rhythm-based arcade game inspired by Super Hexagon'
url='https://openhexagon.org/'
arch=('any')
license=('custom:AFL-3.0' 'custom:non-free')
depends=('zenity' # for 'launcher' interface
         'freetype2'
         'glew'
         'libsndfile'
         'libx11'
         'libxcursor'
         'libxrandr'
         'openal')
makedepends=('rsync' # for merging assets into base game dir
             'git'
             'cmake'
             'mesa')
optdepends=('steam: integration for those who own the game on Steam'
            'discord: Discord Rich Presence support')
provides=('open-hexagon')
conflicts=('open-hexagon')
source=('git+https://github.com/SuperV1234/SSVOpenHexagon.git'
        "open-hexagon-git-assets-$_assetsver.zip::https://github.com/SuperV1234/SSVOpenHexagonAssets/archive/master.zip"
        'open-hexagon-git.install'
        'open-hexagon'
        'open-hexagon.desktop')
install="$pkgname.install"
sha512sums=('SKIP'
            '5733647987d84887ce65717f8787629a4a4cf2de1af4ef15a06158988aa706e5392cae7b1ff3fd29e9387b9dc7dd1b35c6da059360a508c3e4746b66217631d2'
            '669f9b6016f911ec8e44461e7a81dc557637c600c4b1b58a83ef3ea7d046c83d9ff5064c1dca3fe6fc29653d79d293b82b58de91f5db197489e1f088741b4a54'
            '4c3f5f25d766efb749eb52016fa03460628d6b9c7d417d6e250a598fd43041e02fc144b135b359244973cee63eaf37620e5d5ec2b907ac8cffdcf45b4153020f'
            'bc7d1e1a420a439283b4fcf2f06a8a50ca06d3934b79f6a93ff4ad4d269d6b246eb6a1824381c36bbb73fc7d24e9883281ab66eab05b2cc2fdbac3ed14a775d5')

_reponame="SSVOpenHexagon"
_assetsname="SSVOpenHexagonAssets-master"

pkgver() {
	# Use the most recent un-annotated tag
	cd "$srcdir/$_reponame"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_reponame"

	# Instructions from 
	# https://github.com/vittorioromeo/SSVOpenHexagon/wiki/Building-Instructions#arch-based
	git submodule init
	git submodule update
	cd buildlx/
	cmake ..
	make
	mv SSVOpenHexagon ../_RELEASE

	# Merge assets
	rsync -av --remove-source-files --ignore-existing "$srcdir/$_assetsname/_RELEASE" "$srcdir/$_reponame"
}

package() {
	mkdir -p "$pkgdir/usr/lib"

	cd "$srcdir/$_reponame/_RELEASE"
	install -Dm644 "Assets/Open Hexagon Assets License.txt" -t "$pkgdir/usr/share/licenses/open-hexagon/"

	# Move libraries to separate dir
	rm -f *.bat *.dll *.lib
	mkdir -p _deps/
	mv *.so _deps/

	cd "$srcdir/$_reponame"
	cp -r "_RELEASE" "$pkgdir/usr/lib/open-hexagon"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/open-hexagon/"

	# Install CMake-pulled dependencies
	find buildlx/_deps/*-build/ \( -name '*.so.*' -o -name '*.so' \) \
		-execdir mv -- '{}' "$pkgdir/usr/lib/open-hexagon/_deps" \;
	
	cd "$pkgdir/usr/lib/open-hexagon"

	# Dirty hack to allow writing data to current directory
	# (also see .install file)
	rm -rf Profiles Replays
	mkdir -p "$pkgdir/var/lib/open-hexagon"
	for i in config.json log.txt Profiles Replays; do
		ln -sf "../../../var/lib/open-hexagon/$i"
	done

	# Misc. cleanup
	install -Dm644 "luadocs.md" -t "$pkgdir/usr/share/doc/open-hexagon/"
	rm luadocs.md _deps/libz.so* *.sh users.json scores.json

	# Executables
	install -Dm755 "$srcdir/open-hexagon" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/open-hexagon.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$_reponame/_RELEASE/Assets/icon.png" "$pkgdir/usr/share/pixmaps/open-hexagon.png"
}
