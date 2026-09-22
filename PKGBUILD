# Maintainer: GalaxySnail <me+aur@glxys.nl>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_pkgname=bubblewrap
pkgname=bubblewrap-ignoresigs
pkgver=0.13.0
pkgrel=1
pkgdesc='Unprivileged sandboxing tool (ignores SIGINT/SIGQUIT while waiting for childs)'
url='https://github.com/containers/bubblewrap'
arch=(x86_64)
license=(LGPL-2.1-or-later)
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
# v0.13.0 is unsigned, use commit hash instead
_commit=719a4fd474d44b26906bcf2b1b0fb6eddd8d56d0
source=(
  "git+$url#commit=$_commit"
  "ignore-SIGINT-and-SIGQUIT-while-child-running.patch"
)
b2sums=('5ca3d4a066d48e04441e71ec3809fc5cb039914cd80247d49f79521c4606dbd2d5243c28abc6da7aea5b74770ce979d0f6f3b3b11761733faf20b87f7bf8c117'
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
    -D assume_kernel=6.18.0
    -D selinux=disabled
  )

  arch-meson $_pkgname build "${meson_options[@]}"

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
