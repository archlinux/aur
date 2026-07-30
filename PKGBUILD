# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=fwm
pkgname="${_pkgname}"-git
pkgver=0.3.0.r125.gd4ad90e
pkgrel=1
pkgdesc="A hhysics-based Wayland compositor written in C (Git version)"
arch=('x86_64')
url="https://github.com/iluaii/${_pkgname}"
license=('GPL-2.0-only')
depends=('box2d' 'cairo' 'ffmpeg' 'gdk-pixbuf2' 'libglvnd' 'libinput'
         'libpipewire' 'libpulse' 'libxkbcommon' 'pango' 'pixman' 'wayland'
         'wlroots0.20')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${_pkgname}"
   git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
   cmake -S "${_pkgname}" -B build \
      -DCMAKE_BUILD_TYPE=None \
      -DFWM_TESTS=ON
   cmake --build build
}

check() {
   ctest --test-dir build --output-on-failure
}

package() {
   # Executables
   install -Dm755 build/"${_pkgname}" -t "${pkgdir}"/usr/bin
   install -m755 build/"${_pkgname}"ctl -t "${pkgdir}"/usr/bin

   # Documentation
   install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/docs
   install -m644 "${_pkgname}"/README.md -t "${pkgdir}"/usr/share/doc/"${pkgname}"
   install -m644 "${_pkgname}"/docs/*.md -t "${pkgdir}"/usr/share/doc/"${pkgname}"/docs

   # Example config
   install -dm755 "${pkgdir}"/usr/share/"${_pkgname}"
   install -m644 "${_pkgname}"/config.toml.example -t "${pkgdir}"/usr/share/"${_pkgname}"
}

# vim: ts=3 sw=3 et:
