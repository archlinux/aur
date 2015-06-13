# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Jesus Lazaro Plaza <jesuslazaro84 at gmail dot com>

pkgname=smile
pkgver=1.0
pkgrel=4
pkgdesc="Slideshow Maker In Linux Environnement"
url="http://smile.tuxfamily.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qtwebkit' 'mesa' 'sox' 'mplayer' 'imagemagick' 'perl' 'desktop-file-utils')
install=smile.install
source=("http://repository.slacky.eu/slackware-13.0/multimedia/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.gz"
        "smile.desktop")
md5sums=('7f1fa1b1e0ab661d5a74ac4b8ee02511'
         'aefd88b769e18f5406647539ed953937')
sha1sums=('d8b962c11d6dac657fd722f2ec1467a159379265'
          'fbf44a3550412024d4de40d515f7a2e1f8a5ad1d')
sha256sums=('d6a6f5a2c7bce2dff174c4cb7f09a6326a926416c1ea47c6bdfc592b9cece9bf'
            '43d0e301533d27ede195fdfa7ce7b9b0bedafe8d6ae76c0edcf840f35cfea868')

prepare() {
  cd "${pkgname}"
  find . -name "*.*~" -delete
  find . -name ".directory" -delete
}

build() {
  cd "${pkgname}"
  qmake-qt4
  make
}

package() {
  cd "${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/share/${pkgname}" fake.pl
  install -m 755 -t "${pkgdir}/usr/share/${pkgname}" smile
  for _lang in de en es it pl pt ru
  do
    install -m 644 -t "${pkgdir}/usr/share/${pkgname}" smile_${_lang}.qm
  done
  cp -R BIB_ManSlide Interface "${pkgdir}/usr/share/${pkgname}"
  chmod -R 744 "${pkgdir}/usr/share/${pkgname}/BIB_ManSlide" "${pkgdir}/usr/share/${pkgname}/Interface"
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  # Add symlink to executable file
  install -d -m 755 "${pkgdir}/usr/bin"
  ln -sf "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/smile"

  # Creating menu item
  install -D -m644 "Interface/Theme/logostart.png" "${pkgdir}/usr/share/pixmaps/smile.png"
  install -D -m644 "${srcdir}/smile.desktop" "${pkgdir}/usr/share/applications/smile.desktop"
}
