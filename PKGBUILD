pkgname=thermometer-git
pkgrel=1
pkgdesc="A simple CPU frequency management utility"
arch=('x86_64')
url="https://github.com/watchmypizza/thermometer"
sha256sums=('SKIP')
license=('MIT')
pkgver=1.3.3.18.9fa75e4
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
options=('!debug')

source=("git+https://github.com/watchmypizza/thermometer.git")
md5sums=()

pkgver() {
  cd "$srcdir/thermometer"
  echo "$(git describe --long --tags --dirty --always | sed 's/^v//;s/-/./g')"
}

build() {
  cd "$srcdir/thermometer"
  dotnet publish Thermometer.sln \
    -c Release \
    -r linux-x64 \
    --self-contained false \
    -o "$srcdir/publish"
}

package() {
  install -dm755 "$pkgdir/usr/lib/thermometer"
  cp -a "$srcdir/publish/." "$pkgdir/usr/lib/thermometer/"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/thermometer" <<'EOF'
#!/bin/sh
exec dotnet /usr/lib/thermometer/thermometer.dll "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/thermometer"
}
