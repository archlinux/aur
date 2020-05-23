# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.1.2
pkgrel=1
pkgdesc='10x faster implementation of `git status` command'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/gitstatus/v${pkgver}/build.info
_libgit2ver="tag-005f77dca6dbe8788e55139fa1199fc94cc04f9a"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha512sums=(
  'd046090b6d2e8c56b58e907cbb9dad86609cfaefdea526813978c1c7846178c61cd91fa60b8ca036c4c5b6f55caaa17974c1a23f5055e2b4064ed072a3ba4f7d'
  '1f4ff3844c19cc9fc9857191075cfdda4cf01797b86cfa9fd29ac2a8baf47051211d533fd72f2d273f8ce7c625b59dd965557d8295af084208cc7fb26ba81a34')
makedepends=('git' 'cmake' 'file' 'make' 'gawk' 'gcc' 'zsh')
install='gitstatus.install'

build() {
  # Upstream packaging instructions:
  # https://github.com/romkatv/gitstatus/blob/master/README.md#compiling-for-distribution
  #
  # Put libgit2-${_libgit2ver}.tar.gz where build expects it.
  ln -sf "$srcdir/libgit2-${_libgit2ver}.tar.gz" "$srcdir/gitstatus-${pkgver}/deps/"
  cd "$srcdir/gitstatus-${pkgver}"
  ./build
  rm "./deps/libgit2-${_libgit2ver}.tar.gz"
  for file in *.zsh install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}

package() {
  cd "$srcdir/gitstatus-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/gitstatus/{}" ';'
}
