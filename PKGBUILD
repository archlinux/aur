# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
epoch=1
pkgver=12.20
pkgrel=1
pkgdesc="HeidiSQL Shared files: wrapper script, locale/ini files, documentation (install a provider of your choice for heidisql-client to use it)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0-or-later')
optdepends=('heidisql-qt6: Qt6 variant'
            'heidisql-gtk2: GTK2 variant')
makedepends=(curl unzip)
install=heidisql.install

source=(
  "https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz"
  heidisql
)
sha256sums=('04e82a09aedb60647406c435cf355d9f1539ea1ee2f045b6b51d70fd4c038753'
            'cb084209a5ce3270a2888bf93c8a5adb6f714eda487ad13a50512ac538b3fc87')

prepare() {
  cd "${srcdir}/HeidiSQL-${pkgver}"

  # Fetch compiled translations from the daily Transifex snapshots served by heidisql.com
  local locale_zip="HeidiSQL-locale.zip"
  local locale_dir="${srcdir}/HeidiSQL-${pkgver}/extra/locale"
  mkdir -p "${locale_dir}"
  curl -fsSL "https://www.heidisql.com/downloads/locale/${locale_zip}" -o "/tmp/${locale_zip}" || exit 1
  unzip -o -j "/tmp/${locale_zip}" -d "${locale_dir}"
  rm -f "/tmp/${locale_zip}"
}

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  # Install shared locale files
  if [ -d "extra/locale" ]; then
    mkdir -p "${pkgdir}/usr/share/heidisql/locale"
    for mo_file in extra/locale/*.mo; do
      [ -f "$mo_file" ] && install -Dm644 "$mo_file" "${pkgdir}/usr/share/heidisql/locale/$(basename "$mo_file")"
    done
  fi
  
  # Install shared ini files
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm644 extra/ini/*.ini "${pkgdir}/usr/share/heidisql/"

  # Install icon
  install -Dm644 res/deb-package-icon.png "${pkgdir}/usr/share/pixmaps/heidisql.png"
  
  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/heidisql"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/heidisql/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/heidisql/"
  install -Dm644 package-skeleton/usr/share/doc/heidisql/copyright "${pkgdir}/usr/share/doc/heidisql/"

  # Install wrapper script that selects the appropriate variant
  install -Dm755 "${srcdir}/heidisql" "${pkgdir}/usr/bin/heidisql"
}
