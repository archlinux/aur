# Contributor: Martin Jesper Low Madsen <martin@martinjlowm.dk>

pkgname=floodlight
pkgver=1.2
pkgrel=1
pkgdesc="Floodlight SDN OpenFlow Controller"
url="http://www.projectfloodlight.org"
license=('custom')
depends=('java-runtime')
#optdepends=('xorg-xhost')
install="$pkgname.install"
makedepends=('git' 'apache-ant')
arch=('i686' 'x86_64')
source=("https://github.com/floodlight/floodlight/archive/v$pkgver.tar.gz"
        "floodlight.service")
sha256sums=('bf8a6209645fb50a1acd906ea9bf53b9f63bcd1d21f5213e15361273e28c9e45'
            '30e0ff27a231f32f2c61655662961a310495de02e43cb88fbb39d35e436a791f')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  # Compile source
  ant
}

package () {
  mkdir -p "$pkgdir/opt/"

  # Install systemd service file
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp "floodlight.service" "$pkgdir/usr/lib/systemd/system/"

  cd "$srcdir/$pkgname-$pkgver"

  # Copy built files
  cp -r "target" "$pkgdir/opt/floodlight"

  # Remove test files and directories
  for _file in "bin-test" "floodlight-test.jar" "test"
  do
    rm -r "$pkgdir/opt/floodlight/$_file"
  done

  # Copy resources
  mkdir -p "$pkgdir/opt/floodlight/src/main"
  for _res in "images" "python" "resources" "thrift"
  do
    cp -r "src/main/$_res" "$pkgdir/opt/floodlight/src/main/"
  done
}
