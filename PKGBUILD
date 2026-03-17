# Maintainer: Leandro Vitals <lvitals at github.com>
pkgname=lua-rio
pkgver=0.1.13
pkgrel=1
pkgdesc="Lua web framework with MVC architecture and RESTful API support"
arch=('any')
url="https://github.com/lvitals/rio"
license=('MIT')
depends=('lua')
makedepends=('luarocks' 'git')
source=("$pkgname::git+https://github.com/lvitals/rio#tag=v$pkgver")
sha256sums=('ed666af0ccfca5a45e748782c67186f852dbc5f932649ed883bd7db278ef64c4')

package() {
  cd "$pkgname"
  
  # Install using luarocks into the package destination directory.
  # --deps-mode=all ensures that Lua dependencies are installed
  # within the package structure if they are not already present on the system.
  luarocks make --tree "$pkgdir/usr" --deps-mode=all "$pkgname-$pkgver-1.rockspec"
  
  # Remove luarocks manifest files that should not be in the final package
  find "$pkgdir/usr" -name "manifest" -delete
  
  # Ensure the binary is executable
  [ -f "$pkgdir/usr/bin/rio" ] && chmod +x "$pkgdir/usr/bin/rio"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install man page if it exists
  if [ -f "man/rio.1" ]; then
    install -Dm644 man/rio.1 "$pkgdir/usr/share/man/man1/rio.1"
  fi
}
