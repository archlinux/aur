pkgname=thermometer-git
pkgrel=2
pkgdesc="A simple CPU frequency management utility"
arch=('x86_64')
url="github.com"
license=('MIT')
pkgver=1.3.3.24.gb156c44
depends=('dotnet-runtime' 'dotnet-host')
makedepends=('dotnet-sdk')
options=('!debug' '!strip')
source=("git+https://github.com/watchmypizza/thermometer.git")
sha256sums=('SKIP')

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
    -p:PublishSingleFile=true \
    -o "$srcdir/publish"
}

package() {
  install -dm755 "$pkgdir/usr/lib/thermometer"
  cp -a "$srcdir/publish/." "$pkgdir/usr/lib/thermometer/"

  local bin_name=$(find "$srcdir/publish" -maxdepth 1 -executable -type f ! -name "*.dll" ! -name "*.so" -printf "%f\n" | head -n 1)

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/thermometer/$bin_name" "$pkgdir/usr/bin/thermometer"
}
