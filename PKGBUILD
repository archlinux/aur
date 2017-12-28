# Maintainer: mober <maxATmoberDOTat>
# Thanks to:
# * astyonax@github
#   https://github.com/astyonax/patched-RTS5227-5229
# * M0Rf30@github
#  https://gist.github.com/M0Rf30/216dac68d544d60f94df862b074781fa

_pkgbase=rts5227
pkgname=rts5227-dkms
pkgver=1.07
pkgrel=3
pkgdesc="Driver to support Realtek RTS5227/5229 SD Card Reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/Downloads/downloadsView.aspx?Langid=1&PNid=15&PFid=25&Level=4&Conn=3&DownTypeID=3&GetDown=false"
license=('')
depends=('dkms')
source=("http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/pc/crc/0001-Realtek_RTS5229_Linux_Driver_v${pkgver}.zip"
"git+https://github.com/astyonax/patched-RTS5227-5229.git"
'dkms.conf'
'blacklist-rts5227-dkms.conf'
'rts5227-dkms-suspend.sh'
'Makefile.patch'
"git+https://gist.github.com/216dac68d544d60f94df862b074781fa.git")
md5sums=('0ecf8bea0ea3842391c68da72fe4c425'
         'SKIP'
         '63ab60ad3295c0aed7219dbddfd50af3'
         '6640eecc5bcc3584397a7d1a33eb028f'
         '76d0dea4f19bd3f79b282d9ec2141400'
         '45871f654b6a237a0ae4646ec8e94769'
         'SKIP')

build(){
  cd "Realtek_RTS5229_Linux_Driver_v${pkgver}"
  tar xjf "rts5229.tar.bz2"
  cd "rts5229"
  patch -i "../../patched-RTS5227-5229/patch_linux_4.4.0.diff"
  patch -i "../../Makefile.patch"
  patch -i "../../216dac68d544d60f94df862b074781fa/rts5227 fix for Kernel > 4.14"
}

package(){
  sourceDir="${srcdir}/Realtek_RTS5229_Linux_Driver_v${pkgver}/rts5229"
  installDir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  # Copy dkms .conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Blacklist rtsx_pci
  install -Dm644 "blacklist-${pkgname}.conf" "${pkgdir}/etc/modprobe.d/blacklist-${pkgname}.conf"

  # Fix suspend
  install -Dm755 "${pkgname}-suspend.sh" "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-suspend.sh"

  # Copy sources (including Makefile)
  cd "${sourceDir}"
  for d in `find . -type d`
  do
    install -dm755  "${installDir}/$d"
  done
  for f in `find . -type f ! -name 'README.md' ! -name '.gitignore'`
  do
    install -m644 "${sourceDir}/$f" "${installDir}/$f"
  done
}
