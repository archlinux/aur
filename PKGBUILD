# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck disable=SC2148,SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=AHK_X11
pkgname="${_pkgname,,}"
pkgver=1.0.7
pkgrel=1
pkgdesc='AutoHotkey for Linux (X11-based systems)'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/phil294/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
    gtk3
    libnotify
    libxkbcommon
    libxinerama
    libxtst
    gc
)
makedepends=(
    crystal
    shards
    gcc
    gobject-introspection
)
_xdotool_commit='7b63eb46631815fd4a10e1fd78a37213250d1193'
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "$_pkgname-$pkgver-xdotool-${_xdotool_commit}.tar.gz::https://github.com/jordansissel/xdotool/archive/${_xdotool_commit}.tar.gz")
sha256sums=('910e391bcf6918d9c2da1ccae95ff42185092e275400583a107ac6db1b4f2916'
            '0315b2d13a39c0c203e6685bb359006f74386f54ccda9e7b24ac2a7131d77827')

prepare() {
    cd "${_pkgname}-${pkgver}"
    mv --no-target-directory "${srcdir}/xdotool-${_xdotool_commit}" ./xdotool
}

build() {
    cd "${_pkgname}-${pkgver}"
    # Don’t pollute $HOME
    export SHARDS_CACHE_PATH="$srcdir/.cache/shards"
    make bin/ahk_x11
}

#check() {
#    cd "${_pkgname}-${pkgver}"
#    make test-dev
#}

package() {
    cd "${_pkgname}-${pkgver}"
    DESTDIR="$pkgdir" make install
}
