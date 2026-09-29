# Maintainer: İbrahim Hakkı Ergin <ibrahimh.ergin@gmail.com>
pkgname=pardus-boot-analyzer-git
_pkgname=pardus-boot-analyzer
pkgver=1.0.6
pkgrel=1
pkgdesc="Graphical (GUI) tool to analyze system boot time and manage startup applications"
arch=('any')
url="https://github.com/06ergin06/pardus-boot-analyzer"
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-cairo' 'polkit' 'systemd')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  # Create directories
  install -d "$pkgdir/usr/share/$_pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  # Copy files
  cp -r main.py src ui locale pardus-boot-analyzer.svg "$pkgdir/usr/share/$_pkgname/"
  
  # Remove pycache if any
  find "$pkgdir" -type d -name "__pycache__" -exec rm -rf {} + || true

  # Launcher script
  cat << 'EOF' > "$pkgdir/usr/bin/$_pkgname"
#!/bin/bash
cd /usr/share/pardus-boot-analyzer
exec python3 main.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  # Desktop entry
  install -Dm644 pardus-boot-analyzer.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Icon
  install -Dm644 pardus-boot-analyzer.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
  install -Dm644 pardus-boot-analyzer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
