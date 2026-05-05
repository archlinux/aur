# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms
pkgver=1.0.1
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://lkrg.org'
license=('GPL-2.0-only')
source=("${url}/download/${_pkgbase}-${pkgver}.tar.gz"
        "${url}/download/${_pkgbase}-${pkgver}.tar.gz.sign"
        'dkms.conf')
sha512sums=('2c694b0a4349142a4ab3a52133cbcbb71412b53dfefe1003506ede3c49111eafd4d70ea447bb24865954bd9884759c0e3a4429aa9db3e534c5b793f84ec3592c'
            'SKIP'
            '199a1656ed24d9de0a0a7b92deaf20d071fe122202d233f4b58b254d3bb5828267db3fc16ffe0fa5013da3bdb6fd9d1829eedaac1c67f4025cd1d24d3017cb3d')
validpgpkeys=('297AD21CF86C948081520C1805C027FD4BDC136E')
depends=('bash' 'dkms' 'make')
backup=('etc/sysctl.d/01-lkrg.conf')

prepare() {
  # Set version
  cp dkms.conf "${_pkgbase}-${pkgver}"
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${_pkgbase}-${pkgver}/dkms.conf"
}

package() {
  # Copy sources (including Makefile)
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  cp -r "${_pkgbase}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;

  # Copy OUR dkms.conf
  install -Dm644 "${_pkgbase}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Install the default configuration file
  install -Dpm 644 -o root -g root "${_pkgbase}-${pkgver}/scripts/bootup/lkrg.conf" "${pkgdir}/etc/sysctl.d/01-lkrg.conf"

  # Install the systemd service unit
  install -Dpm 644 -o root -g root "${_pkgbase}-${pkgver}/scripts/bootup/systemd/lkrg.service" "${pkgdir}/usr/lib/systemd/system/lkrg.service"
}
