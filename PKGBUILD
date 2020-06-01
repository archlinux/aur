# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Ron Asimi <ron dot asimi at gmail dot com>
# Contributor: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=zsh-theme-powerlevel10k
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.11.0
_libgit2ver="tag-005f77dca6dbe8788e55139fa1199fc94cc04f9a"
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
sha512sums=('28177cc961f1fe5460f5ab1c792b539876f3b613d2b74df4de62ec32581e009067345ac3c98fe7350161e8df3e7774245e3df1eb933f49a0627648fded1198e1'
            '1f4ff3844c19cc9fc9857191075cfdda4cf01797b86cfa9fd29ac2a8baf47051211d533fd72f2d273f8ce7c625b59dd965557d8295af084208cc7fb26ba81a34')
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
  rm "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/.clang-format"
  rm -rf "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/.vscode/"
  # unfortunetaly this is necessary. Otherwise gitstatus/install will try to
  # sideload the gitstatus binary and place it in $HOME/.cache/gitstatus/
  mv "${pkgdir}/usr/share/zsh-theme-powerlevel10k/gitstatus/usrbin/"{gitstatusd,gitstatusd-linux-$CARCH}
  # make sure to apply zsh compiling on files in pkgdir
  cd "${pkgdir}/usr/share/zsh-theme-powerlevel10k/"
  for file in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}
