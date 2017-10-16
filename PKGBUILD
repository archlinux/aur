# Maintainer: sum01 <sum01@protonmail.com>
pkgname=vcash-electron
pkgver=0.33.1
pkgrel=4
pkgdesc="Multi-platform and multi-node GUI for Vcash."
arch=('i686' 'x86_64')
url="https://github.com/openvcash/vcash-electron"
license=('GPL3')
depends=('libxss' 'gconf' 'nss' 'alsa-lib' 'gtk2' 'libxtst')
makedepends=('npm' 'sed')
optdepends=('vcash: the vcash daemon')
source=("https://github.com/openvcash/vcash-electron/archive/v$pkgver.tar.gz"
"vcash-electron.desktop")
sha512sums=('52fb396ac0fc22b6c6ed3c3334b04c927a012df2bf6e9b40f30beaba44359a45081e036816d6c17afe34d6f1749cf81244ef7a766ed033e4220da72e626ad894'
            '339a50892e4c4af228e58471d185a9ff014a23efc3a1f45ac4b6880b25d9f1937bd9aa406979d7f21396856637e79d70c46320220786d43ae84dfdf3e6292c1b')
prepare(){
  sed -i '/"deb",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i 's/"zip"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
  if [[ $CARCH = "i686" ]]; then
    sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
  fi
}
build(){
  cd "$srcdir/$pkgname-$pkgver"
  npm install --cache "$srcdir/npm-cache"
  npm prune
  npm run dist-linux
}
package(){
  for _size in 16 32 48 96 128 256; do
    install -Dm644 "$srcdir/$pkgname-$pkgver/build/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/vcash.png"
  done
  install -Dm644 vcash-electron.desktop "$pkgdir/usr/share/applications/vcash-electron.desktop"
  if [[ $CARCH = "i686" ]]; then
    _dist="linux-ia32-unpacked"
    _sys="ia32"
  else
    _dist="linux-unpacked"
    _sys="x64"
  fi
  mkdir -p "$pkgdir"/usr/{lib,bin}
  mv "$srcdir/$pkgname-$pkgver/dist/$_dist" "$pkgdir/usr/lib/$pkgname"
  ln -s /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  if [[ -e /usr/bin/vcashd ]]; then
    ln -s /usr/bin/vcashd "$pkgdir/usr/lib/$pkgname/resources/app.asar.unpacked/bin/vcashd-$_sys"
  fi
}
