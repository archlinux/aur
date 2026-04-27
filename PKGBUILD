# Maintainer: Lucas Vasconcelos <lucaslou4@gmail.com>

pkgname=discord-launcher-git
_pkgname=discord-launcher
pkgver=0.0.1
pkgrel=1
pkgdesc="Keeps an up-to-date Discord install in your home directory, so Discord updates don't need root"
url='https://github.com/vscncls/discord-launcher'
arch=('x86_64')
license=('MIT' 'Apache')
depends=('zenity' 'gtk3' 'libxss' 'libnotify' 'nspr' 'nss' 'desktop-file-utils')
makedepends=('cargo' 'git')
backup=('etc/discord-launcher.conf')
provides=('discord-launcher' 'discord')
conflicts=('discord-launcher')
options=('!lto' '!debug')
source=("git+https://github.com/vscncls/discord-launcher.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/discord-launcher

  install -Dm644 contrib/discord-launcher.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 contrib/discord-launcher.conf -t "${pkgdir}/etc"

  if [ -f contrib/icons/discord.png ]; then
    install -Dm644 contrib/icons/discord.png \
      "${pkgdir}/usr/share/pixmaps/discord-launcher.png"
    install -Dm644 contrib/icons/discord.png \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/discord-launcher.png"
  fi

  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

# vim: ts=2 sw=2 et:
