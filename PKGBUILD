pkgname=sabnzbd
_pkgname=SABnzbd
pkgver=2.3.9
pkgrel=1
pkgdesc="A web-interface based binary newsgrabber with NZB file support"
url="http://www.sabnzbd.org"
arch=('any')
license=('GPL')
depends=('curl'
         'par2cmdline'
         'python2'
         'python2-cheetah'
         'python2-sabyenc'
         'sqlite'
         'unrar'
         'unzip')

optdepends=('xdg-utils: registration of .nzb files'
            'python2-feedparser: rss support'
            'python2-pyopenssl: ssl support'
            'par2cmdline-tbb: par2 multi-threading')

install="${pkgname}.install"
backup=('etc/conf.d/sabnzbd' "opt/${pkgname}/${pkgname}.ini")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-src.tar.gz"
        "${pkgname}"
        "${pkgname}.desktop"
        'addnzb.sh'
        'nzb.png'
        'sabnzbd.png'
        'x-nzb.xml'
        "${pkgname}.service"
        'sabnzbd.sysusers'
        "${pkgname}.confd")

sha256sums=('f3ab6dffba914e6ddf88f1a755ec3ebaa95f0bdbec6f04b7bf0f90822249bb0c'
            '82630edfc767a383843ffaae9d716e99010dad9e93bdee08d541faa74e694a65'
            '887f93942b78c0475009b1ce84b502c28e273c222451a4736cd4c37ff5454f04'
            '30ffff8b9c00e91358cd6c5dca89f9d9f8f12843e7b3c44c6d5b0f09b0ea424a'
            'ef8f4fb1a3a0750c74b7addd302ab8733187ad370b5d27336afb2677d7154571'
            'fce3e065d017ce3bc4548a766f25c95f982af4f6085263c72f3000f49d810409'
            'f53261d7578c67fb9fd6a639df94cd53604bcf37b9b03a926cb03e5214b496fe'
            '3de9c07d7731a9756a60691c56897b1cb0c802c5eb510a7bb68b9e1c82d7102c'
            '8cdeae7e8fa327bafc2fd1b19c1995f89f52b2ba231c8305b4e7269ab9e0738a'
            '8462203454d488b5d4f7beb85e61da2efa42d3dffa465f3bf16a95abe0bc7c0a')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  touch "${pkgdir}/opt/${pkgname}/${pkgname}.ini"
  cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"

  # Fix for issues with Python 3
  find "${pkgdir}/opt/${pkgname}" -type f -exec sed -i 's/python/python2/g' {} \;
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/${pkgname}/${_pkgname}.py"

  install -Dm755 "${srcdir}/${pkgname}"       "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.confd" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/sabnzbd.sysusers" "${pkgdir}/usr/lib/sysusers.d/sabnzbd.conf"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/addnzb.sh"    "${pkgdir}/opt/${pkgname}/addnzb.sh"
  install -Dm644 "${srcdir}/nzb.png"    "${pkgdir}/opt/${pkgname}/nzb.png"
  install -Dm644 "${srcdir}/sabnzbd.png"  "${pkgdir}/opt/${pkgname}/sabnzbd.png"
  install -Dm770 "${srcdir}/x-nzb.xml"    "${pkgdir}/opt/${pkgname}/x-nzb.xml"
}
