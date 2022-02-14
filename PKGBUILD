# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.5.4
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/gitstatus/v${pkgver}/build.info
_libgit2ver="tag-0ad3d776aa86dd607dc86dcd7f77ad3ed7ebec61"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha512sums=(
  'db7b082f302851e516c79fb464972fc065aafae426dc1d732b2a08e72d88e47a35b11c079cd7bb8795b8363dc8a583c1c62bb44566d82e5c925a335c015c0329'
  'ffd637fc9e8ed440953f5fc39ca736785ff961f6391bff541dee3fe4e89b3d9eb44ef54767963eb63a14c314c7e53538e00e1ad7d83090d03eead40f160045a5')
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
