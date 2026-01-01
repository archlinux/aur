pkgname=thermometer
pkgver=1.2
pkgrel=1
pkgdesc="A simple CPU frequency management utility using cpupower and lm_sensors -- just in one package"
arch=('x86_64')
url="https://github.com/watchmypizza/thermometer"
license=('GPL3')
depends=('dotnet-runtime' 'cpupower' 'lm_sensors' 'bash' 'curl')
makedepends=('dotnet-sdk')

options=('!debug')

noextract=()
source=()
md5sums=()

build() {
  dotnet publish ../Thermometer.sln -c Release -r linux-x64 -o "$srcdir/publish"
} 

package() {
  mkdir -p "$pkgdir/usr/lib/thermometer"
  cp -a "$srcdir/publish/." "$pkgdir/usr/lib/thermometer/"

  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/thermometer" <<'EOF'
#!/bin/sh
exec dotnet /usr/lib/thermometer/thermometer.dll "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/thermometer"
}

clean() {
  rm -rf "$srcdir"
  rm -rf "$pkgdir"
}
 