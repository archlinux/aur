pkgname=reaper
pkgver=5.70
pkgrel=1
pkgdesc="digital audio workstation"
arch=('x86_64')
url="http://www.reaper.fm"
license=('custom')
depends=('gdk-pixbuf2' 'gtk3' 'jack')
makedepends=('git' 'gcc' 'make')
source=("http://www.landoleet.org/${pkgname}${pkgver//.}_linux_x86_64.tar.xz"
	"git+http://www-dev.cockos.com/wdl/WDL.git"
	'https://stash.reaper.fm/30638/reaper-desktop-support.zip')
md5sums=('2e5f5cd5220984cd7ad4aa4bf6a4b61f'
         'SKIP'
         'f2a03f018f87e2ea11f358e32d6c2f79')

build() {
  cd "${srcdir}/WDL/WDL/swell"
  make
}

package() {
  DESTDIR="${pkgdir}/usr/lib/"
  LICENSEDIR="${pkgdir}/usr/share/licenses/reaper/"
  mkdir -p "${DESTDIR}"
  cp -R "${srcdir}/reaper_linux_x86_64/REAPER/" "${DESTDIR}"
  cp "${srcdir}/WDL/WDL/swell/libSwell.so" "${DESTDIR}/REAPER"
  mkdir "${pkgdir}/usr/bin"
  ln -s /usr/lib/REAPER/reaper5 "${pkgdir}/usr/bin/reaper5"

  install -D -m644 "${srcdir}/reaper_linux_x86_64/REAPER/license.txt" "${LICENSEDIR}/LICENSE"

  # desktop integration
  for file in "${srcdir}"/*.desktop; do
	  sed -i "s#/home/user/pathto#/usr/lib#" $file
	  filename=`basename "${file}"`
	  install -D -m644 "${file}" "${pkgdir}/usr/share/applications/${filename}"
  done

  install -D -m644 cockos-reaper.directory "${pkgdir}/usr/share/desktop-directories/cockos-reaper.directory"
  install -D -m644 cockos-reaper.menu "${pkgdir}/usr/share/menus/applications-merged/cockos-reaper.menu"
  install -D -m644 reaper.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/reaper.png"
  install -D -m644 reamote.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/reamote.png"
  install -D -m644 application-x-reaper.xml "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"
}


post_install() {
  update-mime-database usr/share/mime &>/dev/null
  update-desktop-database -q &>/dev/null
  xdg-icon-resource forceupdate --theme hicolor &> /dev/null
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}

