
# Maintainer: boosterdev@linuxmail.org
# Contributer: Ben Ruijl <benruyl@gmail.com> (sabnzbd)

pkgname=sabnzbd-git
pkgver=2.3.8RC1.r213.g1671ca5e
pkgrel=1
pkgdesc="A web-interface based binary newsgrabber with NZB file support"
url="http://www.sabnzbd.org"
arch=("any")
license=("GPL")
depends=("curl" "par2cmdline" "python2" "python2-cheetah" "python2-sabyenc" "sqlite" "unrar" "unzip")
optdepends=("xdg-utils: registration of .nzb files" "python2-feedparser: rss support" "python2-pyopenssl: ssl support" "par2cmdline-tbb: par2 multi-threading")
makedepends=('git')
conflicts=('sabnzbd')
install="sabnzbd.install"
backup=("etc/conf.d/sabnzbd" "opt/sabnzbd/sabnzbd.ini")
source=("${pkgname%-git}::git://github.com/sabnzbd/sabnzbd.git"
        "${pkgname%-git}-shell" "sabnzbd.desktop" "addnzb.sh" "nzb.png" "sabnzbd.png" "x-nzb.xml" "sabnzbd.service" "sabnzbd.confd")
sha256sums=('SKIP'
            '82630edfc767a383843ffaae9d716e99010dad9e93bdee08d541faa74e694a65'
            '887f93942b78c0475009b1ce84b502c28e273c222451a4736cd4c37ff5454f04'
            '30ffff8b9c00e91358cd6c5dca89f9d9f8f12843e7b3c44c6d5b0f09b0ea424a'
            'ef8f4fb1a3a0750c74b7addd302ab8733187ad370b5d27336afb2677d7154571'
            'fce3e065d017ce3bc4548a766f25c95f982af4f6085263c72f3000f49d810409'
            'f53261d7578c67fb9fd6a639df94cd53604bcf37b9b03a926cb03e5214b496fe'
            '3de9c07d7731a9756a60691c56897b1cb0c802c5eb510a7bb68b9e1c82d7102c'
            '8462203454d488b5d4f7beb85e61da2efa42d3dffa465f3bf16a95abe0bc7c0a')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  install -d -m755 "${pkgdir}/opt/${pkgname%-git}"
  touch "${pkgdir}/opt/${pkgname%-git}/${pkgname%-git}.ini"
  cp -r "${srcdir}/${pkgname%-git}/"* "${pkgdir}/opt/${pkgname%-git}"

  # Fix for issues with Python 3
  find "${pkgdir}/opt/${pkgname%-git}" -type f -exec sed -i 's/python/python2/g' {} \;
  find "${pkgdir}/opt/${pkgname%-git}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${pkgname%-git}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/${pkgname%-git}/SABnzbd.py"

  install -Dm755 "${srcdir}/${pkgname%-git}-shell"       "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}.confd" "${pkgdir}/etc/conf.d/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
  install -Dm755 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm755 "${srcdir}/addnzb.sh"    "${pkgdir}/opt/${pkgname%-git}/addnzb.sh"
  install -Dm644 "${srcdir}/nzb.png"    "${pkgdir}/opt/${pkgname%-git}/nzb.png"
  install -Dm644 "${srcdir}/sabnzbd.png"  "${pkgdir}/opt/${pkgname%-git}/sabnzbd.png"
  install -Dm644 "${srcdir}/x-nzb.xml"    "${pkgdir}/opt/${pkgname%-git}/x-nzb.xml"
}
