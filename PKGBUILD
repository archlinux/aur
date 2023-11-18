# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tristelune tristelune aat archlinux.info
# Contributor: Daniel Cardenas thecubeisalie at gmail.com

# TODO: Get rid of /usr/local
# TODO: Use install_post instead of our own package() commands
# TODO: Change to supplied tpdaemon.service

# Copyright: TurboPrint for Linux is copyright (c) ZEDOnet GmbH, Sedanstrasse 8, 87600 Kaufbeuren, Germany.
# All rights reserved. You may not distribute the program files by any means, e.g. on WEB servers,
# CDs, Linux distributions, etc. without the prior written consent of ZEDOnet GmbH.

set -u
pkgname='turboprint'
_pkgver='2.55-1'
pkgver="${_pkgver//-/.}"
pkgrel='1'
pkgdesc='High-quality printer driver system for Linux'
arch=('i686' 'x86_64')
url='http://www.turboprint.info/'
license=('custom')
depends=('cups' 'ghostscript')
depends+=('at-spi2-core' 'glibc' 'gcc-libs' 'bash' 'pango' 'glib2' 'libcups' 'gdk-pixbuf2' 'gtk2' )
optdepends=(
  'gimp: For GIMP plugin'
  #'kdelibs: For KDE applet'
  'gnome-panel-bonobo: For GNOME applet'
  'libgnomeui: For GNOME applet'
  'firefox: For browsing help'
)
backup=('etc/turboprint/system.cfg')
options=('!strip')
install="${pkgname}.install"
#_verwatch=('http://www.turboprint.info/history.html' '[0-9][0-9]-[a-z][a-z][a-z]-[0-9][0-9] - \([0-9\.]\+\).*' 'f')
source=('turboprint.desktop'
        'turboprint-monitor.desktop'
        'tprintdaemon.service')
_srcdir="${pkgname}-${_pkgver}"
# ftp://ftp.zedonet.com/tp2/turboprint-2.44-1.x86_64.tgz
# ftp://ftp.zedonet.com/tp2/turboprint-2.44-1.i586.tgz
# http://www.turboprint.info/tp2/arm/turboprint-2.44-1.ARMhf.tgz
# ftp://ftp.zedonet.com/tp2/arm/turboprint-2.44-1.ARMhf.tgz
source_i686=("https://www.zedonet.com/download/tp2/${_srcdir}.i586.tgz")
source_x86_64=("https://www.zedonet.com/download/tp2/${_srcdir}.x86_64.tgz")
md5sums=('e3c504b2c1b7deb01d03fde710b117d7'
         '60a1754b2abd30e75e51acd9576cda43'
         '2640e1d95c3579d6cef590d18b4476df')
md5sums_i686=('ccf7d37f20076d6293b5b9e3240c0fb9')
md5sums_x86_64=('d46e242ec463886457d5000b4ec92046')
sha256sums=('c90e4f71a234dc0638d15305184daeed212ebf1f7efc2f5a2a09895ca09bea6d'
            'de0c92b665150ceaf33c3cfd94b0afb422609194db9416aff59add5123bb8a2f'
            'a6ba2b4bab8d2512e542427dd3473d1764a777ef0493031046dc7282dc05fdad')
sha256sums_i686=('54495c2dc00c6dd6b274c352eccc4813c4b1af75e9c24aa47c86bb70b2bccbbe')
sha256sums_x86_64=('c83cdb8f5a7f40586fde605f88aaae7b5f15d05f1c1db7b46ef3da7b7527fad4')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e 's#^\(TPDAEMON_USER\)=.*$#\1=root#' -i 'system.cfg'
  if ! grep -qe '^TP_CUPS=1' 'system.cfg'; then
    echo 'TP_CUPS=1' >> 'system.cfg'
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  RPM_BUILD_ROOT="${pkgdir}" sh -u 'lib/install-static' --rpm

  # Install icons
  install -Dpm644 'img/tpapplet.png' 'img/tpicon.png' 'img/tpmonitor.png' -t "${pkgdir}/usr/share/pixmaps"

  # Install desktop entries
  install -Dpm644 "${srcdir}/turboprint.desktop" "${srcdir}/turboprint-monitor.desktop" -t "${pkgdir}/usr/share/applications/"

  # Install license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../${pkgname}/locale/license_en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install daemon
  install -Dpm644 "${srcdir}/tprintdaemon.service" -t "${pkgdir}/usr/lib/systemd/system/"

  # Install CUPS components
  install -Dpm755 "${pkgdir}/usr/lib/turboprint"/{pstoturboprint,commandtoturboprint} -t "${pkgdir}/usr/lib/cups/filter/"
  install -Dpm755 "${pkgdir}/usr/lib/turboprint/tpu" -t "${pkgdir}/usr/lib/cups/backend/"

  # Install GIMP plugin
  install -Dpm755 "${pkgdir}/usr/lib/turboprint/gimpplugin/gpturboprint" -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins/"
  install -Dpm644 "${pkgdir}/usr/lib/turboprint/gimpplugin/de.gmo" "${pkgdir}/usr/local/share/locale/de/LC_MESSAGES/gpturboprint.mo"
  install -Dpm644 "${pkgdir}/usr/lib/turboprint/gimpplugin"/{papers,printers}.xml -t "${pkgdir}/usr/local/share/gpturboprint/1.1.11/xml/"

  # Install KDE applet
  install -Dpm644 "${pkgdir}/usr/lib/turboprint/kde42applet/plasma-applet-turboprint.desktop" -t "${pkgdir}/usr/share/kde4/services/"
  install -Dpm755 "${pkgdir}/usr/lib/turboprint/kde42applet/plasma_applet_turboprint.so" -t "${pkgdir}/usr/lib/kde4/"

  # Missing deps libpanel-applet-2.so.0 libgnomeui-2.so.0 libgnome-2.so.0
  # Install GNOME applet
  #install -Dpm644 "${pkgdir}/usr/lib/turboprint/gnomeapplet/tpmonapplet.server" -t "${pkgdir}/usr/lib/bonobo/servers/"
  #install -Dpm755 "${pkgdir}/usr/lib/turboprint/gnomeapplet/tpgnomeapplet" -t "${pkgdir}/usr/bin/"

  # Fix permissions
  chmod 4755 "${pkgdir}/usr/share/turboprint/lib/pipeutility"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
