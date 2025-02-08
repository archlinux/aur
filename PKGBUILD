# Maintainer: Tad DeVries <me at tad dot xyz>
# Contributor: Nathaniel Cook <nvcook42 at gmail dot com>

_pkgname='opensprinkler'
pkgname="${_pkgname}-git"
provides=($_pkgname)
pkgver=221.r0.gd78964b
pkgrel=4
pkgdesc='Firmware for OpenSprinkler on a Raspberry Pi'
url='https://github.com/OpenSprinkler/OpenSprinkler-Firmware'
license=('GPL-3.0-or-later')
arch=('armv7h' 'x86_64')
depends=('mosquitto' 'openssl' 'libgpiod-1.6')
makedepends=('gcc' 'git' 'patch')
optdepends=('i2c-tools')
install="${_pkgname}.install"
source=("git+https://github.com/OpenSprinkler/OpenSprinkler-Firmware.git#tag=221(0)"
	"git+https://github.com/OpenThingsIO/OpenThings-Framework-Firmware-Library.git#tag=0.1.2"
	"git+https://github.com/gilmaimon/TinyWebsockets.git"
        "${_pkgname}.install"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "cwd.patch"
        "gpio.patch")

sha256sums=('0a69029689aabcbf7f0f39bd2b361fa59e4806861abd7682ac6318c11402c709'
            '806797a5601ba3c2b7ae796ce631e1694878e0668c84d1f18faa5ef69b3ec9d5'
            'SKIP'
            '393d7a6abb15e392c76c61a12d968d834acee5cd5f6c84ae8e420e3b369e20ce'
            '4093e75a71291ccadef7dff04168947b1a2db42cf9bcebf659a168ea8369bbad'
            '91249b681ea64db4307f07d9d2a6e64a5900426b4185d53067c5e4b3dda02846'
            '437e200b4674b70aafd6794739832c5c2b8a804509d23f5aec710190e0bf376a'
            'cc6af9f07a97926f8cd9e9e2d63759f6630224f4079501309808121f773c820d')

pkgver() {
  cd "OpenSprinkler-Firmware"
  git describe --long --tags --abbrev=7 | sed 's/\([^\(]*\)-0\(-g\)/r\1\2/;s/-/./g;s/[\(]/./g;s/[\)]//g'
}

prepare() {
  cd "OpenSprinkler-Firmware"
  git submodule init
  git config submodule.external/OpenThings-Framework-Firmware-Library.url "$srcdir/OpenThings-Framework-Firmware-Library"
  git config submodule.external/TinyWebsockets.url "$srcdir/TinyWebsockets"
  git -c protocol.file.allow=always submodule update
  patch -p1 < ${srcdir}/cwd.patch
  patch -p1 < ${srcdir}/gpio.patch
  sed -i '5i#include <cstdint>' external/TinyWebsockets/tiny_websockets_lib/include/tiny_websockets/internals/ws_common.hpp
}

build() {
  cd "OpenSprinkler-Firmware"

  ws=$(ls external/TinyWebsockets/tiny_websockets_lib/src/*.cpp)
  otf=$(ls external/OpenThings-Framework-Firmware-Library/*.cpp)

  g++ -o ${_pkgname} -DOSPI -DSMTP_OPENSSL -DLIBGPIOD -std=c++14 -include string.h main.cpp OpenSprinkler.cpp program.cpp opensprinkler_server.cpp utils.cpp weather.cpp gpio.cpp mqtt.cpp smtp.c -Iexternal/TinyWebsockets/tiny_websockets_lib/include $ws -Iexternal/OpenThings-Framework-Firmware-Library/ $otf -lpthread -lmosquitto -lssl -lcrypto -lgpiod

}

package() {
  # systemd user and service file
  install -D -m644 "${srcdir}/${_pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -D -m644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # binaries
  install -D -m755 "${srcdir}/OpenSprinkler-Firmware/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
