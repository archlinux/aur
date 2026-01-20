# Maintainer: Gotar <gotar@users.noreply.github.com>
pkgname=wallpicker
pkgver=2.5.1
pkgrel=1
pkgdesc="Modern GTK4/Libadwaita wallpaper picker with Wallhaven integration, AI upscaling, and AI tagging"
arch=('any')
url="https://github.com/gotar/WallPicker"
license=('MIT')
depends=(
  'python>=3.11'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-requests'
  'python-pillow'
  'python-send2trash'
  'python-aiohttp'
  'python-rapidfuzz'
)
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
optdepends=('awww: Animated wallpaper transitions'
            'waifu2x-ncnn-vulkan: AI upscaling for local wallpapers'
            'python-pytorch: Required for AI image tagging (install clip-anytorch via pip)')
source=("${pkgname}::git+https://github.com/gotar/WallPicker.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install Python package
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop entry
  install -Dm644 wallpicker.desktop "${pkgdir}/usr/share/applications/wallpicker.desktop"

  # Install icon
  install -Dm644 data/wallpaper-icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wallpicker.svg"

  # Install CSS stylesheet
  install -Dm644 data/style.css "${pkgdir}/usr/share/wallpicker/style.css"

  # Install default config
  install -Dm644 data/config.json "${pkgdir}/usr/share/wallpicker/config.json"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
  # Copy default config if user doesn't have one
  if [ ! -f "$HOME/.config/wallpicker/config.json" ]; then
    mkdir -p "$HOME/.config/wallpicker"
    cp /usr/share/wallpicker/config.json "$HOME/.config/wallpicker/config.json"
    echo "==> Created default config at ~/.config/wallpicker/config.json"
  fi

  echo ""
  echo "==> WallPicker installed successfully!"
  echo ""
  echo "Optional features:"
  echo "  • AI Image Tagging:"
  echo "      pip install --user clip-anytorch"
  echo "      Edit ~/.config/wallpicker/config.json: \"tagger_enabled\": true"
  echo ""
  echo "  • AI Upscaling:"
  echo "      Install waifu2x-ncnn-vulkan"
  echo "      Edit ~/.config/wallpicker/config.json: \"upscaler_enabled\": true"
  echo ""
}

post_upgrade() {
  post_install
}
