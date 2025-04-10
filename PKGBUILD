# Maintainer: Christopher Snowhill <kode54@gmail.com>
pkgname=deadbeef-plugins-kode54-git
pkgver=r95.a7cfb6c
pkgrel=1
pkgdesc="A set of plugins for DeaDBeeF (Git version)"
url="https://bitbucket.org/losnoco/deadbeef_plugins"
arch=('x86_64')
license=('GPL2'
         'LGPL2.1'
         'ZLIB'
         'proprietary')
makedepends=('cmake' 'git')
depends=('deadbeef' 'zlib' 'libbass' 'libbassmidi' 'libbass_mpc' 'libbassflac' 'libbassopus'
         'libbasswv' 'libopenmpt' 'vgmstream-git' 'libmgba')
source=('git+https://bitbucket.org/losnoco/deadbeef_plugins.git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/deadbeef_plugins"
  # skip osx/deps and external/apbuild submodules
  git -c submodule."plugins/vgm/vgmstream".update=none -c submodule."plugins/xsf/mGBA".update=none submodule update --init --recursive
}

build() {
  cd "$srcdir/deadbeef_plugins/plugins"
  make
}

package() {
  cd "$srcdir/deadbeef_plugins/plugins"

  make DESTDIR="$pkgdir" install

  install -Dm644 libvgm/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.libvgm"
  install -Dm644 midi/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.midi"
  install -Dm644 openmpt/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.openmpt"
  install -Dm644 vfs_fex/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.vfs_fex"
  install -Dm644 vgm/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.vgm"
  install -Dm644 xsf/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.xsf"
}

pkgver() {
  cd "$srcdir/deadbeef_plugins"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}
