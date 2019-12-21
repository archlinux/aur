# Maintainer:  Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Doron Behar <doron.behar@gmail.com>
# Contributor: Jason Ryan <jasonwryan@gmail.com>

_name=sxiv
pkgname="${_name}-dir-navigation-git"
pkgver=25.r10.g07300da
pkgrel=1
pkgdesc="Simple X Image Viewer (with patch to browse through images in working directory)"
arch=('x86_64')
url="https://github.com/muennich/sxiv"
license=('GPL2')
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git"
        "dir-navigation.patch")
sha256sums=('SKIP'
            '11a907950d5e9a1fc8e1aa0cd82fc6532ed9d74f91189463455989ffff8da5cd')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  ln -s config.def.h config.h

  echo "==> Applying dir-navigation patch"
  git apply "$srcdir"/dir-navigation.patch
}

build() {
  make -C "${_name}"
}

package() {
  cd "${_name}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  make -C icon PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 sxiv.desktop "$pkgdir"/usr/share/applications/sxiv.desktop
}

# vim:set ts=2 sw=2 et:
