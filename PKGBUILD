# Maintainer: degreeme <suratovvlad@gmail.com>

pkgname=qbittorrent-dark-git
pkgver=4.1.5.r578.g15298b4b8
pkgrel=1
pkgdesc="A dark version of bittorrent client powered by C++, Qt5 and the good libtorrent library (development version)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base')
makedepends=('boost' 'git' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent' 'qbittorrent-git' 'qbittorrent-stable-git')
provides=('qbittorrent')
source=("${pkgname%-*}::git+https://github.com/suratovvlad/qBittorrent.git"
        "0001-Revert-Use-new-libtorrent-1.1.2-utility-function-to-.patch")
sha256sums=('SKIP'
            'd020ac4ce37a871cb92e3f203cc5ccd6de24c1f0a369f7aea67a4be578c48b64')

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
  # patch -p1 < ../0001-Revert-Use-new-libtorrent-1.1.2-utility-function-to-.patch
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
