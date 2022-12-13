# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Adam Harvey <adam@adamharvey.name>

pkgname=apfs-fuse-git
pkgver=r93.04f3246
pkgrel=1
pkgdesc="FUSE driver for APFS (Apple File System)"
arch=('i686' 'x86_64')
url="https://github.com/sgan81/apfs-fuse"
license=('GPL2')
depends=('fuse3' 'bzip2' 'zlib')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sgan81/apfs-fuse'
        'git+https://github.com/lzfse/lzfse')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.3rdparty/lzfse.url "$srcdir/lzfse"
  git -c protocol.file.allow=always submodule update
  mkdir -p build
}

build() {
  cd "${pkgname%-git}/build"
  cmake ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  for binary in apfs-dump apfs-dump-quick apfs-fuse ; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
}
