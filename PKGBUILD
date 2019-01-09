
# Maintainer: boosterdev@linuxmail.org
# Contributer: Ben Ruijl <benruyl@gmail.com> (sabnzbd)

_pkgname=sabnzbd
pkgname=sabnzbd-git
pkgver=2.3.7RC1.r2.g6f69bfd9
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
source=("git://github.com/sabnzbd/sabnzbd.git"
        "$_pkgname-shell" "sabnzbd.desktop" "addnzb.sh" "nzb.png" "sabnzbd.png" "x-nzb.xml" "sabnzbd.service" "sabnzbd.confd")
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
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -d -m755 "${pkgdir}/opt/${_pkgname}"
  touch "${pkgdir}/opt/${_pkgname}/${_pkgname}.ini"
  cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"

  # Fix for issues with Python 3
  find "${pkgdir}/opt/${_pkgname}" -type f -exec sed -i 's/python/python2/g' {} \;
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/${_pkgname}/SABnzbd.py"

  install -Dm755 "${srcdir}/${_pkgname}-shell"       "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.confd" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${srcdir}/addnzb.sh"    "${pkgdir}/opt/${_pkgname}/addnzb.sh"
  install -Dm644 "${srcdir}/nzb.png"    "${pkgdir}/opt/${_pkgname}/nzb.png"
  install -Dm644 "${srcdir}/sabnzbd.png"  "${pkgdir}/opt/${_pkgname}/sabnzbd.png"
  install -Dm644 "${srcdir}/x-nzb.xml"    "${pkgdir}/opt/${_pkgname}/x-nzb.xml"
}
