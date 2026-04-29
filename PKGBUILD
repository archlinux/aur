# Maintainer: hypr-nm maintainers

pkgname=hypr-network-manager-git
_pkgname=hypr-network-manager
pkgdesc="Themeable NetworkManager applet for Hyprland"
pkgver=0.2.0.r492.gae6f029
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/hypr-nm/hypr-network-manager"
license=('GPL-3.0-or-later')

depends=(
  gtk4
  gtk4-layer-shell
  json-glib
  networkmanager
)

makedepends=(
  git
  meson
  ninja
  pkgconf
  vala
)

provides=('hypr-network-manager')
conflicts=('hypr-network-manager')

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  local basever rev hash
  basever="$(sed -n "s/^  version: '\\([^']*\\)',$/\\1/p" meson.build | head -n 1)"
  rev="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"

  if [[ -n "$basever" ]]; then
    echo "${basever}.r${rev}.g${hash}"
  else
    echo "r${rev}.g${hash}"
  fi
}

build() {
  cd "$_pkgname"

  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dstrip=true

  meson compile -C build
}

package() {
  cd "$_pkgname"

  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 SUPPORT.md "$pkgdir/usr/share/doc/$pkgname/SUPPORT.md"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 docs/Documentation.md "$pkgdir/usr/share/doc/$pkgname/Documentation.md"

  install -Dm644 dotfiles/hypr-network-manager/config.json \
    "$pkgdir/etc/xdg/$_pkgname/config.json"

  install -dm755 \
    "$pkgdir/etc/xdg/$_pkgname/themes"

  cp -a dotfiles/hypr-network-manager/themes/. \
    "$pkgdir/etc/xdg/$_pkgname/themes/"
}
