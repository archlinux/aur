# Maintainer: robserob <robin at robserob.dk>
pkgname=vpinfe
pkgver=2.6.1
pkgrel=1
epoch=33
pkgdesc="A vpinball frontend for Linux, Mac, and Windows"
arch=('any')
url="https://github.com/superhac/vpinfe"
depends=('python-pip' 'chromium')
provides=('vpinfe')
conflicts=('vpinfe')
source=("${pkgname}-${pkgver}.zip::https://github.com/superhac/vpinfe/archive/refs/tags/v${pkgver}.zip" 
        'vpinfe.desktop' 
        'vpinfe.png')
sha256sums=('075bf3b1ba2aa654ec8f850fb2eaf6a6d2599a103c13184423315702928d6b95'
            'd0c22bc258c3fbee04a31378454246f25a3360cf48e870fcb374559de6b4a072'
            '7e7e1b0854ffcf745d9cf5a643cb005bb3c1c21f58ef50dc9c889eef5e9b92bd')

package() {
  # Create virtual environment and install dependencies
  mkdir -p "$pkgdir/opt/$pkgname/venv"
  python -m venv "$pkgdir/opt/$pkgname/venv"
  source "$pkgdir/opt/$pkgname/venv/bin/activate"
  cd "$srcdir/$pkgname-$pkgver"
  pip install -r requirements.txt
  deactivate

  # Install source files
  cd "$srcdir"
  install -d "$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  cp -r "$pkgname-$pkgver"/* "$pkgdir/opt/$pkgname/"
  sed -i "s/dev-local/v$pkgver/" "$pkgdir/opt/$pkgname/common/app_version.py"

  # Install launch script to /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/$pkgname"
  echo "cd ~" >> "$pkgdir/usr/bin/$pkgname"
  echo "/opt/$pkgname/venv/bin/python /opt/$pkgname/main.py \$@" >> "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # Install application entry
  install -Dm 644 "${srcdir}/vpinfe.png"  "${pkgdir}/usr/share/icons/hicolor/512.6.1/apps/vpinfe.png"
  install -Dm644 "$srcdir/vpinfe.desktop" "$pkgdir/usr/share/applications/vpinfe.desktop"
}

clean() {
  cd "$srcdir"
  rm -rf "$_reponame"
}

