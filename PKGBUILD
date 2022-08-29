# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=zspotify
pkgver=0.5.2
pkgrel=4
pkgdesc="A Spotify downloader needing only a python interpreter and ffmpeg."
arch=("x86_64")
url="https://github.com/afkcodes/zspotify"
license=("GPL3")
depends=(python python-librespot python-music-tag python-pillow python-protobuf python-tabulate python-tqdm python-ffmpy python-mutagen)
makedepends=(python-setuptools)
source=(
  "https://github.com/afkcodes/zspotify/archive/c11cfed6bc811adb2edb9709c16b6a344c000682.tar.gz"
  "zspotify-module-imports.patch"
  "zspotify-paths.patch"
)
sha256sums=("167a53da648096c1193b35cca2732e1230212d18d3e225e07984507a6fcaad98" SKIP SKIP)

build() {
  cd zspotify-c11cfed6bc811adb2edb9709c16b6a344c000682
  patch -p1 -i $srcdir/zspotify-module-imports.patch
  patch -p1 -i $srcdir/zspotify-paths.patch
  python setup.py build
}

package() {
  cd zspotify-c11cfed6bc811adb2edb9709c16b6a344c000682
  python setup.py install --root="$pkgdir" --optimize=1
  mkdir -p "$pkgdir/usr/bin"
  cat <<EOF >"$pkgdir/usr/bin/zspotify"
#!/bin/sh
python -m zspotify \$@
EOF
  chmod +x "$pkgdir/usr/bin/zspotify"
}
