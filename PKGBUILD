# Maintainer: Marcel Krüger <marcel@2krueger.de>
# Contributor: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A

_pkgbase=intel_nuc_led
_gitname=intel_nuc_led
pkgname=${_pkgbase}-dkms-git
pkgver=r41.9e2bf43
pkgrel=1
pkgdesc="Intel NUC8i[x]HVK LED Control for Linux (DKMS)"
arch=('any')
url="https://github.com/benjaminvialle/intel_nuc_led"
license=('GPL3')
depends=('python' 'bash')
makedepends=('dkms' 'git')
conflicts=("${_pkgbase}-dkms")
#install=${pkgname}.install
source=("${_gitname}::git+https://github.com/benjaminvialle/intel_nuc_led.git"
        'dkms.conf')
md5sums=('SKIP'
         '80494ee6de55e6ac0e4727fab41da5d2')
sha512sums=('SKIP'
            '6be950c11f463286b1c3e66782020212bdb58f7058fec92b47d5a2860d0855d7771c2d4e24ccb15a9985525ba3418f29e47a25219a304fdf8a442d08e5a4d563')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  :
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Install ledsetter script in /usr/bin
  install -Dm755  "${pkgdir}"/usr/src/"${_pkgbase}-${pkgver}"/contrib/usr/local/bin/ledsetter "${pkgdir}"/usr/bin/ledsetter

  # Copy module nuc_led configuration in /etc/modprobe.d
  install -Dm644  "${pkgdir}"/usr/src/"${_pkgbase}-${pkgver}"/contrib/etc/modprobe.d/nuc_led.conf "${pkgdir}"/etc/modprobe.d/nuc_led.conf
}
