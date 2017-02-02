# Maintainer: (locke87) Felix Mauch
# based on http://kde-apps.org/content/show.php?content=124416

pkgname=kde-servicemenus-dropbox
pkgver=0.16.1
pkgrel=9
pkgdesc="A servicemenu for KDE4 which allows easy access to most of Dropbox features. It uses Dropbox CLI to generate public urls, and pyndexer to allow sharing directories in public directory."
url="https://www.kde-look.org/p/998468/"
license=('GPL')
arch=(any)
conflicts=('dropbox-servicemenu')
depends=('dropbox' 'python2' 'kdialog' 'python2-m2crypto' 'sharutils' 'recode' 'perl' 'sqlite' 'xdg-utils')
source=("https://dl.opendesktop.org/api/files/download/id/1466690475/124416-DropboxServiceMenu-${pkgver}.tar.gz"
        "kde5.patch")
md5sums=('3c0186649311611abfbb8ac016a67791'
         'a6945d04da03a52d88d8117f785035a3')


build() {
  cd "$srcdir"

  # Apply the patch given by "swyear" in the comments section of the kde-look.org page
  patch -s -p0 < kde5.patch

  cd "$srcdir/DropboxServiceMenu-${pkgver}/"
  sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' dropbox-scripts/dropbox.py
  sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' dropbox-scripts/dropbox-notify.py
  sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' dropbox-scripts/pyndexer.py

  _SCRIPT_PATH="/usr/"
  _PATTERN="\$HOME/.local"

  sed -i "s,${_PATTERN},${_SCRIPT_PATH}," dropbox-scripts/dropbox_menu.sh
  sed -i "s,${_PATTERN},${_SCRIPT_PATH}," dropbox_all.desktop
  sed -i "s,${_PATTERN},${_SCRIPT_PATH}," dropbox_files.desktop
  sed -i "s,${_PATTERN},${_SCRIPT_PATH}," dropbox_directories.desktop


}

package() {
  cd "$srcdir/DropboxServiceMenu-${pkgver}/"

  mkdir -p                                   "${pkgdir}/usr/share/kservices5/ServiceMenus/dropbox-scripts"
  install -m 644 dropbox_all.desktop         "${pkgdir}/usr/share/kservices5/ServiceMenus/"
  install -m 644 dropbox_files.desktop       "${pkgdir}/usr/share/kservices5/ServiceMenus/"
  install -m 644 dropbox_directories.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
  install -m 755 dropbox-scripts/*           "${pkgdir}/usr/share/kservices5/ServiceMenus/dropbox-scripts/"

}
