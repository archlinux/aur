pkgname="techmino-git"
pkgver=0.17.10.r4728.bc634b2e
pkgrel=1
pkgdesc="A collection of various modern block game rules, more ways to play, and awesome features added for a new experience."
arch=('x86_64')
url="https://github.com/26F-Studio/Techmino"
license=('LGPL3')
depends=('love')
options=(!strip)
makedepends=('git' 'zip' 'sed')
source=("git+https://github.com/26F-Studio/Techmino.git"
	"git+https://github.com/26F-Studio/Zframework.git"
	"CC_Linux.zip::https://github.com/26F-Studio/cold_clear_ai_love2d_wrapper/releases/download/11.4/Linux.zip"
	"TechminoDevelopment.desktop")
sha256sums=('SKIP'
	'SKIP'
	'5ff7108d7be5ffe83f31b8a678108a57eb7a21c9240694cd4f61a73f9340ef98'
	'fce377e467bc614bae1b8fb96d52b32b3f6d65103b28c72cc3f91248ce4aca82')
prepare() {
	cd ${srcdir}/Techmino
	git submodule init
	git config Zframework.url "$srcdir/Zframework"
	git submodule update

	_commit_id=$(git rev-parse --short HEAD)
	_commit_id=${_commit_id:0:4}
	sed -i "4s \",$ @$_commit_id\", " version.lua
	cp ./.github/build/linux/dev/icon.png ../TechminoDevelopment.png
}
pkgver() {
	cd ${srcdir}/Techmino
	commit_id=$(git rev-parse --short HEAD)
	commit_count=$(git rev-list --all --count)
	version=$(sed -n '4p' version.lua)
	version=${version:17:-7}
	printf '%s.r%d.%s' $version $commit_count $commit_id
}
package() {
	cd ${srcdir}/Techmino
	zip -rq9 ../game.love media parts Zframework conf.lua main.lua version.lua

	cd ${srcdir}
	cat TechminoDevelopment.png game.love >game_icon.love
	install -Dm644 "game_icon.love" "${pkgdir}/usr/share/TechminoDevelopment/Techmino.love"
	install -Dm644 "./x64/CCloader.so" "${pkgdir}/usr/share/TechminoDevelopment/CCloader.so"
	install -Dm644 "TechminoDevelopment.desktop" "${pkgdir}/usr/share/applications/TechminoDevelopment.desktop"
}
