# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4



pkgname=minetest-game-cdb
pkgver=5.8.0
pkgrel=1
pkgdesc='Latest version of “Minetest Game” from the Minetest Content Database, but installed system-wide as a regular Arch package.'

url='https://content.minetest.net/packages/Minetest/minetest_game/'
arch=('any')
license=('LGPL-2.1')

depends=('minetest' 'minetest-common')
makedepends=('curl' 'unzip' 'jq')

# Only the icon can have a checksum. The Minetest Game data is pulled from the
# Content Database. The Content Database does not provide a usable checksum.
source=('minetest_cdb_icon.png')
sha256sums=('77883f101d4b46e3ed37bfc6095e1b2143a79ff852c702d6d98509b6d998ca6b')

prepare() {
    cdb='https://content.minetest.net'
    releases=$(curl "${cdb}/api/packages/Minetest/minetest_game/releases/")
    dlpath=$(echo $releases | jq -r '.[0].url')
    curl "${cdb}${dlpath}" --output 'minetest-game-cdb.zip'
    unzip "${srcdir}/minetest-game-cdb.zip"
}

pkgver() {
    echo $releases | jq -r '.[0].title'
}

build() {
    gamepath="${srcdir}/minetest_game"
    sed -i '/^title /s/=.*$/= Minetest Game (CDB)/' "${gamepath}/game.conf"
    cp "${srcdir}/minetest_cdb_icon.png" "${gamepath}/menu/icon.png"
}

package() {
    location='usr/share/minetest/games'
    install -d "${pkgdir}/${location}"
    cp -r "${srcdir}/minetest_game" "${pkgdir}/${location}/minetest_game_cdb"
}
