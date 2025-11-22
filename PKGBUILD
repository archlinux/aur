# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Ron Asimi <ron dot asimi at gmail dot com>
# Contributor: Roman Perepelitsa <roman.perepelitsa@gmail.com>
pkgname=zsh-theme-powerlevel10k
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.20.15  ## see P9K_VERSION in internal/p10k.zsh
_libgit2ver="tag-2ecf33948a4df9ef45a66c68b8ef24a5e60eaac6"
pkgrel=1
pkgdesc="Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
arch=('x86_64' 'aarch64')
url='https://github.com/romkatv/powerlevel10k'
license=('MIT')
makedepends=(
  'git'
  'cmake'
)
depends=(
  'glibc'
  'zsh'
)
optdepends=(
  # It works well with Nerd Fonts, Source Code Pro, Font Awesome, Powerline,
  # and even the default system fonts. The full choice of style options is
  # available only when using Nerd Fonts.
  'ttf-meslo-nerd-font-powerlevel10k: recommended font'
  'powerline-fonts: patched fonts for powerline'
  'ttf-font-nerd: full choice of style options'
)
replaces=('zsh-theme-powerlevel9k')
_commit=36f3045d69d1ba402db09d09eb12b42eebe0fa3b

# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/powerlevel10k/v${pkgver}/gitstatus/build.info
source=(
  "git+https://github.com/romkatv/powerlevel10k.git#commit=${_commit}"
#  "powerlevel10k-${pkgver}.tar.gz::https://github.com/romkatv/powerlevel10k/archive/v${pkgver}.tar.gz"
#  "https://github.com/romkatv/powerlevel10k/releases/download/v$pkgver/powerlevel10k-$pkgver.tar.gz.asc"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha256sums=('e53c80c488f42e708f46512ccbb511e4ce21df01b892b5558345a5ce20c81bb0'
            '4ce11d71ee576dbbc410b9fa33a9642809cc1fa687b315f7c23eeb825b251e93')
#validpgpkeys=('8B060F8B9EB395614A669F2A90ACE942EB90C3DD') # Roman Perepelitsa <roman.perepelitsa@gmail.com>

build() {
  cd "libgit2-${_libgit2ver}"
  local cmake_options=(
    -W no-dev
    -D CMAKE_BUILD_TYPE='None'
    -D ZERO_NSEC='ON'
    -D THREADSAFE='ON'
    -D USE_BUNDLED_ZLIB='ON'
    -D REGEX_BACKEND='builtin'
    -D USE_HTTP_PARSER='builtin'
    -D USE_SSH='OFF'
    -D USE_HTTPS='OFF'
    -D BUILD_CLAR='OFF'
    -D USE_GSSAPI='OFF'
    -D USE_NTLMCLIENT='OFF'
    -D BUILD_SHARED_LIBS='OFF'
    -D ENABLE_REPRODUCIBLE_BUILDS='ON'
  )
  cmake "${cmake_options[@]}" .
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
