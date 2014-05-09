# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Based on PKGBUILD firefox-extension-video-downloadhelper

_plugin_name=nagioschecker
_plugin_version=0.16
pkgdesc='Plugin for firefox, statusbar indicator of the events from the network monitoring system Nagios.'
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=17
arch=('any')
url='https://code.google.com/p/nagioschecker/'
depends=('firefox>=3.0')
optdepends=('firefox-extension-addonbar')
source=('https://addons.mozilla.org/firefox/downloads/latest/3607/addon-3607-latest.xpi'
        'tooltip_header_color.patch'
        'limit_0.patch'
        'menupopup.patch')
md5sums=('6ad71fd4d6fed74a272072f804abb80e'
         'fa6176f083d02d2a282041d0375abb55'
         'a9d606cdec9b939e4ceb1e180939e988'
         '167f82037fab0b9e1ee10125499dd41f')

prepare() {
  # Fix the color bug in recent version of firefox
  patch -uN ${srcdir}/chrome/nagioschecker/skin/classic/nagioschecker/nagioschecker.css < ${srcdir}/tooltip_header_color.patch
  patch -uN ${srcdir}/chrome/nagioschecker/content/utils.js < ${srcdir}/limit_0.patch
  patch -uN ${srcdir}/chrome/nagioschecker/content/nagioschecker-options.xul < ${srcdir}/menupopup.patch

  # Increase max version (reported on https://addons.mozilla.org/en-US/firefox/addon/nagios-checker/)
  sed -i 's/<em:maxVersion>\(.*\)<\/em:maxVersion>/<em:maxVersion>99\.*\.\*<\/em:maxVersion>/' ${srcdir}/install.rdf
}

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir

  cp -dpr --no-preserve=ownership * $dstdir

  rm $dstdir/addon-3607-latest.xpi
  chmod -R 755 $dstdir
}
