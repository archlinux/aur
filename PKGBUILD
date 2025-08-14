# Maintainer : 00ein00 <Ein420@proton.me>
pkgname='niflveil'
pkgver=1.32
pkgrel=1
pkgdesc="Minimalistic window minimizer for Hyprland (NiflVeil)."
arch=('x86_64')
url='https://github.com/Mauitron/NiflVeil'
license=('MIT')
source=('git+https://github.com/Mauitron/NiflVeil.git')
makedepends=('git' 'pkgconf' 'openssl')
depends=('hyprland')
optdepends=('eww: restore menu interface'
  'waybar: waybar module support')
provides=('niflveil=${pkgver}')
conflicts=('niflveil')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/NiflVeil" || return 1
}

build() {
  cd "$srcdir/NiflVeil/niflveil" || return 1
  cargo build --release
}

pre_remove() {
  if [[ -f "/${INSTDIR}" ]]; then
    rm -rvf "/${INSTDIR}"
  fi
}

post_remove() {
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
  update-desktop-database -q
}

package() {
  cd "$srcdir/NiflVeil/" || return 1

  # install binary
  install -Dm755 "niflveil/target/release/niflveil" "$pkgdir/usr/local/bin/niflveil"

  # install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
