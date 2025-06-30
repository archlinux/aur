# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

# Testing pages:
# * https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/webtesting/SampleY.aspx
# * /usr/share/nhiicc/html/ESample.html in this package

pkgname=nhiicc
epoch=1
pkgver=20240710.1
pkgrel=3
arch=(x86_64)
url='https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm'
license=(custom)
pkgdesc='台灣健保卡網路註冊憑證元件 (National Health Insurance IC Card)'
# sed and openssl are for commands used in nhiicc.install
depends=(pcsclite sed openssl)
makedepends=(patchelf)
optdepends=(
  'lib32-pcsclite: for using card readers with 32-bit driver only'
)
source=("CMS_mNHIICC_Setup-$pkgver.Linux.zip"::"https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/CMS_mNHIICC_Setup.Linux.zip"
        nhiicc.service
        nhiicc.rules
        regen-certs.sh)
noextract=("CMS_mNHIICC_Setup-$pkgver.Linux.zip")
# See https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm for MD5 sums
md5sums=('3bbad14d8ce82a504811319e06c3cdac'
         '3a7ba068b49eab2edca614ea2495e706'
         'e4a249ff4e638527a0bde9deec6eeb5a'
         '97e402f39fffe35e411419d062f6baf8')
install=nhiicc.install

prepare() {
  bsdtar xOf CMS_mNHIICC_Setup-${pkgver}.Linux.zip | bsdtar x

  # Delete insecure RUNPATH
  patchelf --remove-rpath mLNHIICC_Setup/x64/mLNHIICC
}

package() {
  install -Dm755 mLNHIICC_Setup/x64/mLNHIICC -t "$pkgdir"/usr/bin
  install -Dm755 regen-certs.sh -t "$pkgdir"/usr/share/nhiicc/
  cp -dr mLNHIICC_Setup/html "$pkgdir"/usr/share/nhiicc/
  install -Dm644 nhiicc.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 nhiicc.rules -t "$pkgdir"/usr/share/polkit-1/rules.d
}
