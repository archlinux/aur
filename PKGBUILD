# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nhiicc
# XXX: Upstream does not provide a version string :/
pkgver=20200319
pkgrel=2
arch=(x86_64)
url='https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm'
license=(custom)
pkgdesc='台灣健保卡網路註冊憑證元件 (National Health Insurance IC Card)'
# sed is for commands in nhiicc.install
depends=(openssl-1.0 pcsclite sed)
source=("https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mLNHIICC_Setup.Ubuntu.zip"
        nhiicc.service)
# See https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm for MD5 sums
md5sums=('52eacb7ca2b4d0a5a869df01079bf4d6'
         'a474c9ca019f23bf3adb5624990899b9')
install=nhiicc.install

prepare() {
  tar xf mLNHIICC_Setup.tar.gz
}

package() {
  # XXX: upstream binary appears to hard-code /usr/local/share/NHIICC :/
  install -Ddm755 "$pkgdir"/usr/local/share/NHIICC
  install -Dm755 mLNHIICC_Setup/x64/mLNHIICC -t "$pkgdir"/usr/local/share/NHIICC/
  cp -dr --no-preserve=ownership mLNHIICC_Setup/{cert,html} "$pkgdir"/usr/local/share/NHIICC/
  find "$pkgdir" \( -name '*~' -or -name '._*' \) -delete

  install -Ddm755 "$pkgdir"/usr/lib/systemd/system
  install -Dm644 nhiicc.service -t "$pkgdir"/usr/lib/systemd/system/
}
