# Maintainer: Monekx <https://github.com/Monekx>
pkgname=hyprlink-git
pkgver=r13.082c956
pkgrel=1
pkgdesc="Remote control server for Linux with Android client (uinput, Wayland, Hyprland)"
arch=('x86_64')
url="https://github.com/Monekx/HyprLink"
license=('MIT')
depends=('glibc' 'wl-clipboard' 'playerctl' 'libnotify')
makedepends=('go' 'git')
provides=('hyprlink')
conflicts=('hyprlink')
source=("git+https://github.com/Monekx/HyprLink.git"
        "hyprlink.service"
        "99-hyprlink.rules"
        "hyprlink.sysusers")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "HyprLink"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "HyprLink"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o hyprlink cmd/hyprlink/main.go
}

package() {
  cd "HyprLink"
  
  # Бинарник
  install -Dm755 hyprlink "$pkgdir/usr/bin/hyprlink"

  # Примеры конфигурации (будут скопированы в ~/.config/hyprlink при первом запуске)
  mkdir -p "$pkgdir/usr/share/hyprlink/examples"
  cp -r examples/* "$pkgdir/usr/share/hyprlink/examples/"

  # Systemd User Service
  install -Dm644 "$srcdir/hyprlink.service" "$pkgdir/usr/lib/systemd/user/hyprlink.service"

  # Udev правила для мыши/клавиатуры (uinput)
  install -Dm644 "$srcdir/99-hyprlink.rules" "$pkgdir/usr/lib/udev/rules.d/99-hyprlink.rules"

  # Создание группы uinput
  install -Dm644 "$srcdir/hyprlink.sysusers" "$pkgdir/usr/lib/sysusers.d/hyprlink.conf"
}

install=hyprlink.install
