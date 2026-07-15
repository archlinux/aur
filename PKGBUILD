# Maintainer: Victor <victor.oliveira.egion@gmail.com>
pkgname=moon-profile-runner-git
pkgver=r62.4a6463e
pkgrel=1
pkgdesc="Local daemon that detects the end of Apollo/Moonlight streaming sessions and controls the host display (MoonProfile)"
arch=('x86_64')
url="https://github.com/egionCode/moon_profile"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('git' 'rust')
provides=('moon-profile-runner')
conflicts=('moon-profile-runner')
source=("${pkgname%-git}::git+https://github.com/egionCode/moon_profile.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}/moon_profile_runner/src-tauri"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname%-git}/moon_profile_runner/src-tauri"
  install -Dm755 "target/release/moon_profile_runner" "$pkgdir/usr/bin/moon-profile-runner"

  # Autostart de sessao grafica (nao servico systemd) - o app tem
  # tray/GUI e precisa de uma sessao ativa pra aparecer.
  install -Dm644 "../packaging/moon-profile-runner.desktop" \
    "$pkgdir/etc/xdg/autostart/moon-profile-runner.desktop"
  sed -i "s|__EXEC_PATH__|/usr/bin/moon-profile-runner|" \
    "$pkgdir/etc/xdg/autostart/moon-profile-runner.desktop"

  install -Dm644 "../../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
