# Maintainer: Autumn (Bee) <10378052+bee-san at users dot noreply dot github dot com>

pkgname=mangatan-bin
_pkgname=mangatan
pkgver=1.2.14
pkgrel=1
pkgdesc="Read manga and light novels, and watch anime"
arch=('x86_64')
url="https://github.com/1Selxo/Mangatan"
license=('GPL-3.0-only')

makedepends=('patchelf')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libepoxy'
  'libgcc'
  'libsecret'
  'libstdc++'
  'libsoup3'
  'mpv'
  'pango'
  'webkit2gtk-4.1'
  'xdg-user-dirs'
  'xdg-utils'
  'zlib-ng-compat'
)

optdepends=(
  'mangatan-extension-server: Mihon extension support via the Mihon bridge'
)

provides=('mangatan' 'mangayomi')
conflicts=(
  'mangatan'
  'mangatan-git'
  'mangayomi'
  'mangayomi-bin'
  'mangayomi-git'
)
options=('!strip')

source=(
  "mangatan.desktop::https://raw.githubusercontent.com/1Selxo/Mangatan/v${pkgver}/linux/mangayomi.desktop"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/1Selxo/Mangatan/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${pkgname}-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/v${pkgver}/Mangatan-v${pkgver}-linux-${CARCH}.tar.gz"
)

sha256sums=(
  'd00453f6aa1f75357a31d0a696861be6f7e82bd824920faa98bf48b2a4769c25'
  'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052'
)
sha256sums_x86_64=(
  'bf4c255fecfa2499a5f7211e3d59bc25fc4abbd7f649a834cdb2600dce4c2eaa'
)

package() {
  local bundle="${srcdir}/Mangatan-v${pkgver}-linux-${CARCH}"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${bundle}/." "${pkgdir}/usr/lib/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/mangayomi" "${pkgdir}/usr/bin/mangatan"
  ln -s "/usr/lib/${_pkgname}/mangayomi" "${pkgdir}/usr/bin/mangayomi"

  find "${pkgdir}/usr/lib/${_pkgname}/lib" \
    -maxdepth 1 -type f -name '*.so' \
    -exec patchelf --set-rpath '$ORIGIN' {} +

  install -Dm644 \
    "${bundle}/data/flutter_assets/assets/app_icons/icon.png" \
    "${pkgdir}/usr/share/pixmaps/mangayomi.png"

  install -Dm644 "${srcdir}/mangatan.desktop" \
    "${pkgdir}/usr/share/applications/mangayomi.desktop"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
