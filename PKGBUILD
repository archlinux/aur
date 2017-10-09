# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=fibre-git
_pkgname=${pkgname%-git}
pkgver=2017.10.09.5650a2d
pkgrel=1
pkgdesc="A prototype for a lighter desktop client for Wire"
arch=('x86_64')
url="https://gitlab.com/ddobrev/Fibre"
license=('unspecified')
depends=('qt5-webview')
makedepends=('git' 'imagemagick')
source=('fibre::git+https://gitlab.com/ddobrev/Fibre'
        'fibre.desktop')
sha256sums=('SKIP'
            '88edb23f0b37b61dfe6a0e783d9720983e4ab68af9aba7aa054241a4ee5e0f74')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(date --iso-8601 | sed 's/-/./g').$(git describe --always)"
}

build() {
  cd "$srcdir/${_pkgname}/"
  qmake
}

package() {
  cd "$srcdir/${_pkgname}/"
  make INSTALL_ROOT="$pkgdir/" install
  
  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Fibre/bin/Fibre" "${pkgdir}/usr/bin/${_pkgname}"
  
  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}.desktop"
  for res in 32x32 48x48 64x64 128x128 256x256; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    convert -resize ${res} -background transparent Fibre.svg "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
    chmod 644 "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 Fibre.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
