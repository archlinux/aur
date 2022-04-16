# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Maintainer: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-freon
pkgver=48
pkgrel=1
pkgdesc="Displays: CPU temperature, HDD/SSD temperature, video card temperature (nVidia/Catalyst), voltage and fan RPM in a GNOME Shell top bar pop-down."
arch=('any')
url="https://github.com/UshakovVasilii/gnome-shell-extension-freon"
license=('GPL')
depends=('dconf' 'gnome-shell' 'lm_sensors')
optdepends=(
  'udisks2: optional backend for storage temperature sensors.'
  'hddtemp: optional backend for S.M.A.R.T. temperature sensors.'
  'nvidia-settings: optional backend for nVidia temperature sensors.'
)
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/EGO-${pkgver}.tar.gz")
sha512sums=('56dc63e0252ac10d548bd4345bc14e076e324ee973e19a5ec5adf9ea851beaa26a7e46ab79eae5b78bf5ba7d9628a6e43779b1396732fa8f38c22a2a03bc3341')

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cp -r --no-preserve=ownership,mode icons "${_destdir}"
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
