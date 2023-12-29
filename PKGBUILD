# Maintainer: xiota / aur.chaotic.cx

# options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.0.9.r0.gbfa8ba0
pkgrel=1
pkgdesc="Python binding for FFmpeg which provides sync and async APIs"
url="https://github.com/jonghwanhyeon/python-ffmpeg"
license=('MIT')
arch=(any)

# main package
_main_package() {
  depends=(
    'ffmpeg'
    'python'
    'python-pyee'
    'python-typing_extensions'
  )
  makedepends=(
    'python-build'
    'python-installer'
    'python-pytest-runner'
    'python-setuptools'
    'python-wheel'
  )

  provides=(
    'python-ffmpeg'
  )
  conflicts=(
    'python-ffmpeg'
    'python-ffmpeg-python'
  )

  options=(!emptydirs)

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgver="${pkgver%%.r*}"
  _pkgsrc="$_module-${_pkgver:?}"
  _pkgext="tar.gz"
  source+=("$_pkgsrc.$_pkgext"::"$url/archive/v$_pkgver.$_pkgext")
  sha256sums+=('73c0f98fe0a54e9484b061013bc95a3e5762fff24e8d81e605f185919f5a5e0e')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  _pkgsrc="$_module"

  makedepends+=('git')

  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  source=("$_module"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
}

# common functions
build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# execute
_main_package
