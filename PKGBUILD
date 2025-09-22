# Maintainer: SpacingBat3 <git@spacingbat3.anonaddy.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

pkgname=manaplus-sdl2
pkgver=2.1.3.17
pkgrel=4
pkgdesc="Free OpenSource 2D MMORPG client for Evol Online, The mana world and similar servers. SDL2 version."
arch=('x86_64')
url="https://manaplus.org/"
license=('GPL-2.0-or-later')
depends=('glu' 'libxml2' 'physfs' 'sdl2_'{'image','mixer','net','ttf','gfx'} 'curl')
makedepends=('mesa')
optdepends=('xdg-utils: open in-game urls in browser')
provides=("manaplus=$pkgver")
conflicts=('manaplus')
replaces=('tmw')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ManaPlus/ManaPlus/archive/v$pkgver.tar.gz"
		"0000-add-missing-cstdint.patch"
		"0001-fix-missing-ctime.patch"
		"0002-fix-new-libxml2.patch")
sha256sums=('5506a283e4df6ea96750347dc1b67d8f71421acff8070a13a15c00960b16c9f7'
            'a0ad6d079ee70796810215d1e17e4e8c8a00381053def52fd7b5ad89f85aa16f'
            'bb033746059e5fb7de64d4fce2215a6612c1d027ec1bd553fafb63cab0daab5f'
            'd063fd9045b296801800064ca77b41ec896dc6a537f97d5a0797c0b1e1e63121')
b2sums=('8b046f45b009a294084ea6239974ef9dabb618947955e5c89edd6b77b4520d2f38cdb1e21fd30aa20e5155bd9f01d81501fae477708b076ca8729ba3b4424e08'
        'e971da772e94564423c11d4ec499f748a82f52deda5f1f33e15deb022bc08f57cc610d48ee1b5c877ef02bc0560ea719e681f3a42b30310c69e8a6d803fa265a'
        '735e594aa699d07b8c9a8b2b1b299b94927e0b465ce32614aa4732c0c7af4c0085fa7646101de08693be7d69f2ab352291470c6ca09d85d3d3db279f7da7d6a7'
        '0d6101de44327810dd40f258787c5e70b99e88bf74079e4b7bc11d93f5566a5c9ea4d95004ac1ad612dbc42e09cba3de1cce592d307c34fc45b5f65355bafb75')

prepare() {
  cd ManaPlus-$pkgver
  # Apply all patches in source[@]
  for _patch in "${source[@]}"; do if [ ".${_patch#*.}" = ".patch" ]; then
    echo "Applying patch ${_patch}..."
    patch -Np1 -i "${srcdir}/${_patch}"
  fi; done
  # Fix "test" syntax for POSIX envs in configure.ac
  sed -Ei 's/(test +"?x?\$[a-z0-9_]+"?+ +=)=/\1/g;' configure.ac
  # Auto-update configure.ac and fix some deprecations/obsoletes.
  autoupdate
  autoreconf -i
}

build() {
  cd ManaPlus-$pkgver

  ./configure --prefix=/usr --with-sdl2
  make
}

package() {
  cd ManaPlus-$pkgver

  make DESTDIR="${pkgdir}" install
}
