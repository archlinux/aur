# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


# Decide for what type of installation to build.
#
# If you have a modern (i.e. reflecting the 5.10.0 name change to
# Luanti) installation using the new name directories, then you need
# to set `luanti` here.
#
# If you use a legacy/old installation use `mintest`.
#
# If you use the luanti-modern-common package from the AUR, use `luanti-modern`
#
# This defines the dependency package name as well as the target directory
# for the game files.
_type='luanti'


pkgname=minetest-game-cdb
pkgver=20250917
pkgrel=1
pkgdesc='Latest version of “Minetest Game” from the Luanti Content Database, but installed system-wide as a regular Arch package based on Luanti or Minetest installation type.'


url='https://content.luanti.org/packages/Luanti/minetest_game/'
arch=('any')
license=('LGPL-2.1')
depends=("${_type}-common")
makedepends=('curl' 'unzip' 'jq')


# Only the icon can have a checksum. The Minetest Game data is pulled from the
# Content Database. The Content Database does not provide a usable checksum.
source=('minetest_cdb_icon.png')
sha256sums=('77883f101d4b46e3ed37bfc6095e1b2143a79ff852c702d6d98509b6d998ca6b')


prepare() {
    cdb='https://content.luanti.org'
    releases=$(curl "${cdb}/api/packages/Luanti/minetest_game/releases/")
    dlpath=$(echo $releases | jq -r '.[0].url')
    curl "${cdb}${dlpath}" --output 'minetest-game-cdb.zip'
    unzip "${srcdir}/minetest-game-cdb.zip"
}


pkgver() {
    date -d "$(echo $releases | jq -r '.[0].release_date')" "+%Y%m%d"
}


build() {
    gamepath="${srcdir}/minetest_game"
    newtitle="Minetest Game (CDB, ${pkgver})"
    sed -i "/^title /s/=.*$/= ${newtitle}/" "${gamepath}/game.conf"
    cp "${srcdir}/minetest_cdb_icon.png" "${gamepath}/menu/icon.png"
}


package() {
    location="usr/share/${_type%-modern}/games"
    install -d "${pkgdir}/${location}"
    cp -r "${srcdir}/minetest_game" "${pkgdir}/${location}/minetest_game"
}
