# Maintainer: GalaxySnail <me+aur@glxys.nl>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_pkgname=bubblewrap
pkgname=bubblewrap-ignoresigs
pkgver=0.11.2
pkgrel=1
pkgdesc='Unprivileged sandboxing tool (ignores SIGINT/SIGQUIT while waiting for childs)'
url='https://github.com/containers/bubblewrap'
arch=(x86_64)
license=(LGPL-2.0-or-later)
provides=(bubblewrap)
conflicts=(bubblewrap)
depends=(
  glibc
  libcap
  libgcc
)
makedepends=(
  bash-completion
  docbook-xsl
  git
  libxslt
  meson
)
source=(
  "git+$url?signed#tag=v$pkgver"
  "ignore-SIGINT-and-SIGQUIT-while-child-running.patch"
)
b2sums=('7166c1483c8c8d6b2fed4220f023b51bc0de2ccc2c61a3435e1adc0d1ded316de027721a6c71e14c957e65f81bf0195634b39db834071055aaff4484ad2d0ecc'
        '56a485a7751fcb7acc2c990b4ee48252f65ef90dbbccedec84843c334fcad97ab55f6c9e84ae995daa3f24918439d92c4b6ef84d27e419deeab85fd84dbfe46b')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90 # Simon McVittie <smcv@collabora.com>
  252C6FEA78A69D3BC0AD458A616C5BDC0C29AB04 # Alexander Larsson <alexl@redhat.com>
)

prepare() {
  cd $_pkgname

  patch -p1 -i ../ignore-SIGINT-and-SIGQUIT-while-child-running.patch
}

build() {
  local meson_options=(
    -D selinux=disabled
  )

  arch-meson $_pkgname build "${meson_options[@]}"

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
