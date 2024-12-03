# Maintainer: envolution
# Contributor: Vladimir Borisov <vladimir@stremio.com>
# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=stremio
pkgname=${_pkgname}-git
pkgver=4.4.168.qt6+r851+gf16a7b177
pkgrel=3
pkgdesc="The next generation media center"
arch=('x86_64')
url="https://www.stremio.com"
license=("MIT")
depends=("nodejs" "ffmpeg" "qt6-base" "mpv" "openssl" "hicolor-icon-theme")
#depends=("qt5-webchannel" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-translations") - not clear yet if these are being replaced in qt6
makedepends=("git" "wget" "librsvg" "cmake" "qt5-base" "qt5-declarative" "qt5-webengine")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/Stremio/stremio-shell.git#branch=master"
  'git+https://github.com/Ivshti/libmpv.git'
  'git+https://github.com/itay-grudev/SingleApplication.git'
  'git+https://github.com/Ivshti/razerchroma.git'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd $_pkgname
  _version=$(git tag --sort=-v:refname --list | head -n1 | cut -c2- | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}
prepare() {
  git -C "${_pkgname}" submodule init
  git -C "${_pkgname}" config --local submodule.deps/libmpv.url "${srcdir}/libmpv"
  git -C "${_pkgname}" config --local submodule.deps/singleapplication.url "${srcdir}/SingleApplication"
  git -C "${_pkgname}" config --local submodule.deps/chroma.url "${srcdir}/razerchroma"
  git -C "${_pkgname}" -c protocol.file.allow='always' submodule update
}

build() {
  cd "${_pkgname}"
  make -f release.makefile PREFIX="$pkgdir"
}

package() {
  cd "${_pkgname}"
  make -f release.makefile install PREFIX="$pkgdir"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/stremio/stremio "$pkgdir/usr/bin/stremio"
  install -Dm644 "${pkgdir}/opt/stremio/smartcode-stremio.desktop" "${pkgdir}/usr/share/applications/com.stremio.stremio.desktop"

  install -Dm644 "images/stremio.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/smartcode-stremio.svg"
  # icons
  local _file
  local _res
  while read -r -d '' _file; do
    _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//')"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
    ln -s ../../../../../../opt/stremio/icons/smartcode-stremio_${_res}.png \
      "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio.png"
    ln -s ../../../../../../opt/stremio/icons/smartcode-stremio-tray_${_res}.png \
      "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/smartcode-stremio-tray.png"
  done < <(find "${pkgdir}/opt/stremio/icons" -maxdepth 1 -type f -name 'smartcode-stremio_*.png' -print0)
  install -Dm644 "images/stremio_tray_black.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/smartcode-stremio_tray_black.svg"
  install -Dm644 "images/stremio_tray_white.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/smartcode-stremio_tray_white.svg"
}
# vim:set ts=2 sw=2 et:
