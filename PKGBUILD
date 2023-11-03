# Maintainer: xiota / aur.chaotic.cx
# Contributor: m4sk1n <m4sk1n@vivaldi.net>
# Contributor: Christian Hesse <mail@eworm.de>

_pkgname=otter-browser
pkgname="$_pkgname-git"
pkgver=1.0.03.r2358.gb2397dc
pkgrel=1
pkgdesc='Browser aiming to recreate the best aspects of the classic Opera (12.x) UI using Qt5'
url='https://github.com/OtterBrowser/otter-browser'
license=('GPL3')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=(
  'qt5-multimedia'
  'qt5-svg'
  'qt5-webengine'
)
makedepends=(
  'cmake'
)
optdepends=(
  'hunspell: for spell checking'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  depends+=(
    'qt5-xmlpatterns'
  )

  _pkgsrc="$_pkgname-${pkgver%%.r*}"
  _pkgext="tar.gz"
  source+=("$_pkgsrc.$_pkgext"::"$url/archive/v${pkgver%%.r*}/$_pkgsrc.$_pkgext")
  sha256sums+=('2b07d22a5d921ec0b3d29a680eb913c3fe0713ca7d10e37873a3802d1a5154a3')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    _tag=$(git tag | tail -1)
    if [[ $(vercmp "$_tag" "v1.0.03") -lt 0 ]] ; then
      _tag="v1.0.03"
    fi

    _revision=$(git rev-list --count "$_tag"..HEAD)
    _hash=$(git rev-parse --short=7 HEAD)

    printf '%s.r%s.g%s' \
      "${_tag#v}" \
      "$_revision" \
      "$_hash"
  }
fi

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=('hicolor-icon-theme')

  DESTDIR="${pkgdir:?}" cmake --install build
}
