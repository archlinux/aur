# Maintainer:  dreieck

_pkgname=qmp3gain
pkgname="${_pkgname}-git"
_gitname="${_pkgname}"
pkgver=0.9.3.r123.20220727.95b2608
pkgrel=5
pkgdesc='User interface front end supporting famous MP3Gain engine which analyzes and losslessly adjusts MP3 files to a specified target volume.'
url='https://sourceforge.net/projects/qmp3gain/ '
_giturl="git://git.code.sf.net/p/${_pkgname}/code"
arch=('i686' 'x86_64' 'armv5te' 'armv6' 'armv7' 'armv8' 'aarch64')
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'mp3gain'
  'qt5-base'
  'qt5-multimedia'
)
makedepends=(
  'git'
  'make'
  'zopflipng-parallel'
  'qt5-base'  # For `qmake-qt5`
  'qt5-tools' # For `qhelpgenerator`
)
optdepends=(
  'qt5-tools: To view Qt5 help files with `assistant <helpfile>`.'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
  "${_pkgname}-doc-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-doc"
)
source=(
  "${_gitname}::git+${_giturl}"
)
sha256sums=(
 'SKIP'
)

prepare() {
  cd "$srcdir/$_gitname"

  git log > git.log
}

pkgver() {
  cd "$srcdir/$_gitname"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$srcdir/${_gitname}"

  # Add here stuff which may be needed to fix compilation errors because of warnings treated as error.
  _FIXWERROR=""
  # Silence compiler warnings
  #_SILENCEWARNINGS="-Wno-deprecated-declarations -Wno-template-id-cdtor -Wno-unused-variable -Wno-unused-parameter"
  _SILENCEWARNINGS="-w"
  _CFLAGSADDITIONS=" ${_FIXWERROR} ${_SILENCEWARNINGS}"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  qmake-qt5
  make

  zopflipng-parallel -m -- "resources/linux/icons/hicolor"/*/*.png
}

package() {
  cd "$srcdir/${_gitname}"

  ## Insall manually, since `DESTDIR` seems not to be honoured.
  INSTALL_ROOT="${pkgdir}" make install

  # Install help files:
  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -rv help "${pkgdir}/usr/share/doc/${_pkgname}"/
  rm -r "${pkgdir}/usr/share/doc/${_pkgname}"/help/{help.pro,Makefile,qmp3gain.qhcp,qmp3gain.qhp,readme.txt}

  # Install documentation and license:
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log CHANGES.md INSTALL.md README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt"
}
