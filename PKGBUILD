# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-easyofd
pkgname=(
  python-easyofd
  easyofd
)
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="Easy operate OFD"
arch=($CARCH)
license=('MIT')
url="https://github.com/renoyuan/${_name}"
makedepends=(
  # python-easyofd
  python
  python-reportlab
  python-xmltodict
  python-loguru
  python-fonttools
  python-pymupdf
  python-pyasn1
  python-pillow

  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  python-pyqt6
  imagemagick
  # AUR
  nuitka
)
# checkdepends=()
source=("${pkgbase}::git+${url}.git#tag=v${pkgver}")
sha512sums=('c56f26484a38dde007382ae0ce01fa0ca1ebc4cfb045a0ed574fc3e89c1b457930b6786190aa32cdd7dd07c3bdbed2d2ac9e655c3415afaa7fd3f1cbdf40d1aa')

prepare() {
  git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgbase}"
  python -m build --wheel --no-isolation

  cd "${srcdir}/${pkgbase}/gui"
  magick ico/reno.ico ico/reno.png
  nuitka \
    --standalone \
    --onefile \
    --lto=yes \
    --jobs=$(nproc) \
    --follow-imports \
    --enable-plugin=pyqt6 \
    --include-module=PIL \
    --include-package-data=PIL \
    --include-package-data=Pillow \
    --output-dir=dist \
    --output-filename=easyofd \
    --remove-output \
    --assume-yes-for-downloads \
    --show-progress \
    --show-memory \
    --show-modules \
    --plugin-enable=anti-bloat \
    --python-flag=no_site \
    --python-flag=no_warnings \
    --include-package-data=easyofd \
    --include-data-files=ico/*=ico/ \
    --linux-icon=ico/reno.png \
    main.py
}

# check() {
#   cd "${srcdir}/${pkgbase}"
# }

package_python-easyofd() {
  arch=(any)
  depends=(
    python
    python-reportlab
    python-xmltodict
    python-loguru
    python-fonttools
    python-pymupdf
    python-pyasn1
    python-pillow
  )
  optdepends=(
    "tesseract-data-chi_sim: OCR data (chi_sim)"
  )

  cd "${srcdir}/${pkgbase}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_easyofd() {
  pkgdesc+=" - GUI"
  arch=($CARCH)
  depends=(
    glibc
    hicolor-icon-theme
  )

  options=('!strip' '!debug' '!lto')
  cd "${srcdir}/${pkgbase}"
  install -vDm755 gui/dist/easyofd -t "$pkgdir"/usr/bin/
  install -vDm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname}
Comment=${pkgdesc}
GenericName=${pkgdesc}
Exec=${pkgname}
StartupNotify=false
Terminal=false
Type=Application
Categories=Utility;
Icon=${pkgname}.png
EOF
  install -vDm644 "gui/ico/reno.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
