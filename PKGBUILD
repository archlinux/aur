# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=3dm2
pkgver='2.11.00.021'
pkgrel=1
pkgdesc="LSI 3ware SATA+SAS RAID controller software. Includes 3dm2 and tw_cli."
arch=('x86' 'x86_64')
url="http://www.3ware.com"
license=('custom')
conflicts=('tw_cli')
backup=('etc/3dm2/3dm2.conf' 'etc/3dm2/3dm2.pem')
install=${pkgname}.install
source=("https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/3DM2_CLI-linux_10-2-2-1_9-5-5-1.zip"
        '3dm2.service')
sha256sums=('5354dd539d01163ee6d371da1bd595157dc6db8bfe0907dbb2b920d88cd627a9'
            '45903bd7b2848da5200f15d8e390f68ddfe14a9d5640818e8df75f6817e77463')

build() {
  tar xf tdmCliLnx.tgz
  tar xf tdm2Msg.tgz
  tar xf tdm2Help.tgz
  sed -i 's@Help .*@Help /usr/share/doc/3dm2/html@' 3dm2.conf
  sed -i 's@MsgPath .*@MsgPath /usr/share/3dm2/msg@' 3dm2.conf
}

package() {
  # tw_cli
  install -Dm755 tw_cli.${CARCH} "${pkgdir}/usr/bin/tw_cli"
  install -Dm644 tw_cli.8.nroff "${pkgdir}/usr/share/man/man8/tw_cli.8"
  install -Dm644 tw_cli.8.html "${pkgdir}/usr/share/doc/${pkgname}/html/tw_cli.8.html"

  # 3dm2 web interface
  install -Dm755 3dm2.${CARCH} "${pkgdir}/usr/bin/3dm2"
  install -Dm755 3dm2u.${CARCH} "${pkgdir}/usr/bin/3dm2u"
  install -Dm644 3dm2.conf "${pkgdir}/etc/3dm2/3dm2.conf"
  install -Dm644 logo.gif "${pkgdir}/etc/3dm2/logo.gif"
  install -Dm644 tdm_msg_en "${pkgdir}/usr/share/${pkgname}/msg/tdm_msg_en"
  install -Dm644 tw_msg_en "${pkgdir}/usr/share/${pkgname}/msg/tw_msg_en"

  # doc
  cp -R en "${pkgdir}/usr/share/doc/${pkgname}/html"

  # license
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # service
  install -Dm644 3dm2.service "${pkgdir}/usr/lib/systemd/system/3dm2.service"
}
