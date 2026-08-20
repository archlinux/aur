# Maintainer: xuanping <a845326948 at gmail dot com>
# Based on the official Arch cosmic-idle package:
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

# Stock cosmic-idle plus a small, additive patch that exports its active
# org.freedesktop.ScreenSaver inhibitors over the session bus as
# com.system76.CosmicIdle.Inhibitors.ListInhibitors() -> a(ss) [(app, reason)].
# cosmic-idle owns org.freedesktop.ScreenSaver but offers no way to list who is
# holding an inhibit (e.g. a browser's "Wake Lock"). Consumed by
# cosmic-ext-applet-inhibit-status. Upstream PR pop-os/cosmic-idle#28.

_srcname=cosmic-idle
pkgname=cosmic-idle-inhibit-export
pkgver=1.6.0
pkgrel=1
epoch=1
pkgdesc='Cosmic idle daemon (patched to export org.freedesktop.ScreenSaver inhibitors over D-Bus)'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-idle
license=(GPL-3.0-only)
provides=("cosmic-idle=${epoch}:${pkgver}")
conflicts=(cosmic-idle)
depends=(
  libgcc
  glibc
  libxkbcommon
  wayland
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-idle.git#tag=epoch-${pkgver}
  screensaver-export.patch
)
b2sums=('23e204198fa8f662a5370bbe064833a3213ba352927223fc9c526b2ed761a69eb5cef6634e696b9eabfa5f4b69415199ca45bcf13146c3496ae35961cb60e162'
        '1f24c7a909aff80ec3df3f4b4c2e94373ef9fe2a3ec5d96009f88900010ba6cd9960e13e32cf6ac10eca82d5eb16957f6176c5b9d7ebde216b55a203674c55a3')

prepare() {
  cd $_srcname
  patch -Np1 -i "$srcdir/screensaver-export.patch"
  cargo fetch --locked
}

build() {
  cd $_srcname
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  CC=clang just build-release --frozen
}

package() {
  cd $_srcname
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
