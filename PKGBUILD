# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


# Decide for what type of installation to build.
#
# If you have a modern (i.e. reflecting the 5.10.0 name change to Luanti)
# installation using `/usr/share/luanti`, then `luanti` is set here.
#
# If you use a legacy/old installation using `/usr/share/mintest` directly,
# and having the `minetest-common` package installed, then `minetest` is
# set here.
#
# This defines the dependency package name as well as the target directory
# for the game files.
#
# If this breaks on your system, just replace the `$(...)` with either
# `luanti` or `minetest`, depending on your installation.
_type=$( [ -d '/usr/share/luanti' ] && echo luanti || echo minetest )


pkgname=minetest-game-cdb
pkgver=20241017
pkgrel=2
pkgdesc='Latest version of “Minetest Game” from the Luanti Content Database, but installed system-wide as a regular Arch package.'


url='https://content.luanti.org/packages/Minetest/minetest_game/'
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
    releases=$(curl "${cdb}/api/packages/Minetest/minetest_game/releases/")
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
    location="usr/share/${_type}/games"
    install -d "${pkgdir}/${location}"
    cp -r "${srcdir}/minetest_game" "${pkgdir}/${location}/minetest_game"
}
