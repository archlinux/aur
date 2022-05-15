# Maintainer: ByteDream
pkgname=puppeteer
pkgdesc="VTuber application made with Godot 3.4 (former OpenSeeFace-GD)"
arch=('x86_64')
url="https://github.com/virtual-puppet-project/puppeteer"
license=('MIT')

pkgver=0.8.1
pkgrel=4

replaces=(
  'openseeface-gd'
)

depends=(
  'python3'
  'python-pip'
  'python-virtualenv'
)
optdepends=(
  'python39: Compatible python version for face tracking'
)

source=("${pkgname}-${pkgver}.zip::https://github.com/virtual-puppet-project/puppeteer/releases/download/${pkgver}/openseeface-gd_${pkgver}_linux.zip")
sha256sums=('31932f233a496054a3305033406e6f3fa2b14dc54e0d2fda3895349980714735')

package() {
  mkdir -p $pkgdir/usr/{share/puppeteer,share/applications,bin}
  cp -rf $(ls . | grep -v "${pkgname}-${pkgver}.zip") $pkgdir/usr/share/puppeteer
  chmod 755 -R $pkgdir/usr/share/puppeteer/*
  ln -sf ../share/puppeteer/OpenSeeFaceGD.x86_64 $pkgdir/usr/bin/puppeteer

  curl -L https://github.com/virtual-puppet-project/puppeteer/raw/0.8.1/assets/osfgd_icon.png -o "$pkgdir/usr/share/puppeteer/osfgd_icon.png"
  cat > "$pkgdir/usr/share/applications/pupeteer.desktop"<< EOF
[Desktop Entry]
Name=Puppeteer
Exec=/usr/share/puppeteer/OpenSeeFaceGD.x86_64
Icon=/usr/share/puppeteer/osfgd_icon.png
Type=Application
Categories=Graphics;AudioVideo;Recoder;
Terminal=False
EOF

  for v in "" "3" "3.9" "3.8" "3.7" "3.6"; do
    if "python$v" --version 2> /dev/null | grep -E -q "3.[6-9]\."; then
      return
    fi
  done

  echo "No valid python version detected. Please install any python version from 3.6 - 3.9 to run Puppeteer correctly." >&2
}

