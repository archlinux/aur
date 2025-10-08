# Maintainers: Jiri Antonu <jirka@nullable.group>, Matouš Kavalík <matous@kavalik.net>

pkgname=flexibee-client-latest
pkgver=2025.7.7
pkgrel=1
pkgdesc="ABRA Flexi Economic System (requires jdk11-temurin from AUR)"
arch=('any')
url="http://www.flexibee.eu/"
license=('custom')
depends=('xdg-utils')
checkdepends=('jdk11-temurin')
conflicts=('flexibee' 'flexibee-client' 'flexibee-client-bin')
source=("https://download.flexibee.eu/download/2025.7/${pkgver}/flexibee-client_${pkgver}_all.deb")
sha256sums=('SKIP')

prepare() {
  if [ ! -x /usr/lib/jvm/java-11-temurin/bin/java ]; then
      echo "ABRA Flexi requires jdk11-temurin. Please install it from AUR."
      exit 1
  fi

  # Extract the .deb package
  ar x "flexibee-client_${pkgver}_all.deb" data.tar.* control.tar.* || true
  tar -xf data.tar.* -C "$srcdir"
}

package() {
  # Ensure target directories exist
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share"

  # Copy upstream files
  cp -a usr/bin/* "$pkgdir/usr/bin/"
  cp -a usr/share/* "$pkgdir/usr/share/"

  # Configuration
  install -Dm644 etc/default/flexibee "$pkgdir/etc/default/flexibee"
}

