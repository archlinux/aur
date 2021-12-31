# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nhiicc
epoch=1
pkgver=20210824.02
pkgrel=1
arch=(x86_64)
url='https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm'
license=(custom)
pkgdesc='台灣健保卡網路註冊憑證元件 (National Health Insurance IC Card)'
# sed is for commands in nhiicc.install
depends=(pcsclite sed)
optdepends=(
  'lib32-pcsclite: for using card readers with 32-bit driver only'
)
source=("https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mLNHIICC_Setup.$pkgver.U64.gz"
        nhiicc.service)
# See https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm for MD5 sums
md5sums=('05b34bb5df19c0b8270ab37416225d78'
         '616a69724e3bc4dab688ca4bc5298c41')
install=nhiicc.install

package() {
  # XXX: upstream binary appears to hard-code /usr/local/share/NHIICC :/
  install -Ddm755 "$pkgdir"/usr/{bin,share/NHIICC}
  install -Dm755 mLNHIICC_Setup/x64/mLNHIICC -t "$pkgdir"/usr/bin
  cp -dr --no-preserve=ownership mLNHIICC_Setup/{cert,html} "$pkgdir"/usr/share/NHIICC/
  find "$pkgdir" \( -name '*~' -or -name '._*' \) -delete

  install -Ddm755 "$pkgdir"/usr/lib/systemd/system
  install -Dm644 nhiicc.service -t "$pkgdir"/usr/lib/systemd/system/
}
