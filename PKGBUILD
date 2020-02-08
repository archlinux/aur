#Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=xmlmind-xmleditor
_pkgname=xxe
pkgver=9.2.0
_pkgver=9_2_0
pkgrel=1
pkgdesc="XMLmind XML Editor"
license=('Custom')
url="https://www.xmlmind.com/xmleditor"
arch=('any')
depends=('java-runtime>=8')
makedepends=('libicns' 'gendesk')
install=${_pkgname}.install
source=("http://www.xmlmind.com/xmleditor/_download/xxe-perso-${_pkgver}.zip")
sha256sums=('78e35604b6d6754ad47c02a2b7d71802bd82c60b6c2621a281dc9b1dc493279a')

prepare() {
  # use better icons
  icns2png -x xxe-perso-${_pkgver}/bin/icon/xxe.icns

  # create launcher
  gendesk -f -n \
      --pkgname="$_pkgname" \
      --name="XXE" \
      --genericname="XML IDE" \
      --comment="Edit XML files" \
      --startupnotify=True \
      --exec=/usr/bin/xxe \
      --categories='Development;IDE;Java'
}

package() {
  mkdir -p "${pkgdir}"/opt
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/doc/${_pkgname}
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}

  cp -a "${srcdir}"/xxe-perso-${_pkgver} "${pkgdir}"/opt/xxe/

  ln -s /opt/xxe/bin/xxe "${pkgdir}"/usr/bin/xxe
  ln -s /opt/xxe/bin/xxetool "${pkgdir}"/usr/bin/xxetool
  ln -s /opt/xxe/bin/xmltool "${pkgdir}"/usr/bin/xmltool
  ln -s /opt/xxe/bin/csscheck "${pkgdir}"/usr/bin/csscheck
  ln -s /opt/xxe/bin/authvalue "${pkgdir}"/usr/bin/authvalue
  ln -s /opt/xxe/bin/deployxxe "${pkgdir}"/usr/bin/deployxxe

  ln -s /opt/xxe/doc "${pkgdir}"/usr/share/doc/${_pkgname}
  ln -s /opt/xxe/demo "${pkgdir}"/usr/share/doc/${_pkgname}

  ln -s /opt/xxe/legal "${pkgdir}"/usr/share/licenses/${_pkgname}
  ln -s /opt/xxe/legal.txt "${pkgdir}"/usr/share/licenses/${_pkgname}

  # place icons and launcher
  for size in 16 32 128 256 512; do
      install -Dm644 "xxe_${size}x${size}x32.png" \
        "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/xxe.png
  done

  install -Dm644 xxe.desktop -t "$pkgdir"/usr/share/applications/

  # remove unneeded stuff
  find  "${pkgdir}"/opt/xxe/bin/ -name \*.bat -delete
  find  "${pkgdir}"/opt/xxe/bin/ -name \*.exe -delete
  rm    "${pkgdir}"/opt/xxe/bin/xxe.jstart
  rm -r "${pkgdir}"/opt/xxe/bin/icon
}
