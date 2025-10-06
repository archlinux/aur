# Maintainer: April Kallmeyer <ask@ask.systems>
pkgname=ec-su_axb35-dkms-git
_pkgname=${pkgname%-dkms-git}
pkgdesc='Linux driver for the embedded controller on the Sixunited AXB35-02 board.'
pkgver=r27.8325346
pkgrel=1
url='https://github.com/cmetz/ec-su_axb35-linux'
arch=('x86_64')
license=('GPL-2.0')
install='ec-su_axb35-dkms-git.install'
source=(
  "${_pkgname}::git+https://github.com/cmetz/ec-su_axb35-linux.git"
  'dkms.conf'
  'ec-su_axb35.conf'
)
sha256sums=('SKIP'
            'db6909e523b2129ff4b62cf568cf58f9699677a69f3d960f99e2257ea23e6809'
            '9f150b355e218e1f59af8a72b5052bfaa94ad405d1d95d43f9e16952c0f83455')
depends=('dkms' 'bc')
makedepends=('git' 'gcc' 'make')
optdepends=('netdata: for a monitoring dashboard')

# https://wiki.archlinux.org/title/VCS_package_guidelines#Git
# 0.9.9.r27.g2b039da  # if tags exist
# r1581.2b039da       # else fallback
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  repo="${srcdir}/${_pkgname}"

  # Replace the version placeholder in dkms.conf with the real version
  sed -i "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf"

  # Rename the hwmon C file to use only underscores.
  mv "${repo}/hwmon/ec-su_axb35-hwmon.c" \
     "${repo}/hwmon/ec_su_axb35_hwmon.c"

  # Add the new module to the build list in the Kbuild file.
  sed -i '/^obj-m/ s/$/ hwmon\/ec_su_axb35_hwmon.o/' \
    "${repo}/Kbuild"
}

package() {
  repo="${srcdir}/${_pkgname}"

  # Install the module source files for DKMS
  install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r "${repo}/." "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"

  # Install the dkms.conf file into the source tree
  install -Dm644 "${srcdir}/dkms.conf" \
    "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  # Install the scripts
  install -Dm755 "${repo}/scripts/su_axb35_monitor" \
    "${pkgdir}/usr/local/bin/su_axb35_monitor"
  install -Dm755 "${repo}/scripts/info.sh" \
    "${pkgdir}/usr/local/bin/su_axb35_info"

  # Install the modules-load.d config file
  install -Dm644 "${srcdir}/ec-su_axb35.conf" \
    "${pkgdir}/usr/lib/modules-load.d/${_pkgname}.conf"

  # Install the optional netdata config file
  install -Dm644 "${repo}/contrib/netdata/axb35.chart.sh" \
    "${pkgdir}/usr/share/${_pkgname}/axb35.chart.sh"
}
