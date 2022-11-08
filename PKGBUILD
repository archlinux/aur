pkgname="techmino-git"
pkgver=0.17.8.r4681.e1200b50
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
	'51b329331a978d592033feec9dbdc9acfcf5bd89ae1b9bfe33b6b00033ddf913'
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
	echo "$version.r$commit_count.$commit_id"
}
package() {
	cd ${srcdir}/Techmino
	zip -rq9 ../game.love media parts Zframework conf.lua main.lua version.lua

	cd ${srcdir}
	cat TechminoDevelopment.png game.love >game_icon.love
	install -Dm644 "game_icon.love" "${pkgdir}/usr/share/TechminoDevelopment/Techmino.love"
	install -Dm644 "./x64/CCloader.so" "${pkgdir}/usr/share/TechminoDevelopment/CCloader.so"
	install -Dm644 "./x64/libcold_clear.so" "${pkgdir}/usr/share/TechminoDevelopment/build/x64/libcold_clear.so"
	install -Dm644 "TechminoDevelopment.desktop" "${pkgdir}/usr/share/applications/TechminoDevelopment.desktop"
}
