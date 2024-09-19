# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dosage-tracker"
pkgname="${_pkgname}-bin"
pkgver=1.6.6
pkgrel=1
pkgdesc='Medication tracker for Linux'
arch=('any')
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-or-later')
makedepends=('squashfs-tools')
depends=('dconf' 'gjs' 'hicolor-icon-theme' 'libportal')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "COPYING-${pkgver}::${url}/raw/v${pkgver}/COPYING")
# https://askubuntu.com/a/1196449
source=("${_pkgsrc}.snap::https://api.snapcraft.io/api/v1/snaps/download/IMBLvaS6amNAHz2u7dqN8rGUlKegMSnm_655.snap") # x86_64
b2sums=('02bd9f8aeba8e654c4a147cca8b86ba919520264c829fe42b3130e6e3fce910b69dde9c7f831715911fd6f49dd75f1b3b00bae0f08a6a2593161a4141ff88c89')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}" "${_pkgsrc}.snap"

  cd "${srcdir}/${_pkgsrc}/usr/bin"
  sed -e 's|#!/snap/dosage-tracker/current/gnome-platform/usr/bin/gjs|#!/usr/bin/gjs|' \
      -e 's|prefix: "/snap/dosage-tracker/current/usr"|prefix: "/usr"|' \
      -e 's|libdir: "/snap/dosage-tracker/current/usr/lib/[^"]*"|libdir: "/usr/lib"|' \
      -e 's|datadir: "/snap/dosage-tracker/current/usr/share"|datadir: "/usr/share"|' \
      -i "io.github.diegopvlk.Dosage"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "COPYING-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  
  cd "${_pkgsrc}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;

  cd "${pkgdir}/usr/bin"
  ln -s "io.github.diegopvlk.Dosage" "${pkgdir}/usr/bin/${_pkgname}"
}
