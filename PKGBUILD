# Maintainer: envolution
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=geogram-git
_pkgname='geogram'
pkgver=1.9.2+r1185+g4a7773dea
pkgrel=1
pkgdesc="Library of geometric algorithms"
arch=('x86_64')
url="https://github.com/BrunoLevy/geogram"
license=('BSD')
depends=('glu' 'glfw-x11')
provides=('geogram')
conflicts=('geogram')
makedepends=('cmake' 'ninja' 'git')
source=(
  "git+https://github.com/BrunoLevy/geogram.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  _version=$(git tag --sort=-v:refname --list | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

prepare_submodule() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.src/lib/geogram/third_party/amgcl.url "$srcdir/amgcl"
  git config submodule.src/lib/third_party/glfw.url "$srcdir/glfw"
  git config submodule.src/lib/geogram_gfx/third_party/imgui.url "$srcdir/imgui"
  git config submodule.src/lib/geogram/third_party/libMeshb.url "$srcdir/libMeshb"
  git config submodule.src/lib/geogram/third_party/rply.url "$srcdir/rply"
  git -c protocol.file.allow=always submodule update
}
source+=(
  "amgcl::git+https://github.com/ddemidov/amgcl"
  "glfw::git+https://github.com/glfw/glfw"
  "imgui::git+https://github.com/ocornut/imgui"
  "libMeshb::git+https://github.com/LoicMarechal/libMeshb"
  "rply::git+https://github.com/diegonehab/rply"
)
prepare() {
  cd $_pkgname
  prepare_submodule
}
build() {
  cd ${_pkgname}

  #CFLAGS+=" -Wno-incompatible-pointer-types" \
  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DGEOGRAM_USE_SYSTEM_GLFW3=ON

  ninja -C build
}

package() {
  cd ${_pkgname}

  DESTDIR=${pkgdir} ninja -C build install
  install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
