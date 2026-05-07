# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfwl4
pkgname=${_pkgname}-git
_pkgver=0.1.0dev
pkgver=r446+6fe80c5
pkgrel=1
pkgdesc="Wayland compositor for xfce4 (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/kelnos/xfwl4"
license=('GPL-3.0-or-later')
groups=('xfce4-git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${_pkgver}")
depends=('gtk3' 'xfconf>=4.21.1' 'libxfce4ui>=4.21.4' 'libdisplay-info' 'libdrm' 'libinput' 'mesa' 'pixman'
         'seatd' 'libxkbcommon')
makedepends=('cargo' 'rust' 'git' 'meson')
source=("${_pkgname}::git+https://gitlab.xfce.org/kelnos/xfwl4"
        'fix_podir.patch'
        'gettext1.0.patch'
        'disable_xfwl4_binary_install_from_meson.patch')
sha256sums=('SKIP'
            '638c8251f11d4b9f312352d19cd1ddeb967b97223db2a774ed9a07f66dfa9808'
            'eb047de3cc53a456b6d750e6dd4a681427f6a087419898858491cbb05ea02340'
            '38b3cbd20567118871e1680120a5629f164868452c2329fbda11d12cc50396b8')

pkgver() {
  cd "${_pkgname}"
  # Once there are (pre)release tags I'll version it as 
  # release + commits since release + short git tag
  printf 'r%s+%s' `git rev-list --count HEAD` `git rev-parse --short HEAD`
}

prepare() {
  cd ${_pkgname}
  patch -Np2 -i ../fix_podir.patch
  # Project pulls in bindings for gettext 0.26. We need rust bindings for 1.0
  patch -Np2 -i ../gettext1.0.patch
  # The custom install script for the xfwl4 binary doesn't respect the 
  # --destdir flag and tries to install directly to /usr/bin
  # Disable installing it with meson; we'll do it manually in package()
  patch -Np2 -i ../disable_xfwl4_binary_install_from_meson.patch
  
  git submodule init
  git submodule update
}

build() {
  local meson_options=(
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm755 build/xfwl4/release/xfwl4 "${pkgdir}"/usr/bin/xfwl4
}
