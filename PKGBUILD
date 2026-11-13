# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname=libdxfrw-git
pkgver=2.2.0.r29.gd68fb1e
pkgrel=1
pkgdesc="C++ library to read/write DXF files in binary and ASCII form and to read DWG files from r14 to v2015 (latest git version)"
url="https://github.com/LibreCAD/libdxfrw"
license=('GPL-2.0-only')

arch=('x86_64')
makedepends=('git' 'cmake')
depends=('libgcc' 'libstdc++')

conflicts=('libdxfrw')
provides=("libdxfrw=${pkgver}")

source=("${pkgname}::git+https://github.com/LibreCAD/libdxfrw.git")
sha256sums=('SKIP')

function pkgver
{
    cd "$pkgname" || return

    git describe --long --abbrev=7 | sed 's/^v//;s/LC//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build
{
  cd "$pkgname" || return

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_LIBDIR="lib" \
      -S . \
      -B build \
      -DCMAKE_BUILD_TYPE=Release

  cd build || return

  make all
}

function package
{
  cd build || return

  make install DESTDIR="$pkgdir"
}
