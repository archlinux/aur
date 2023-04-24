# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# shellcheck disable=all

pkgname=i3-doubleborders
pkgver=4.22
pkgrel=2
pkgdesc='Improved dynamic tiling window manager'
arch=('x86_64')
url=https://i3wm.org
license=('BSD')
groups=('i3')
depends=('libev' 'libxkbcommon-x11' 'pango' 'startup-notification'
         'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-xrm'
         'yajl')
makedepends=('meson' 'xmlto')
optdepends=('dmenu: for the default program launcher'
            'rofi: for a modern dmenu replacement'
            'i3lock: for the default screen locker'
            'xss-lock: for the default screen locker'
            'i3status: for the default status bar generator'
            'perl: for i3-save-tree and i3-dmenu-desktop'
            'perl-anyevent-i3: for i3-save-tree'
            'perl-json-xs: for i3-save-tree')
replaces=('i3' 'i3bar' 'i3-gaps')
provides=('i3-wm')
conflicts=('i3-wm')
backup=('etc/i3/config')
source=("$url/downloads/i3-$pkgver.tar.xz"{,.asc}
        "https://github.com/orestisfl/i3/commit/c305798d42.patch"
        "https://gist.githubusercontent.com/The-Repo-Club/b7111e9028cdfb3e6c60614cdfd19875/raw/178d5273fa91dcf6ed03d96187e78e841c814f35/x.diff")
b2sums=('fa179f445ba4286bfeec98dc7a2e1dfad14bda6874e84878a48ee5890ed4cf3a90fc542e8e14aedaaba3abebc8d280284a3b00e838da70a783064a4bd271ca41'
        '9afac91e427f2a24120b257e6fb2dcc0879a86bc7957fe4562099778f3ee8300a70e71b7e0170d1eab89940ca89a42937da9eb5bd3015f9aabb82a96459a566a'
        'e8e9ef5d8ff25b010fe36ff395f7fb4368e4d8bcb843b42ce06758184cc7b6854ec7efc71c91bc18290de2d4aba3b878453f47f84abc5ab3a0877c523014d701'
        'c2257a564975f4649ec275587dea790cfed8dd0e3e6ee69f6ee60ac3f638d0510d930c74cd2cb6dfc15f4591c2ae9fe1b1d9f84f23967e1992f93a91b91cd301')
validpgpkeys=('424E14D703E7C6D43D9D6F364E7160ED4AC8EE1D') # Michael Stapelberg <michael@stapelberg.de>

prepare() {
  cd i3-$pkgver
  patch -Np1 -i ../c305798d42.patch
  patch -Np1 -i ../x.diff
}

build() {
  cd i3-$pkgver
  arch-meson build
  ninja -C build
}

package() {
  cd i3-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et: