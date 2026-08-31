# Maintainer: Velamniro <velamniro at proton dot me>

pkgname=hptnacp
_pkgname="hacPack-Tools/hacPackTools-NACP"
pkgver=1.03
_pkgver="1.36-r2"
pkgrel=1
pkgdesc="A tool for creating and viewing Nintendo Switch NACP files"
arch=('x86_64')
url="https://github.com/DarkMatterCore/hacPack/tree/master/hacPack-Tools/hacPackTools-NACP"
_url="https://github.com/DarkMatterCore/hacPack"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc' 'libstdc++' 'tinyxml2')
source=(
    "$pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$_pkgver.tar.gz"
    'fix-makefile.patch')
b2sums=('723b3e969615bf51b304fddf06623fe266b4cd873569d3a823f4a28c0822c530b03dbf598d3ed91531dc6b8f2bd090706bc3812feac1684616007aad60160b9d'
        '5889d90cb1dcbfb72949adc857fa91a7062b282f4002ecd8fcc59bcc388324b21e56d2103ceb492994c600f7b50dc7fdf77d558b93e170f9535ea384e108b86d')

prepare() {
    cd "hacPack-$_pkgver/$_pkgname"

    # Get rid of windows code and make it use system tinyxml2 instead of the bundled one
    sed -i 's/\r$//' Makefile
    patch -Np4 -i "$srcdir/fix-makefile.patch"

    # Use system tinyxml2 instead of the bundled one
    sed -i 's|#include "tinyxml2/tinyxml2.h"|#include <tinyxml2.h>|' nacp.cpp
}

build() {
    cd "hacPack-$_pkgver/$_pkgname"
    make
}

package() {
    cd "hacPack-$_pkgver"

    install -Dm0755 "$_pkgname/hptnacp" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/" # GPL
    install -Dm644 "$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
