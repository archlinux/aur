# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Maintainer: Eschwartz <eschwartz93@gmail.com>
# Contributors: Ner0, Sevenseven

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=qbittorrent-git
pkgver=3.3.13.r1465.g3d970399d
pkgrel=1
pkgdesc="A bittorrent client powered by C++, Qt5 and the good libtorrent library (development version)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent')
provides=('qbittorrent')
source=("${pkgname%-*}::git+https://github.com/qbittorrent/qBittorrent.git"
        "https://github.com/qbittorrent/qBittorrent/pull/7017.patch")
sha256sums=('SKIP'
            '83844864e7010c1f5c45eb5798c607e421e46a277270f78fa6b9c5fe93fe101a')

pkgver() {
  cd ${pkgname%-*}

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/release-//p}')
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

prepare() {
  cd ${pkgname%-*}

  # New feature exposed bug that is now fixed in libtorrent-rasterbar 1.1.4
  # (flagged on archweb)
  patch -Np1 < ../7017.patch
}

build() {
  cd ${pkgname%-*}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-*}

  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
