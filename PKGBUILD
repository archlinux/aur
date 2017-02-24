# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom < tomgparchaur at gmail dot com >
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dropbox-gtk2
pkgver=2.10.52
pkgrel=3
pkgdesc='A free service that lets you bring your photos, docs, and videos anywhere and share them easily (GTK2 version)'
arch=('i686' 'x86_64')
url='https://www.dropbox.com/'
license=('custom')
depends=('dbus-glib' 'gtk2' 'libsm')
provides=('dropbox')
conflicts=('dropbox' 'dropbox-experimental')
options=('!strip' '!upx')

source=('dropbox.png'
        'dropbox.desktop'
        'dropbox.service'
        'dropbox@.service'
        'TERMS'
)
sha256sums=('e7d245f5d1a3d5322614b61400ae2913a8caef44bc86717ff7d8197a15dd7f01'
            'dd8fdb362c0bba8d789010594f021671ff00e535fc75e13da855f43bc7a4b3aa'
            'f2b873c420d8250d2d48c537ad0d041fb83e900bcad68541fa63321f81f8811b'
            '09ebf566b31a4d314ddabc3cdee57b83d544061141ee75101f96be268b1d1b17'
            '17769784393bac9ad056bdb6830e633b4b1f1b3e0ebe0d96cef4cea8f92bb939'
)

_arch='x86_64'

if [ "${CARCH}" == 'i686' ]; then
  _arch='x86'
  sha256sums+=('a9d65a745cf8651f6dd3557f002d888ed5309d1b1d6d44be7af88fb2ae9ea5e6')
else
  sha256sums+=('e61ef14cdf8bd4801ff2794c1178b2cac5c097ebffb3b24d061738006e76c23a')
fi

source+=("https://dl.dropboxusercontent.com/u/17/dropbox-lnx.${_arch}-${pkgver}.tar.gz")

package() {
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/.dropbox-dist/dropbox-lnx.${_arch}-${pkgver}" "${pkgdir}/opt/dropbox"

  find "${pkgdir}/opt/dropbox/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/dropbox/dropboxd"
  chmod 755 "${pkgdir}/opt/dropbox/dropbox"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/dropbox/dropbox" "${pkgdir}/usr/bin/dropbox"
  ln -s "/opt/dropbox/dropboxd" "${pkgdir}/usr/bin/dropboxd"

  install -Dm644 "${srcdir}/dropbox.desktop" "${pkgdir}/usr/share/applications/dropbox.desktop"
  install -Dm644 "${srcdir}/dropbox.png" "${pkgdir}/usr/share/pixmaps/dropbox.png"
  install -Dm644 "${srcdir}/dropbox.service" "${pkgdir}/usr/lib/systemd/user/dropbox.service"
  install -Dm644 "${srcdir}/dropbox@.service" "${pkgdir}/usr/lib/systemd/system/dropbox@.service"
  install -Dm644 "${srcdir}/TERMS" "${pkgdir}/usr/share/licenses/$pkgname/TERMS"

  rm -f "${pkgdir}/opt/dropbox/library.zip"
  ln -s dropbox "${pkgdir}/opt/dropbox/library.zip"
}
