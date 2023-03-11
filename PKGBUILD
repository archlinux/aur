# Maintainer: ByteDream
pkgname=vpuppr-bin
pkgdesc="VTuber application made with Godot 3.5"
arch=('x86_64')
url="https://github.com/virtual-puppet-project/vpuppr"
license=('MIT')

pkgver=0.9.0
pkgrel=3

replaces=(
  'openseeface-gd'
  'puppeteer'
)

depends=(
  'python'
  'python-pip'
)

source=("${pkgname}-${pkgver}.zip::https://github.com/virtual-puppet-project/vpuppr/releases/download/${pkgver}/vpuppr_${pkgver}_linux.zip")
sha256sums=('95c436e55a68e4abeb967acfa0ec9717dd6e0472ee72c346ded5aeb4a65ef587')

pre_install() {
  for v in "" "3" "3.10" "3.9" "3.8" "3.7"; do
    if "python$v" --version 2> /dev/null | grep -E -q "3.([7-9]|10)\."; then
      return
    fi
  done

  echo "No valid python version detected. Please install any python version from 3.7 - 3.10 to run VPupPr correctly." >&2
  exit 1
}

package() {
  mkdir -p $pkgdir/usr/{share/vpuppr,share/applications,bin}
  cp -rf ./flatpak/* $pkgdir/usr/share/vpuppr
  chmod 755 -R $pkgdir/usr/share/vpuppr/*
  ln -sf ../share/vpuppr/vpuppr.x86_64 $pkgdir/usr/bin/vpuppr

  curl -L https://github.com/virtual-puppet-project/vpuppr/raw/0.9.0/assets/osfgd_icon.png -o "$pkgdir/usr/share/vpuppr/vpuppr_icon.png"
  cat > "$pkgdir/usr/share/applications/vpuppr.desktop"<< EOF
[Desktop Entry]
Name=VPupPr
Exec=/usr/share/vpuppr/vpuppr.x86_64
Icon=/usr/share/vpuppr/vpuppr_icon.png
Type=Application
Categories=Graphics;AudioVideo;Recoder;
Terminal=False
EOF

  # the bundled opencv doesn't work in some cases. installing the newest version via pip and symlinking the opencv directory fixes this issues
  pip3 install opencv-python 2> /dev/null
  rm -r $pkgdir/usr/share/vpuppr/resources/extensions/openseeface-tracker/OpenSeeFace/cv2
  ln -s $(python3 -c 'import site; print(site.getsitepackages()[0])')/cv2 $pkgdir/usr/share/vpuppr/resources/extensions/openseeface-tracker/OpenSeeFace/cv2
}

