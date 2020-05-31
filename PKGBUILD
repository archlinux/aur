# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.1.3
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
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
  '3e21151e27af6a4124f3e0d7805e68e4e6908f03d485a643280e865241a4177ed284477790040aaa6951b196d1bf236a326d6762554d93f8b733d07c913a83de'
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
