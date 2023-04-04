# Maintainer: robertfoster
# Contributor: mober <maxATmoberDOTat>
# Contributor: muhviehstarr
# Thanks to:
# * astyonax@github
#   https://github.com/astyonax/patched-RTS5227-5229

_pkgbase=rts5227
pkgname=${_pkgbase}-dkms
pkgver=1.08
pkgrel=1
pkgdesc="Driver to support Realtek RTS5227/5229 SD Card Reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/Downloads/downloadsView.aspx?Langid=1&PNid=15&PFid=25&Level=4&Conn=3&DownTypeID=3&GetDown=false"
license=('GPL2')
depends=('dkms')
source=("git+https://github.com/strahl/rts5227-dkms"
  'rts5227-dkms-suspend.sh'
)

package() {
  cd "${srcdir}"

  # Blacklist rtsx_pci
  install -Dm644 "${pkgname}/blacklist-rts5227.conf" \
    -t "${pkgdir}/etc/modprobe.d/"

  # Fix suspend
  install -Dm755 "${pkgname}-suspend.sh" \
    "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-suspend.sh"

  # Copy sources (including Makefile)
  mkdir -p "${pkgdir}/usr/src/"

  cp -r "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  # Cleanup
  rm -rf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/.git"*
}

sha256sums=('SKIP'
            '40b59b1bf1656f755f2faa2a913d53f1e4ba996680e2a4d3067b01a0e973276f')
