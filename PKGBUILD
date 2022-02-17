# Maintainer: ByteDream
pkgname=openseeface-gd
pkgdesc="Renderer for OpenSeeFace data made with Godot 3.4"
arch=('x86_64')
url="https://github.com/you-win/openseeface-gd"
license=('MIT')

pkgver=0.8.1
pkgrel=3

depends=(
  'python3'
  'python-pip'
  'python-virtualenv'
)

optdepends=(
  'python39: Compatible python version for face tracking'
)

source=("${pkgname}-${pkgver}.zip::https://github.com/you-win/openseeface-gd/releases/download/${pkgver}/openseeface-gd_${pkgver}_linux.zip")
sha256sums=('d98668164a0c12aa534500200250ba5f9adebe1d1674e2be896dcda6c9c28970')

package() {
  mkdir -p $pkgdir/usr/{share/openseeface-gd,share/applications,bin}
  cp -rf $(ls . | grep -v "${pkgname}-${pkgver}.zip") $pkgdir/usr/share/openseeface-gd
  chmod 755 -R $pkgdir/usr/share/openseeface-gd/*
  ln -sf ../share/openseeface-gd/OpenSeeFaceGD.x86_64 $pkgdir/usr/bin/openseeface-gd

  curl -L https://github.com/you-win/openseeface-gd/raw/0.8.1/assets/osfgd_icon.png -o "$pkgdir/usr/share/openseeface-gd/osfgd_icon.png"
  cat > "$pkgdir/usr/share/applications/openseeface-gd.desktop"<< EOF
[Desktop Entry]
Name=OpenSeeFaceGD
Exec=/usr/share/openseeface-gd/OpenSeeFaceGD.x86_64
Icon=/usr/share/openseeface-gd/osfgd_icon.png
Type=Application
Categories=Graphics;AudioVideo;Recoder;
Terminal=False
EOF

  for v in "" "3" "3.9" "3.8" "3.7" "3.6"; do
    if "python$v" --version 2> /dev/null | grep -E -q "3.[6-9]\."; then
      return
    fi
  done

  echo "No valid python version detected. Please install any python version from 3.6 - 3.9 to run OpenSeeFaceGD correctly." >> /dev/stderr
}

