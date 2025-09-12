# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>

pkgname=rofi-file-selector-git
pkgver=r37.20240606.24a3022
pkgrel=1
pkgdesc="A set of scripts and python programs to quickly find and open files using rofi"
arch=('any')
url="https://gitlab.com/matclab/rofi-file-selector"
license=('MIT')
depends=('rofi>=1.6.0' 'bash>=4.3' 'python>=3.7' 'python-gobject' 'python-cairo' 'fd' 'choose' 'xsel')
makedepends=('git')
provides=('rofi-file-selector')
conflicts=('rofi-file-selector')
source=('git+https://gitlab.com/matclab/rofi-file-selector.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rofi-file-selector"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format='%cd.%h' --date=format:'%Y%m%d')"
}

package() {
  cd "$srcdir/rofi-file-selector"
  
  # Create installation directory
  install -d "$pkgdir/usr/share/rofi-file-selector"
  
  # Install all scripts together to maintain SCRIPTPATH
  install -Dm755 rofi-file-selector.sh "$pkgdir/usr/share/rofi-file-selector/"
  install -Dm755 chooseexe.sh "$pkgdir/usr/share/rofi-file-selector/"
  install -Dm755 fd_cache.sh "$pkgdir/usr/share/rofi-file-selector/"
  install -Dm755 mimeapps "$pkgdir/usr/share/rofi-file-selector/"
  install -Dm755 mimeapps.sh "$pkgdir/usr/share/rofi-file-selector/"
  
  # Install config example
  install -Dm644 config.sh.example "$pkgdir/usr/share/rofi-file-selector/"
  
  # Create wrapper script in /usr/bin
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/rofi-file-selector" << 'EOF'
#!/usr/bin/env bash
exec "/usr/share/rofi-file-selector/rofi-file-selector.sh" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/rofi-file-selector"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  
  # Install license if available
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
