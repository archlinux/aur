# Maintainer: Jürg Rechsteiner <wergosam@gmail.com>
pkgname=github-manager
pkgver=1.0.8
pkgrel=1
pkgdesc="PyQt6-Desktop-Tool zur Verwaltung von GitHub- und lokalen Git-Repositories ohne Terminal"
arch=('any')
url="https://github.com/wergosam/github-manager"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pygithub' 'python-gitpython' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e30360c6eecea6bda197c44b842a8823a1598b82e9630d489efa0b24e65fa19')

package() {
    cd "github-manager-$pkgver"

    # github_manager.py macht "from translations import ...": beide Dateien
    # muessen im selben Verzeichnis liegen, damit dieser Import zur Laufzeit
    # funktioniert. Deshalb kein Direkt-Install nach /usr/bin, sondern ein
    # eigenes Verzeichnis unter /usr/share plus ein duenner Wrapper.
    install -Dm644 github_manager.py "$pkgdir/usr/share/$pkgname/github_manager.py"
    install -Dm644 translations.py "$pkgdir/usr/share/$pkgname/translations.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec python3 /usr/share/github-manager/github_manager.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
