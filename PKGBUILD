# Maintainer: Will Reed <wreed@disroot.org>

pkgname=confidant
pkgver=0.4.5
pkgrel=1
pkgdesc="Dotfile management tool designed to be simple (but powerful), fast and easy to use"
arch=('x86_64')
url="https://wreedb.github.io/confidant"
license=('GPL-3.0-or-later')
source=("https://codeberg.org/wreedb/confidant/releases/download/v${pkgver}/confidant-${pkgver}.source.tar.gz")
b2sums=('607c3b909263d517b08e125fa848e3a85adec8cca1c92e9ef2d2ee9b420be09f7196a1bf053f6e08fecce39aac878a091f6b9fdab9af0c02c0c6228d6d025677')
depends=(libucl gcc-libs glibc)
makedepends=(meson scdoc gettext libucl)

prepare() {
    cd ${pkgname}-${pkgver}
    meson subprojects download lyra
    meson setup .build \
        --strip \
        --buildtype=release \
        --prefix=/usr \
        --libexecdir=lib \
        --sbindir=bin \
        --sysconfdir=/etc \
        -D build-tests=true
}

build() {
    cd ${pkgname}-${pkgver}
    meson compile -C .build
}

check() {
    cd ${pkgname}-${pkgver}
    meson test -C .build
}

package() {
    cd ${pkgname}-${pkgver}
    meson install -C .build --destdir ${pkgdir}
}

