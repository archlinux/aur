# Maintainer: AtomicScience <d.greblyuk@innopolis.university>

pkgname=ocemu-zenith
pkgver=1.0
pkgrel=1
pkgdesc="A package for the Zenith391's fork of the OCEmu"
arch=("any")
license=("unknown")
url="https://github.com/zenith391/OCEmu"
makedepends=('git' 'svn' 'luarocks')
depends=('lua52' 'lua52-filesystem' 'lua52-sec' 'lua52-socket')
source=("git://github.com/zenith391/OCEmu")
sha1sums=('SKIP')

prepare() {
    _lua_version=5.2

    msg "(1/6) Installing luasocket"
    sudo luarocks --lua-version $_lua_version install luasocket
    msg "(2/6) Installing luautf8"
    sudo luarocks --lua-version $_lua_version install luautf8
    msg "(3/6) Installing luafilesystem"
    sudo luarocks --lua-version $_lua_version install luafilesystem
    msg "(4/6) Installing luasec"
    sudo luarocks --lua-version $_lua_version install luasec

    msg "(5/6) Installing luasec"
    sudo rm -rf "luaffifb"
    git clone https://github.com/gamax92/luaffifb/
    cd "luaffifb"
    sudo luarocks --lua-version $_lua_version make
    cd ..
    sudo rm -rf "luaffifb"
}

build() {
    msg "(6/6) Downloading lootdisks and OSes"
    cd "OCEmu"
    make
}

package() {
    _path_to_bin=/usr/bin
    _path_to_emulator=/usr/share

    install -m755 -d ${pkgdir}${_path_to_bin}
    install -m755 -d ${pkgdir}${_path_to_emulator}

    cp -r ./OCEmu ${pkgdir}${_path_to_emulator}

    # Generating a running script
    rm -f ocemu
    echo "#!/bin/bash" >> ocemu
    echo "cd ${_path_to_emulator}/OCEmu/src/" >> ocemu
    echo "lua5.2 boot.lua \$@" >> ocemu

    install -m755 ./ocemu ${pkgdir}${_path_to_bin}
}
