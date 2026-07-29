# Maintainer: rayman1972 <https://github.com/rayman1972>
# AUR package for kAppIcon — install system-wide under /usr

pkgname=kappicon
pkgver=3.2.1
pkgrel=1
pkgdesc='Change Linux app launcher icons without root (GUI + CLI)'
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
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Updated after the GitHub release tarball is published (see CONTRIBUTING.md).
sha256sums=('214da56d9a179d75faffee73ddf09553fe3147a9c34bc9d0e72d3e091366d0dd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Binaries (GUI thin launcher + CLI)
  install -Dm755 gui/kappicon "${pkgdir}/usr/bin/kappicon"
  install -Dm755 cli/kappicon-cli "${pkgdir}/usr/bin/kappicon-cli"

  # Shared Python package (mutation + GUI); launcher resolves /usr/lib/kappicon/python
  install -d "${pkgdir}/usr/lib/kappicon/python"
  cp -a python/kappicon "${pkgdir}/usr/lib/kappicon/python/kappicon"

  # Desktop launcher (GUI only)
  install -Dm644 gui/kappicon.desktop \
    "${pkgdir}/usr/share/applications/kappicon.desktop"

  # AppStream metainfo (GNOME Software, Pamac, Discover, …)
  install -Dm644 data/io.github.rayman1972.kappicon.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.rayman1972.kappicon.metainfo.xml"

  # App icon (hicolor + pixmaps fallback)
  install -Dm644 assets/kappicon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kappicon.png"
  install -Dm644 assets/kappicon.png \
    "${pkgdir}/usr/share/pixmaps/kappicon.png"

  # Docs & license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 VERSION "${pkgdir}/usr/share/doc/${pkgname}/VERSION"
}
