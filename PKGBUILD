# Maintainer: Mark Wagie <mark at manjaro dot org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Ron Asimi <ron dot asimi at gmail dot com>
# Contributor: Roman Perepelitsa <roman.perepelitsa@gmail.com>
pkgname=zsh-theme-powerlevel10k
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.20.0
_libgit2ver="tag-2ecf33948a4df9ef45a66c68b8ef24a5e60eaac6"
pkgrel=2
pkgdesc="Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
arch=('x86_64')
url='https://github.com/romkatv/powerlevel10k'
license=('MIT')
makedepends=('git' 'cmake')
depends=('glibc' 'zsh')
optdepends=(
  'ttf-meslo-nerd-font-powerlevel10k: recommended font'
  'powerline-fonts: patched fonts for powerline'
  'ttf-font-nerd: full choice of style options')
  # It works well with Nerd Fonts, Source Code Pro, Font Awesome, Powerline,
  # and even the default system fonts. The full choice of style options is
  # available only when using Nerd Fonts.
replaces=('zsh-theme-powerlevel9k')
_commit=35833ea15f14b71dbcebc7e54c104d8d56ca5268  # tags/1.20.0^0

# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/powerlevel10k/v${pkgver}/gitstatus/build.info
source=(
  "git+https://github.com/romkatv/powerlevel10k.git#commit=$_commit"
#  "powerlevel10k-${pkgver}.tar.gz::https://github.com/romkatv/powerlevel10k/archive/v${pkgver}.tar.gz"
#  "https://github.com/romkatv/powerlevel10k/releases/download/v$pkgver/powerlevel10k-$pkgver.tar.gz.asc"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha256sums=('SKIP'
            '4ce11d71ee576dbbc410b9fa33a9642809cc1fa687b315f7c23eeb825b251e93')
validpgpkeys=('8B060F8B9EB395614A669F2A90ACE942EB90C3DD') # Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgver() {
  cd powerlevel10k
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "${srcdir}/libgit2-${_libgit2ver}"
  cmake \
   -DCMAKE_BUILD_TYPE=None \
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
   -Wno-dev \
   .
  make

  # build gitstatus
  cd "$srcdir/powerlevel10k/gitstatus"
  export CXXFLAGS+=" -I${srcdir}/libgit2-${_libgit2ver}/include -DGITSTATUS_ZERO_NSEC -D_GNU_SOURCE"
  export LDFLAGS+=" -L${srcdir}/libgit2-${_libgit2ver}"
  make
}

package() {
  cd powerlevel10k
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/${pkgname}/{}" ';'

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  # delete unnecessary files. See also: https://bugs.archlinux.org/task/66737
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/obj"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/.gitignore"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/.gitattributes"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/src"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/build"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/deps"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/Makefile"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/mbuild"
  rm "${pkgdir}/usr/share/${pkgname}/.gitattributes"
  rm "${pkgdir}/usr/share/${pkgname}/.gitignore"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/usrbin/.gitkeep"
  rm "${pkgdir}/usr/share/${pkgname}/gitstatus/.clang-format"
  rm -rf "${pkgdir}/usr/share/${pkgname}/gitstatus/.vscode/"

  cd "${pkgdir}/usr/share/${pkgname}"
  for file in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}
