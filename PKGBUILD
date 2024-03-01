# Maintainer: Remi Gacogne <rgacogne(at)archlinux(dot)org>
_pkgbase=lkrg
pkgname=lkrg-dkms
pkgver=0.9.8
pkgrel=1
pkgdesc='Linux Kernel Runtime Guard (DKMS)'
arch=('any')
url='https://lkrg.org/'
license=('GPL2')
source=("${url}/download/${_pkgbase}-${pkgver}.tar.gz"
        "${url}/download/${_pkgbase}-${pkgver}.tar.gz.sign"
        'dkms.conf')
sha512sums=('86d08f0c0168244ea48fb510e20356f24d8134c96b53b454dc22e7a67fe513b6b57ef946a28288f917f4deca59bcc073401ee2e71d46dad4e634a12c60fe5371'
            'SKIP'
            '8101dd415ed08edd455989a9b10a3c925b171d3375a6d6872f55805d9aeb355a4ac216cce11afc1b84eeb49de0771932005d74130ffd6f5cdea9fa53fb4f9506')
validpgpkeys=('297AD21CF86C948081520C1805C027FD4BDC136E')
depends=('dkms')
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
  install -Dm644 "${_pkgbase}-${pkgver}/scripts/bootup/lkrg.conf" "${pkgdir}/etc/sysctl.d/01-lkrg.conf"

  # Install the systemd service file
  install -Dm 644 "${_pkgbase}-${pkgver}/scripts/bootup/systemd/lkrg.service" "${pkgdir}/usr/lib/systemd/system/lkrg.service"
}
