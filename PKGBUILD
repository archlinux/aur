pkgname=reaper
pkgver=5.975rc1
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('custom')
depends=('gdk-pixbuf2' 'jack')
source=("https://www.reaper.fm/files/5.x/${pkgname}${pkgver//.}_linux_x86_64.tar.xz"
	'https://stash.reaper.fm/30638/reaper-desktop-support.zip')
sha256sums=('cbdd47a945a984cc99d3ca781a7cbe1a7bfb51c49a7a434c835cdb9e0a8fc820'
            'c16c8d8d66502852f4948d0c2d3f48f7fd17e598d1f14b05cec54e6cfd8c01b7')

package() {
  DESTDIR="${pkgdir}/usr/lib"
  LICENSEDIR="${pkgdir}/usr/share/licenses/reaper/"
  mkdir -p "${DESTDIR}"
  cp -R "${srcdir}/reaper_linux_x86_64/REAPER/" "${DESTDIR}"
  mkdir "${pkgdir}/usr/bin"
  ln -s /usr/lib/REAPER/reaper "${pkgdir}/usr/bin/reaper"
  ln -s /usr/lib/REAPER/reaper "${pkgdir}/usr/bin/reaper5" #(legacy)

  install -D -m644 "${srcdir}/reaper_linux_x86_64/REAPER/license.txt" "${LICENSEDIR}/LICENSE"

  # desktop integration
  for file in "${srcdir}"/*.desktop; do
	  sed -i "s#/home/user/pathto#/usr/lib#" $file
	  sed -i "s#reaper5#reaper#" $file
	  filename=`basename "${file}"`
	  install -D -m644 "${file}" "${pkgdir}/usr/share/applications/${filename}"
  done

  install -D -m644 cockos-reaper.directory "${pkgdir}/usr/share/desktop-directories/cockos-reaper.directory"
  install -D -m644 cockos-reaper.menu "${pkgdir}/usr/share/menus/applications-merged/cockos-reaper.menu"
  install -D -m644 reaper.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/reaper.png"
  install -D -m644 reamote.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/reamote.png"
  install -D -m644 application-x-reaper.xml "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"
}

