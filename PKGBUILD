# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck disable=SC2148,SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=AHK_X11
pkgname="${_pkgname,,}-git"
pkgver=1.0.3.r27.gb4f092d
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
    git
    crystal
    shards
    gcc
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git"
        "git+https://github.com/jordansissel/xdotool.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    git submodule init
    git config submodule.xdotool.url "$srcdir/xdotool"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${_pkgname}"
    # Don’t pollute $HOME
    export SHARDS_CACHE_PATH="$srcdir/.cache/shards"
    make bin/ahk_x11
}

#check() {
#    cd "${_pkgname}"
#    make test-dev
#}

package() {
    cd "${_pkgname}"
    DESTDIR="$pkgdir" make install
}
