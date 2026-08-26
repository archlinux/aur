# Maintainer: Alexandru Iercosan-Lucaci <lucaci32u4@gmail.com>
pkgname=kicad-component-importer-git
_pkgname=kicad-component-importer
pkgver=0.1.6.r2.ga3e40b5
pkgrel=1
pkgdesc="Desktop app and CLI for importing downloaded component ZIP libraries into KiCad projects"
arch=('any')
url="https://github.com/robertxdx/component-importer-for-kicad"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('fzf: fuzzy ZIP picker for the CLI'
            'kicad: EDA suite the imported libraries are used with')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/robertxdx/component-importer-for-kicad.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --abbrev=7 --tags 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/CLI.md "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
  if [ -f docs/man/kicad-importer.1 ]; then
    install -Dm644 docs/man/kicad-importer.1 \
      "${pkgdir}/usr/share/man/man1/kicad-importer.1"
  fi

  install -Dm644 src/component_importer/gui_assets/app_icon.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=KiCad Component Importer
Comment=Import component ZIP files into KiCad symbol and footprint libraries
Exec=component-importer-for-kicad
Icon=kicad-component-importer
Categories=Development;Electronics;
Terminal=false
StartupNotify=true
DESKTOP
}
