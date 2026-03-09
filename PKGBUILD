# Maintainer: Tymon3310 <aur@tymon3310.dev>

_pkgname=vial-keychron
_Pkgname=Vial
pkgname=vial-keychron-git
pkgver=r701.99b73db
pkgrel=1
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA. Keychron branch."
arch=('x86_64' 'i686')
url="https://github.com/Tymon3310/vial-gui"
license=('GPL-2.0-only')
options=(!strip !debug)
depends=('python' 'python-pyqt5' 'python-pip' 'hidapi' 'hicolor-icon-theme')
makedepends=('git' 'python-setuptools' 'python-wheel')
provides=("vial" "vial-keychron")
conflicts=("vial" "vial-appimage" "vial-bin" "vial-keychron-bin")
source=('vial-gui::git+https://github.com/Tymon3310/vial-gui.git'
  '59-vial.rules')
sha256sums=('SKIP'
  'a6af0820ee6960dccab9ce0df0a898ccd0a50fecd992e341656dd1af78680502')

pkgver() {
  cd "$srcdir/vial-gui"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vial-gui"

  # Install dependencies into a temporary local directory to bundle with pyinstaller
  python -m venv venv
  source venv/bin/activate
  python -m pip install --upgrade pip

  # We install pyinstaller directly through pip in the venv,
  # because arch doesn't have it in standard repos
  pip install pyinstaller
  pip install -r requirements.txt

  # Build the executable using PyInstaller directly (no AppImage)
  pyinstaller --noconfirm --onedir --windowed --name "Vial" --add-data "src/main/resources:resources" --add-data "src/main/python/resources:resources" --add-data "src/main/python:." src/main/python/main.py

  deactivate
}

package() {
  cd "$srcdir/vial-gui"

  # Create directories
  install -dm755 "$pkgdir/opt/${_pkgname}"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/lib/udev/rules.d"

  # Copy built application
  cp -r dist/Vial/* "$pkgdir/opt/${_pkgname}/"

  # Fix permissions
  find "$pkgdir/opt/${_pkgname}" -type d -exec chmod 755 {} \;
  find "$pkgdir/opt/${_pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/${_pkgname}/Vial"

  # Desktop file
  install -Dm644 "misc/Vial.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  sed -i "s|Exec=Vial|Exec=/usr/bin/${_pkgname}|" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "src/main/icons/linux/1024.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  sed -i "s|Icon=Vial|Icon=${_pkgname}|" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Symlink executable
  ln -s "/opt/${_pkgname}/Vial" "$pkgdir/usr/bin/${_pkgname}"

  # Create udev rule
  install -Dm644 "$srcdir/59-vial.rules" "$pkgdir/usr/lib/udev/rules.d/59-vial.rules"
}
