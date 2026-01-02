pkgname=thermometer
pkgver=1.4.5
pkgrel=1
pkgdesc="A simple CPU frequency management utility"
arch=('x86_64')
url="https://github.com/watchmypizza/thermometer"
license=('MIT')
depends=('dotnet-runtime' 'bash' 'curl')
makedepends=('dotnet-sdk')

options=('!debug')

noextract=()
source=()
md5sums=()

build() {
  cd $srcdir
  git clone https://github.com/watchmypizza/thermometer.git
  cd thermometer
  dotnet publish ./Thermometer.sln -c Release -r linux-x64 -o "$srcdir/publish"
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
  setcap "cap_sys_admin=ep" /usr/bin/thermometer
}

clean() {
  rm -rf "$srcdir"
  rm -rf "$pkgdir"
}
 