# Maintainer: envolution
# Contributor: Vladimir Borisov <vladimir@stremio.com>
# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=stremio
pkgname=${_pkgname}-git
pkgver=4.4.168.qt6+r851+gf16a7b177
pkgrel=1
pkgdesc="The next generation media center"
arch=('x86_64')
url="https://www.stremio.com"
license=("MIT")
depends=("nodejs" "ffmpeg" "qt5-webengine" "qt5-webchannel" "qt5-declarative" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-translations" "mpv" "openssl")
makedepends=("git" "wget" "qt5-tools" "librsvg" "cmake")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Stremio/stremio-shell.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  _version=$(git tag --sort=-v:refname --list | head -n1 | cut -c2- | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}
prepare() {
  git -C "${_pkgname}" submodule init
  module_paths=($(grep -Po '(?<=path = ).*' "${_pkgname}/.gitmodules"))
  for _submodule in module_paths; do
    git -C "${_pkgname}" config --local "submodule.third_party/${_submodule}.url" "${_submodule}"
  done
  git -C "${_pkgname}" -c protocol.file.allow='always' submodule update
}

build() {
  cd "${_pkgname}"
  make -f release.makefile PREFIX="$pkgdir"
}

package() {
  cd "${_pkgname}"
  export PREFIX="$pkgdir"
  make -f release.makefile install
}
# vim:set ts=2 sw=2 et:
