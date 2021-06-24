# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Ron Asimi <ron dot asimi at gmail dot com>
# Contributor: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=zsh-theme-powerlevel10k
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.15.0
_libgit2ver="tag-d6c37a38587c9af2a9e63449fc8bf951dca0e854"
pkgrel=1
pkgdesc="Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
arch=('x86_64')
url='https://github.com/romkatv/powerlevel10k'
license=('MIT')
makedepends=('git' 'cmake')
depends=('glibc' 'zsh')
optdepends=(
  'powerline-fonts: patched fonts for powerline'
  'awesome-terminal-fonts: icon package'
)
# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/powerlevel10k/v${pkgver}/gitstatus/build.info
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/powerlevel10k/archive/v${pkgver}.tar.gz"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha512sums=('ba848aed634fcfcc7da901092cd1d9876df5bde06eae729e684e9bc0aa67109e29e5600d56ae2683769e2ce79948e31b9d07aef11d745d04ef68e24de8ac2ad4'
            '11fd09ce20191392947d171e9212a33a998c1f2c4bcb8ab7440a0dc88653ff1324a1529984a607d545ab8863738f4eb946134c46f44bd1c200c6d98c02657292')
replaces=('zsh-theme-powerlevel9k')

build() {
  cd "${srcdir}/libgit2-${_libgit2ver}"
  cmake \
   -DZERO_NSEC=ON \
   -DTHREADSAFE=ON \
   -DUSE_BUNDLED_ZLIB=ON \
   -DREGEX_BACKEND=builtin \
   -DUSE_HTTP_PARSER=builtin \
   -DUSE_SSH=OFF \
   -DUSE_HTTPS=OFF \
   -DBUILD_CLAR=OFF \
   -DUSE_GSSAPI=OFF \
   -DUSE_NTLMCLIENT=OFF \
   -DBUILD_SHARED_LIBS=OFF \
   -DENABLE_REPRODUCIBLE_BUILDS=ON \
   .
  make

  # build gitstatus
  cd "$srcdir/powerlevel10k-${pkgver}/gitstatus"
  export CXXFLAGS+=" -I${srcdir}/libgit2-${_libgit2ver}/include -DGITSTATUS_ZERO_NSEC -D_GNU_SOURCE"
  export LDFLAGS+=" -L${srcdir}/libgit2-${_libgit2ver}"
  make
}

package() {
  cd "$srcdir/powerlevel10k-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/zsh-theme-powerlevel10k/{}" ';'
  # delete unnecessary files. See also: https://bugs.archlinux.org/task/66737
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/obj"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/.gitignore"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/.gitattributes"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/src"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/build"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/deps"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/Makefile"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/mbuild"
  rm "${pkgdir}/usr/share/zsh-theme-powerlevel10k/.gitattributes"
  rm "${pkgdir}/usr/share/zsh-theme-powerlevel10k/.gitignore"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/usrbin/.gitkeep"
  rm "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/.clang-format"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/.vscode/"
  cd "${pkgdir}/usr/share/zsh-theme-powerlevel10k/"
  for file in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}
