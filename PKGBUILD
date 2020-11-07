# Maintainer: Yurii <yu.hrysh@posteo.net>

pkgname=open-hexagon-git
pkgver=2.0.preview.r1766.gd4e93de4
pkgrel=5
epoch=1
pkgdesc='Free software clone of Super Hexagon - a music-based arcade game'
url='https://openhexagon.org/'
arch=('any')
license=('custom:AFL-3.0' 'custom')
depends=('sfml')
makedepends=('git' 'cmake' 'rsync')
optdepends=('steam: integration for those who own the game on Steam'
'discord: Discord Rich Presence support')
provides=('open-hexagon')
conflicts=('open-hexagon')
source=('git+https://github.com/SuperV1234/SSVOpenHexagon.git'
	'open-hexagon-git-assets.zip::https://github.com/SuperV1234/SSVOpenHexagonAssets/archive/master.zip'
	'open-hexagon-git.install'
	'open-hexagon'
	'open-hexagon.desktop')
install="$pkgname.install"
sha256sums=('SKIP'
            'c58bf04778d29ade2b76ea5402671f95ede634fb67f44d707b2f9580054caaa7'
            '5e147e333661b56cb13957729a9fc32660523cadccac0c429ce89b5b8b4f87d9'
            'a3558245d72250aadaaef32b087474a671a54fcca8267b5746d5bce56ce71397'
            'a3f4ef5296619903b487ccd8d894e28b2d9fad3a9152683f642b43aeb88b7928')

_reponame="SSVOpenHexagon"
_assetsname="SSVOpenHexagonAssets-master"

pkgver() {
	# Use the most recent un-annotated tag
	cd "$_reponame"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_reponame"
	git submodule init
	git submodule update

	./build.sh

	cd ..
	# Merge directories
	rsync -av --remove-source-files --ignore-existing "$_assetsname/_RELEASE" "$_reponame"
}

package() {
	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/var/lib/open-hexagon"

	cd "$_reponame/_RELEASE"
	rm -f *.bat *.dll *.lib
	install -Dm644 "Assets/Open Hexagon Assets License.txt" -t "$pkgdir/usr/share/licenses/open-hexagon/"

	cd ..
	cp -r "_RELEASE" "$pkgdir/usr/lib/open-hexagon"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/open-hexagon/"
	
	# Dirty hack to allow writing data to current directory
	# (also see .install file)
	cd "$pkgdir/usr/lib/open-hexagon"
	ln -s "/var/lib/open-hexagon/log.txt"
	rm config.json
	ln -s "/var/lib/open-hexagon/config.json"
	mv "$srcdir/$_reponame/misc/default_config.json" "$pkgdir/var/lib/open-hexagon"
	ln -sf "/var/lib/open-hexagon/default_config.json"
	rm scores.json
	ln -s "/var/lib/open-hexagon/scores.json"
	rm users.json
	ln -s "/var/lib/open-hexagon/users.json"
	mkdir "$pkgdir/var/lib/open-hexagon/Profiles"
	ln -s "/var/lib/open-hexagon/Profiles"
	mkdir "$pkgdir/var/lib/open-hexagon/Replays"
	ln -s "/var/lib/open-hexagon/Replays"
	chmod -R a+w "$pkgdir/var/lib/open-hexagon"
	

	# Executables
	cd "$srcdir"
	install -Dm755 open-hexagon -t "$pkgdir/usr/bin"
	install -Dm644 open-hexagon.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 "$_reponame/art/icon.png" "$pkgdir/usr/share/pixmaps/open-hexagon.png"
}
