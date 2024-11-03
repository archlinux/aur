# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher
pkgver=7.6.0.0
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('any')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'python-beautifulsoup4'
  'python-bsdiff4'
  'python-chardet'
  'python-cryptography'
  'python-darkdetect'
  'python-json5'
  'python-lz4'
  'python-markdown'
  'python-packaging'
  'python-platformdirs'
  'python-protobuf'
  'python-psutil'
  'python-pyperclip'
  'python-requests'
  'python-rsa'
  'python-six'
  'python-wxpython'
  'xdg-utils'
)
optdepends=(
  'android-tools: Use system platform tools'
  'scrcpy: Launch Screen Copy'
)
options=('!strip')
source=("PixelFlasher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'PixelFlasher.desktop'
        'PixelFlasher.sh')
sha256sums=('001b2b53702e75e36d5c9011e7a75cd5552f1b22ad7758d3b549c8ac1c3592b8'
            '3f503e3e3b819562669e1d0a8a25043c478c8c1709b376642fd678caf3d8ee34'
            '345d09c6aa123e6d30d8156b042f4372764cbd92932ffcf978fe77a512c4502d')

package() {
  cd "PixelFlasher-$pkgver"
  install -Dm755 bin/* -t "$pkgdir/opt/$pkgname/bin/"
  rm "$pkgdir/opt/$pkgname/bin"/7z{.dll,.exe}

  for f in *.py *.json *.pem; do
    install -m644 "${f}" -t "$pkgdir/opt/$pkgname/"
  done

  install -Dm644 images/*.png -t "$pkgdir/opt/$pkgname/images/"
  install -Dm644 images/pif/*.png -t "$pkgdir/opt/$pkgname/images/pif/"

  chmod +x "$pkgdir/opt/$pkgname/PixelFlasher.py"
#  install -d "$pkgdir/usr/bin"
#  ln -s  "/opt/$pkgname/PixelFlasher.py" "$pkgdir/usr/bin/PixelFlasher"

  install -Dm755 "$srcdir/PixelFlasher.sh" "$pkgdir/usr/bin/PixelFlasher"

  for i in 64 128 256; do
    install -Dm644 "images/icon-${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/PixelFlasher.png"
  done

  install -Dm644 "$srcdir/PixelFlasher.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
