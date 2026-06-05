# Maintainer: Sergey Alexeyev <acenotass@gamil.com>

author=s-n-alexeyev
pkgname=torctl-gui
_gitname=torctl-gui
pkgver=0.r0.g0
pkgrel=1
pkgdesc='Graphical interface for torctl/tor'
arch=('any')
url='https://github.com/s-n-alexeyev/torctl-gui'
license=('GPL3')

depends=('torctl' 'tor' 'yad' 'macchanger' 'iproute2' 'pam' 'libnotify' 'systemd')
makedepends=('git')

provides=('torctl-gui')
conflicts=('torctl-gui')

source=("git+https://github.com/$author/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"

  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm 755 "$_gitname" "$pkgdir/usr/bin/$_gitname"

  install -Dm 644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Name=Managing tor/torctl
Name[ru]=Управление tor/torctl
Comment=Graphical interface for torctl/tor
Comment[ru]=Графическая оболочка для torctl/tor
Type=Application
Exec=torctl-gui %F
Icon=tor
Terminal=false
Categories=Utility;
Keywords=tor;torctl;
Keywords[ru]=tor;torctl;
StartupNotify=true
EOF

  install -Dm 644 "$_gitname/tor.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/torctl-gui.svg"
}
