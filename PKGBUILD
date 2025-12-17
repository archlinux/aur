# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher
pkgver=8.13.0.0
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
  'python-polib'
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
  'libnotify: Display system toast notifications'
  'scrcpy: Launch Screen Copy'
)
options=('!strip')
source=("PixelFlasher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'git+https://android.googlesource.com/platform/system/update_engine.git'
        'PixelFlasher.desktop')
sha256sums=('6e5ea797cb7876cca8f9045746677431527faf35ee8a5ac54f7c1e1e22adf7ae'
            'SKIP'
            'dbb31a1b359bdda2d6501ccf5d80fb888508619da948c3f98d4b0cb74f907615')

prepare() {

  # Regenerate protos
  protoc --proto_path=update_engine --python_out=. update_metadata.proto
  cp -vf update_metadata_pb2.py "PixelFlasher-$pkgver/update_metadata_pb2.py"
}

build() {
  cd "PixelFlasher-$pkgver"
  python compile_po.py
}

package() {
  cd "PixelFlasher-$pkgver"
  install -Dm755 bin/* -t "$pkgdir/opt/$pkgname/bin/"
  rm "$pkgdir/opt/$pkgname/bin"/7z{.dll,.exe}

  for f in *.py *.json *.pem *.crt; do
    install -m644 "${f}" -t "$pkgdir/opt/$pkgname/"
  done

  install -Dm644 images/*.png -t "$pkgdir/opt/$pkgname/images/"
  install -Dm644 images/pif/*.png -t "$pkgdir/opt/$pkgname/images/pif/"

  chmod +x "$pkgdir/opt/$pkgname/PixelFlasher.py"
  install -d "$pkgdir/usr/bin"
  ln -s  "/opt/$pkgname/PixelFlasher.py" "$pkgdir/usr/bin/PixelFlasher"

  for i in 64 128 256; do
    install -Dm644 "images/icon-dark-${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  pushd locale
  for lang in $(ls -d */); do
    install -Dm644 "${lang%%/}/LC_MESSAGES/$pkgname.mo" -t \
      "$pkgdir/opt/$pkgname/locale/${lang%%/}/LC_MESSAGES/"
  done
  popd

  install -Dm644 "$srcdir/PixelFlasher.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
