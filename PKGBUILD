# Maintainer: el gato <gato.mega.mp3@gmail.com>
pkgname=winamp-mpris
pkgver=0.1.4
pkgrel=4
pkgdesc="MPRIS bridge for Winamp running under Wine (exposes a playerctl-compatible MPRIS endpoint)"
arch=('any')
url="https://github.com/elgatolinux/winamp-mpris"
license=('MIT')
depends=('python' 'wine' 'playerctl' 'python-dbus-next')
provides=('winamp-mpris')
conflicts=()
replaces=()
source=(git+${url}.git#branch=main)
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  # Verificar que los archivos existen
  if [ ! -f "winamp_mpris.py" ]; then
    echo "Error: winamp_mpris.py no encontrado"
    return 1
  fi
}

package() {
  cd "$srcdir/$pkgname"
  
  # Instalar el script principal (nombre correcto con guion bajo)
  install -Dm755 winamp_mpris.py "$pkgdir/usr/bin/winamp-mpris"
  
  # Instalar el servicio de systemd
  install -Dm644 winamp-mpris.service "$pkgdir/usr/lib/systemd/user/winamp-mpris.service"
  
  # Instalar clamp.exe si existe
  if [ -f "clamp.exe" ]; then
    install -Dm644 clamp.exe "$pkgdir/usr/share/winamp-mpris/clamp.exe"
  fi
  
  # Instalar LICENSE si existe
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  # Instalar README si existe
  if [ -f "README.md" ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
