# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Adam Harvey <adam@adamharvey.name>

pkgname=apfs-fuse-git
pkgver=r101.66b86bd
pkgrel=3
pkgdesc="FUSE driver for APFS (Apple File System)"
arch=('i686' 'x86_64')
url="https://github.com/sgan81/apfs-fuse"
license=('GPL2')
depends=('fuse3' 'bzip2' 'zlib')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sgan81/apfs-fuse'
        'git+https://github.com/lzfse/lzfse'
        'cmake-minimum-3.5.patch'
        '205.patch')
sha256sums=('SKIP'
            'SKIP'
            'a8a4ac6a1e08c4ffd3ea4789c71b9270ba07c1b8c283ba34bd204bb61b095609'
            '7b98aa67a2077b84825b8998ebc1741eefb9a91f50344ba990872ad85347bdce')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.3rdparty/lzfse.url "$srcdir/lzfse"
  git -c protocol.file.allow=always submodule update
  git apply ../cmake-minimum-3.5.patch
  git apply ../205.patch
  mkdir -p build
}

build() {
  cd "${pkgname%-git}/build"
  cmake ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  for binary in apfs-dump apfs-dump-quick apfs-fuse apfsutil ; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
}
