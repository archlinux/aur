# SPDX-License-Identifier: AGPL-3.0

# Maintainer: Sam Day <me@samcday.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: geno <dev@fireorbit.de>
# Contributor: <luntik2012@gmail.com>
# Contributor: Julian Fairfax <juliannfairfax@protonmail.com> 
# Contributor: vpzomtrrfrt <colin@vpzom.click>

pkgname=gnome-chatty
# NOTE! Make sure to update the libcmatrixrev that Chatty is using when bumping Chatty version.
# See below for more info.
pkgver=0.8.2
pkgrel=2
pkgdesc='XMPP and SMS messaging via libpurple and ModemManager'
url='https://gitlab.gnome.org/World/Chatty'
license=(
  GPL3
)
arch=(
  aarch64
  armv6h
  armv7h
  arm
  i686
  pentium4
  x86_64
)
depends=(
  evolution-data-server
  feedbackd
  libhandy
  libmm-glib
  libolm
  libpurple-carbons
)
optdepends=(
  'libpurple-lurch: XMPP E2E OMEMO encryption'
  'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing'
)
makedepends=(
  itstool
  meson
  pkg-config
)
group="gnome-world"
_srcname="Chatty-v${pkgver}"
source=("${url}/-/archive/v${pkgver}/${_srcname}.tar.gz")

# The following is a temporary hack to workaround upstream not including libcmatrix in source tarball:
# https://gitlab.gnome.org/World/Chatty/-/issues/869
# libcmatrix doesn't have a tagged release yet, so just download the rev that Chatty is using.
_libcmatrixrev='702b894675f12ecd43439b3b3eee66cc74899b82'
source+=("https://source.puri.sm/Librem5/libcmatrix/-/archive/${_libcmatrixrev}/libcmatrix-main.tar.gz")

sha256sums=('02bd3a7c64655becc962b6df5c391b295c2030cc6e5e3f58da8f0bb5afceb6eb'
            '68e06a610bf86ddb83d6567617228fa66eeb14a2ee3ed90f3a9d04ad8569e951')

build() {
  cp -R libcmatrix-702b894675f12ecd43439b3b3eee66cc74899b82/* "${_srcname}/subprojects/libcmatrix"
  cd "${_srcname}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${_srcname}"
  meson install -C build --destdir "$pkgdir"
}

