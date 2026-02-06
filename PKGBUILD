# Maintainer: feriixu <aur.maintainer.mail.9lofw@passmail.net>

pkgbase=polarity-md
pkgname=('polarity-md' 'polarity-md-vst3' 'polarity-md-clap')
pkgver=0.beta8
pkgrel=1
arch=('x86_64')
url="https://polarity.productions/polarity-md/"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'libsoup3')

source=("${pkgbase}-${pkgver}.zip::https://polarity.productions/polarity-md/downloads/PolarityMD-linux-beta8.zip")
sha256sums=('0de1a95c9ac29a96466f889724c086ea9ee634980414f2f261c7ccedec0fbfa0')

prepare() {
  cd "${srcdir}"
  bsdtar -xf "${pkgbase}-${pkgver}.zip"
}

_pkg_install_license() {
  local lic
  lic="$(find "${srcdir}" -maxdepth 6 -type f \( -iname 'license*' -o -iname 'copying*' \) -print -quit)"
  if [[ -n "${lic}" ]]; then
    install -D -m644 "${lic}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Polarity-MD is distributed by upstream. See terms on the project page:
https://polarity.productions/polarity-md/
EOF
  fi
}


package_polarity-md-vst3() {
  pkgdesc="Polarity-MD Four-band dynamics with upward + downward compression, per-band clipping. OTT style. (VST3) - prebuilt binary"
  provides=('polarity-md-vst3')
  conflicts=('polarity-md-vst3')

  install -d "${pkgdir}/usr/lib/vst3"
  cp -a "${srcdir}/VST3/Polarity-MD.vst3" "${pkgdir}/usr/lib/vst3/"

  _pkg_install_license
}

package_polarity-md-clap() {
  pkgdesc="Polarity-MD Four-band dynamics with upward + downward compression, per-band clipping. OTT style. (CLAP) - prebuilt binary"
  provides=('polarity-md-clap')
  conflicts=('polarity-md-clap')

  install -d "${pkgdir}/usr/lib/clap"
  install -m755 "${srcdir}/CLAP/Polarity-MD.clap" "${pkgdir}/usr/lib/clap/Polarity-MD.clap"

  _pkg_install_license
}

package_polarity-md() {
  pkgdesc="Polarity-MD meta package (installs VST3 + CLAP) Four-band dynamics with upward + downward compression, per-band clipping. OTT style."
  depends+=('polarity-md-vst3' 'polarity-md-clap')
  provides=('polarity-md')
  conflicts=('polarity-md')

  _pkg_install_license
}
