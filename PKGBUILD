pkgname="techmino-git"
pkgver=0.17.22.r5256.64ddb090
pkgrel=1
pkgdesc="A collection of various modern block game rules, more ways to play, and awesome features added for a new experience."
arch=('x86_64')
url="https://github.com/26F-Studio/Techmino"
license=('LGPL3')
depends=('love')
options=(!strip)
makedepends=('git' 'zip' 'sed' 'lua')
source=("git+https://github.com/26F-Studio/Techmino.git"
	"git+https://github.com/26F-Studio/Zframework.git"
	"CC_2024-11-06.zip::https://github.com/26F-Studio/cold_clear_ai_love2d_wrapper/releases/download/11.5/Linux.zip"
	"TechminoDevelopment.desktop"
	"start.sh")
sha256sums=('SKIP'
            'SKIP'
            '07fa2ff3e4fc59f8d1708f54e26869204621fc03ddeec3151dc5ddba3df0390c'
            '53e20aab3488be864d29f143bb340f02056ab52529efef845875a8f577e56908'
            '610343816733916901e5553b266b4bf0ebbc72386a5c99830f1d4f4a0931d4db')
prepare() {
	cd ${srcdir}/Techmino
	git submodule init
	git config Zframework.url "$srcdir/Zframework"
	git submodule update

	_commit_id=$(git rev-parse --short HEAD)
	_commit_id=${_commit_id:0:4}
	sed -i "4s \",$ @$_commit_id\", " version.lua
	cp ./.github/build/linux/dev/icon.png ../icon.png
}
pkgver() {
	cd ${srcdir}/Techmino
	commit_id=$(git rev-parse --short HEAD)
	commit_count=$(git rev-list --all --count)
	version=$(lua -e '
	local version=require("version")["string"]
	local len=string.len(version)
	if string.find(version, "@") then len=len-5 end
	print(string.sub(version, 2, len))
	')
	printf '%s.r%d.%s' $version $commit_count $commit_id
}
package() {
	cd ${srcdir}/Techmino
	zip -rq9 ../game.love media parts Zframework conf.lua main.lua version.lua

	cd ${srcdir}
	install -Dm644 "game.love" "${pkgdir}/usr/share/TechminoDevelopment/game.love"
	install -Dm644 "./x64/CCloader.so" "${pkgdir}/usr/share/TechminoDevelopment/CCloader.so"
	install -Dm644 "TechminoDevelopment.desktop" "${pkgdir}/usr/share/applications/TechminoDevelopment.desktop"
	install -Dm644 "icon.png" "${pkgdir}/usr/share/TechminoDevelopment/media/image/icon.png"
	install -Dm755 "start.sh" "${pkgdir}/usr/bin/techmino_development"
}
