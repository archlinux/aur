# Contributer: Equim <sayaka@ekyu.moe>

pkgname=udpspeeder
_realname=UDPspeeder
pkgver=20210116.0
pkgrel=1
pkgdesc='Improve your Network Quality on a High-latency Lossy Link by using Forward Error Correction'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/wangyu-/UDPspeeder"
license=('MIT')
depends=('gcc-libs')
optdepends=('python: for running systemd service')
backup=('etc/udpspeeder/config.json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wangyu-/UDPspeeder/archive/refs/tags/$pkgver.tar.gz"
"config.json"
"udpspeeder.py"
"udpspeeder.service"
"udpspeeder@.service"
)
sha256sums=('657ae24dfd592a1f6f114342231b24d09baec712957969f425477b9f9fd5994a'
            'ff0d112f9ed238badb818ade6652ba258ff81f47cfc690fe0038300a433da8cc'
            '477bb8bde4d6b882aeef041a306a4c9cc2728429d7a5a5a1c5e2594838ddc4b1'
            '4576e74dc1840af3406b95a00019f18e93434ae98eeb10f572f30a4d1753e9ca'
            '01c632f5b1b096914a79883d8d294e1d2cdd50330d622c533572a71b260e2c4e'
)

prepare() {
  cd "$_realname-$pkgver"
  touch git_version # disable make target
  echo 'const char * const gitversion = "'$pkgver'";' > git_version.h
  sed -i 's/-ggdb//' makefile
  sed -i 's/-static//' makefile
}

build() {
  cd "$_realname-$pkgver"
  make
}

package() {
  cd "$_realname-$pkgver"
  install -Dm755 speederv2 "$pkgdir/usr/bin/speederv2"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/udpspeeder/LICENSE.md"
  cd $srcdir
  install -Dm644 config.json "$pkgdir/etc/udpspeeder/config.json"
  install -Dm644 udpspeeder.py "$pkgdir/usr/lib/systemd/scripts/udpspeeder.py"
  install -Dm644 udpspeeder.service "$pkgdir/usr/lib/systemd/system/udpspeeder.service"
  install -Dm644 udpspeeder@.service "$pkgdir/usr/lib/systemd/system/udpspeeder@.service"
}
