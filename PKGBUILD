# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.5.5
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/gitstatus/v${pkgver}/build.info
_libgit2ver="tag-2ecf33948a4df9ef45a66c68b8ef24a5e60eaac6"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha512sums=(
  '8fa4fe941128427f5362d97620bbf5b2722682843197649b3acae4e9ccffcb694226510b2957c65b6b68c27e5518a3b6aa841b624cff160e48d8c8014e0f6757'
  'f3d056eb181ec084ebe3d5bcd6edaddb781a22eeac747115cb4fb09015904ccae9b439145430bfe6fd544e39fe3f019e3512e1010549d53cc8338039ec339f9c')
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
