# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dosage-tracker"
pkgname="${_pkgname}-bin"
pkgver=1.6.6
pkgrel=2
pkgdesc='Medication tracker for Linux'
arch=('any')
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-only')
makedepends=('squashfs-tools')
depends=('dconf' 'gjs' 'hicolor-icon-theme' 'libportal')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
# https://askubuntu.com/a/1196449
source=("${_pkgsrc}.snap::https://api.snapcraft.io/api/v1/snaps/download/IMBLvaS6amNAHz2u7dqN8rGUlKegMSnm_655.snap" # x86_64
        "README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "COPYING-${pkgver}::${url}/raw/v${pkgver}/COPYING")
b2sums=('02bd9f8aeba8e654c4a147cca8b86ba919520264c829fe42b3130e6e3fce910b69dde9c7f831715911fd6f49dd75f1b3b00bae0f08a6a2593161a4141ff88c89'
        'fde3a864795e6e2b593a0e520fee3725d7c341b31dc4769329d5a8a2419cf34bc555d499fac1f064c403d92d2571cc3b8653f1946e54a43caecc0d4361795d73'
        '29481d2748ce7343f521b95ecb147d3b141c53cc15995f993d153323af7b206c6096f8642f8cb1e63210a6af5c1be1f1c9022058fb627883272f4c7dac87e187')

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
