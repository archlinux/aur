# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Maintainer: Eschwartz <eschwartz93@gmail.com>
# Contributors: Ner0, Sevenseven

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=qbittorrent-git
pkgver=3.3.11.r1051.g9eb01fbe4
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
        "0001-Revert-Use-new-libtorrent-1.1.2-utility-function-to-.patch")
sha256sums=('SKIP'
            '33542b69eb46cf42273514143e6e76969dba03ad9bca58d09f9aa972a109efec')

pkgver() {
  cd ${pkgname%-*}

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/release-//p}')
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

prepare() {
  cd ${pkgname%-*}

  # Remove this once libtorrent-rasterbar 1.1.2 is released and packaged
  # See: https://github.com/qbittorrent/qBittorrent/issues/5888
  patch -p1 < ../0001-Revert-Use-new-libtorrent-1.1.2-utility-function-to-.patch
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
