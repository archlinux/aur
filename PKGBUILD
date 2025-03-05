# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher
pkgver=7.10.0.0
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
  'python-wxpython'
  'xdg-utils'
)
makedepends=('git')
optdepends=(
  'android-tools: Use system platform tools'
  'scrcpy: Launch Screen Copy'
)
options=('!strip')
source=("PixelFlasher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'git+https://android.googlesource.com/platform/system/update_engine.git'
        'PixelFlasher.desktop')
sha256sums=('6e289a83d1c96ddb080f47c0c5479cda8371c1f7c170cf0163e617b3662c9910'
            'SKIP'
            'dff526833836b7123c99d2321f06975c34fe0abd21a02ef9dde4da3328a21129')

prepare() {

  # Regegerate protos
  protoc --proto_path=update_engine --python_out=. update_metadata.proto
  cp -vf update_metadata_pb2.py "PixelFlasher-$pkgver/update_metadata_pb2.py"
}

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
  install -d "$pkgdir/usr/bin"
  ln -s  "/opt/$pkgname/PixelFlasher.py" "$pkgdir/usr/bin/PixelFlasher"

  for i in 64 128 256; do
    install -Dm644 "images/icon-${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/PixelFlasher.png"
  done

  install -Dm644 "$srcdir/PixelFlasher.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
