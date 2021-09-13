# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.5.3
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/gitstatus/v${pkgver}/build.info
_libgit2ver="tag-5860a42d19bcd226cb6eff2dcbfcbf155d570c73"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha512sums=(
  '7cadc28f3a458bf28c721d2b9e669d0b487b6c8e2af255efd2e7385a1edf78eed1109311753b941b4d00ac632e4bd76b4352061b76ef03fea7a34a3f5a0cd99a'
  'c9adfa819aa2d587fb30c32d4addb09623078e3ccadc0a4a063402d4c8d779f2ee60051ea3717b2cc5ff5b7c760c74390c67976ee42389895272b9f5cf66f0d1')
makedepends=('git' 'cmake' 'zsh')
install='gitstatus.install'

build() {
  # Put libgit2-${_libgit2ver}.tar.gz where build expects it.
  ln -sf "$srcdir/libgit2-${_libgit2ver}.tar.gz" "$srcdir/gitstatus-${pkgver}/deps/"
  cd "$srcdir/gitstatus-${pkgver}"
  ./build
}

package() {
  cd "$srcdir/gitstatus-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/gitstatus/{}" ';'
  make -C "$pkgdir"/usr/share/gitstatus zwc minify
}
