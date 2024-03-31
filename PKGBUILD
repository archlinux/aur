# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=AHK_X11
pkgname="${_pkgname,,}"
pkgver=1.0.3
pkgrel=3
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
  fuse2
)
makedepends=(
  crystal
  shards
  gcc
)
_xdotool_commit='7b63eb46631815fd4a10e1fd78a37213250d1193'
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "$_pkgname-$pkgver-xdotool-${_xdotool_commit}.tar.gz::https://github.com/jordansissel/xdotool/archive/${_xdotool_commit}.tar.gz"
        "$_pkgname-$pkgver-17_update_crystal-gi.patch::${url}/commit/7873b93b63593cc3a178e6213181d112eb1c6acc.patch"
        "$_pkgname-$pkgver-18_update_gtk3.patch::${url}/commit/fba5a6cd5bef7f475280cbfc6641f7fcc4072ace.patch"
        "$_pkgname-$pkgver-19_update_pango.patch::${url}/commit/9cc4a0baa4685c729601d9fb8e3c154cf1c3dd46.patch"
        "$_pkgname-$pkgver-20_frozen_shards.patch::${url}/commit/b76359fcf79c91e41b3ce46834e0fd6cf727f64e.patch"
        "$_pkgname-$pkgver-23_submodule.patch::${url}/commit/5c4636f95c1d7a95d5f86d6390550dabe2e34d46.patch"
        "$_pkgname-$pkgver-25_create-folders.patch::${url}/commit/047a89722f9680b2b753dee59e74a2d05e746849.patch")
sha256sums=('dd46e1ac73b6a9e1f735911db3ae45de7617400dfb84198be60011733e322168'
            '0315b2d13a39c0c203e6685bb359006f74386f54ccda9e7b24ac2a7131d77827'
            '2bc1401eac1d2527a3880b619123b25c206e0d65b3dfe95f8dd8389e9a5e4e72'
            '683f536709dd1ba78816a4dfeb4f5755af7e5a05c431229a2a132833910c6f27'
            '6346d5cf734b43639a0185d3213296736310bc87765a55f77134282a254cfaa9'
            '2673d8b51e58642a1d734a8d91635d7e4a2ce14ef3e19a960673bb16883236e8'
            'b75eb89f99b9131c4de996f8ca062bae455f8669518124c9c639320e3e55af03'
            '2aab338101e4b0b8a95367f40f880e6696575614ae02eeeb8a8854d2a4d5969a')

prepare() {
  cd "${_pkgname}-${pkgver}"
  mv --no-target-directory "${srcdir}/xdotool-${_xdotool_commit}" ./xdotool
  for p in "${srcdir}"/*.patch; do
    patch -p1 < $p
  done
}

build() {
  cd "${_pkgname}-${pkgver}"
  # Don’t pollute $HOME
  export SHARDS_CACHE_PATH="$srcdir/.cache/shards"
  make bin/ahk_x11
}

#check() {
#  cd "${_pkgname}-${pkgver}"
#  make test-dev
#}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" make install
}
