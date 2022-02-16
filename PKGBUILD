# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nhiicc
epoch=1
pkgver=20220110
pkgrel=1
arch=(x86_64)
url='https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm'
license=(custom)
pkgdesc='台灣健保卡網路註冊憑證元件 (National Health Insurance IC Card)'
# sed and openssl is for commands used in nhiicc.install
depends=(pcsclite sed openssl)
optdepends=(
  'lib32-pcsclite: for using card readers with 32-bit driver only'
)
source=("https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mLNHIICC_Setup.$pkgver.tar.gz"
        nhiicc.service
        regen-certs.sh)
# See https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm for MD5 sums
md5sums=('156de24023a454f9bf779e874d83eb77'
         '82b85491957f25f22b43beffca53b9ab'
         'ba0495f8d54384ac95a93f221366049f')
install=nhiicc.install

package() {
  # XXX: upstream binary appears to hard-code /usr/local/share/NHIICC :/
  install -Ddm755 "$pkgdir"/usr/{bin,share/NHIICC}
  install -Dm755 mLNHIICC_Setup/x64/mLNHIICC -t "$pkgdir"/usr/bin
  cp -dr --no-preserve=ownership mLNHIICC_Setup/html "$pkgdir"/usr/share/NHIICC/
  install -Dm755 regen-certs.sh -t "$pkgdir"/usr/share/NHIICC/
  find "$pkgdir" \( -name '*~' -or -name '._*' \) -delete

  install -Ddm755 "$pkgdir"/usr/lib/systemd/system
  install -Dm644 nhiicc.service -t "$pkgdir"/usr/lib/systemd/system/
}
