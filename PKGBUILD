# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: envolution
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=autotrace-git
pkgver=0.31.10.r157.g84f93a9
pkgrel=1
pkgdesc='A program for converting bitmap to vector graphics (git version)'
arch=('x86_64')
url='https://github.com/autotrace/autotrace/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(
    'gcc-libs'
    'glib2'
    'glibc'
    'imagemagick'
    'libpng'
    'pstoedit')
makedepends=(
    'git'
    'intltool')
checkdepends=(
    'ffmpeg'
    'procps-ng')
provides=('autotrace')
conflicts=('autotrace')
source=('git+https://github.com/autotrace/autotrace.git')
sha256sums=('SKIP')

prepare() {
    cd autotrace
    ./autogen.sh
}

pkgver() {
    git -C autotrace describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd autotrace
    ./configure \
        --prefix='/usr' \
        --disable-static \
        --with-magick \
        --with-png \
        --with-pstoedit
    make
    sed -i "s|@MAGICK_LIBS@|$(pkg-config --libs ImageMagick)|" autotrace.pc
}

check() {
    make -C autotrace check
}

package() {
    make -C autotrace DESTDIR="$pkgdir" install
}
