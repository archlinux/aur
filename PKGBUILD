# Maintainer: rayman1972 <https://github.com/rayman1972>
# Bleeding-edge AUR package — builds from latest git main

pkgname=kappicon-git
pkgver=3.2.0.r2.g56b8912
pkgrel=1
pkgdesc='Change Linux app launcher icons without root (GUI + CLI) — git version'
arch=('any')
url='https://github.com/rayman1972/kappicon'
license=('MIT')
depends=(
  'python'
  'python-pyqt6'
  'imagemagick'
  'libicns'
  'fzf'
)
optdepends=(
  'kdialog: optional KDE desktop notifications'
)
makedepends=('git')
provides=('kappicon')
conflicts=('kappicon')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/kappicon"
  # e.g. 3.0.0.r1.gdf79b7f or 3.0.0 if exactly on tag
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/kappicon"

  install -Dm755 gui/kappicon "${pkgdir}/usr/bin/kappicon"
  install -Dm755 cli/kappicon-cli "${pkgdir}/usr/bin/kappicon-cli"

  install -d "${pkgdir}/usr/lib/kappicon/python"
  cp -a python/kappicon "${pkgdir}/usr/lib/kappicon/python/kappicon"

  install -Dm644 gui/kappicon.desktop \
    "${pkgdir}/usr/share/applications/kappicon.desktop"

  install -Dm644 data/io.github.rayman1972.kappicon.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.rayman1972.kappicon.metainfo.xml"

  install -Dm644 assets/kappicon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kappicon.png"
  install -Dm644 assets/kappicon.png \
    "${pkgdir}/usr/share/pixmaps/kappicon.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 VERSION "${pkgdir}/usr/share/doc/${pkgname}/VERSION"
}
