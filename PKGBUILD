# Maintainer: Jack Garner <jgarner + @ +  mymail + . + mines + . + edu>
pkgname='xest-window-manager-git'

pkgver=r152.1ffb126
pkgver() {
  cd "Xest-Window-Manager"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
pkgrel=1

makedepends=('git' 'stack' 'gcc' 'zlib')
depends=('sdl2_ttf' 'libxss' 'libxinerama' 'libxrandr' 'ttf-dejavu')
optdepends=('picom: A compositor'
            'polybar: System bar'
            'rofi: Program launcher'
            'dunst: Notifications')

backup=('etc/xest/config.dhall' 'etc/xest/config.99.dhall' 'etc/xest/startup.sh')

source=('git+https://github.com/jhgarner/Xest-Window-Manager')
md5sums=('SKIP')
pkgdesc='The zesty window manager'
url='https://github.com/jhgarner/Xest-Window-Manager'
arch=('x86_64')
license=('BSD3')

package() {
  cd "Xest-Window-Manager"
  stack --no-nix build
  stack --no-nix install --local-bin-path "$pkgdir"/usr/bin/

  desktop=$(cat <<END
[Desktop Entry]
Name=Xest
Comment=The zesty window manager
Exec=/usr/bin/xest-exe
TryExec=/usr/bin/env
Type=Application
DesktopName=Xest
END
)

  mkdir -p "$pkgdir"/usr/share/xsessions/
  echo "$desktop" > "$pkgdir"/usr/share/xsessions/xest.desktop

  mkdir -p "$pkgdir"/etc/xest/
  cp config/* "$pkgdir"/etc/xest/
}
