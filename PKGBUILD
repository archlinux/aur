# Maintainerb
# Contributor: Daniel Cardenas <thecubeisalie@gmail.com>
pkgname=turboprint
pkgver=2.36
_realpkgver=${pkgver}-1
pkgrel=1
pkgdesc="High-quality printer driver system for Linux"
arch=('i686' 'x86_64')
url="http://www.turboprint.info/"
license=('custom')
depends=('cups' 'ghostscript')
makedepends=('pacman>=4.2')
optdepends=('gimp: For GIMP plugin'
            'kdelibs: For KDE applet'
            'gnome-panel-bonobo: For GNOME applet'
            'libgnomeui: For GNOME applet'
            'firefox: For browsing help')
install="${pkgname}.install"
source=("turboprint.desktop"
        "turboprint-monitor.desktop"
        "tprintdaemon.service")
source_i686+=("http://www.turboprint.info/tp2/${pkgname}-${_realpkgver}.i586.tgz")
source_x86_64+=("http://www.turboprint.info/tp2/${pkgname}-${_realpkgver}.x86_64.tgz")
md5sums=('e3c504b2c1b7deb01d03fde710b117d7'
         '60a1754b2abd30e75e51acd9576cda43'
         '4965b03fdb3c57282f74b0d79a66c6ef')
md5sums_i686+=('1660c78094a80fa1693b15e4b003c3bb')
md5sums_x86_64+=('0376d2d028529fb04c94c7288f51e2cb')

build() {
  [ -f "${srcdir}/${pkgname}-${_realpkgver}.${_arch}.tar" ] && bsdtar -xf "${srcdir}/${pkgname}-${_realpkgver}.${_arch}.tar"
  cd "${srcdir}/${pkgname}-${_realpkgver}"
  sed -i 's#^TPDAEMON_USER=lp$#TPDAEMON_USER=root#' system.cfg
  if ! grep TP_CUPS=1 system.cfg > /dev/null; then
    echo TP_CUPS=1 >> system.cfg
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${_realpkgver}"
  RPM_BUILD_ROOT="${pkgdir}" lib/install-static --rpm

  # Install icons
  install -D -m644 img/tpapplet.png "${pkgdir}/usr/share/pixmaps/tpapplet.png"
  install -D -m644 img/tpicon.png "${pkgdir}/usr/share/pixmaps/tpicon.png"
  install -D -m644 img/tpmonitor.png "${pkgdir}/usr/share/pixmaps/tpmonitor.png"

  # Install desktop entries
  install -D -m644 "${srcdir}/turboprint.desktop" "${pkgdir}/usr/share/applications/turboprint.desktop"
  install -D -m644 "${srcdir}/turboprint-monitor.desktop" "${pkgdir}/usr/share/applications/turboprint-monitor.desktop"

  # Install license
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  (cd "${pkgdir}/usr/share/licenses/${pkgname}" && ln -sf "../../${pkgname}/locale/license_en.txt" "LICENSE")

  # Install daemon
  install -D -m644 "${srcdir}/tprintdaemon.service" "${pkgdir}/usr/lib/systemd/system/tprintdaemon.service"

  # Install CUPS components
  install -D -m755 "${pkgdir}/usr/lib/turboprint/pstoturboprint" "${pkgdir}/usr/lib/cups/filter/pstoturboprint"
  install -D -m755 "${pkgdir}/usr/lib/turboprint/commandtoturboprint" "${pkgdir}/usr/lib/cups/filter/commandtoturboprint"
  install -D -m755 "${pkgdir}/usr/lib/turboprint/tpu" "${pkgdir}/usr/lib/cups/backend/tpu"

  # Install GIMP plugin
  install -D -m755 "${pkgdir}/usr/lib/turboprint/gimpplugin/gpturboprint" "${pkgdir}/usr/lib/gimp/2.0/plug-ins/gpturboprint"
  install -D -m644 "${pkgdir}/usr/lib/turboprint/gimpplugin/de.gmo" "${pkgdir}/usr/local/share/locale/de/LC_MESSAGES/gpturboprint.mo"
  install -D -m644 "${pkgdir}/usr/lib/turboprint/gimpplugin/papers.xml" "${pkgdir}/usr/local/share/gpturboprint/1.1.11/xml/papers.xml"
  install -D -m644 "${pkgdir}/usr/lib/turboprint/gimpplugin/printers.xml" "${pkgdir}/usr/local/share/gpturboprint/1.1.11/xml/printers.xml"

  # Install KDE applet
  install -D -m644 "${pkgdir}/usr/lib/turboprint/kde42applet/plasma-applet-turboprint.desktop" "${pkgdir}/usr/share/kde4/services/plasma-applet-turboprint.desktop"
  install -D -m755 "${pkgdir}/usr/lib/turboprint/kde42applet/plasma_applet_turboprint.so" "${pkgdir}/usr/lib/kde4/plasma_applet_turboprint.so"

  # Install GNOME applet
  install -D -m644 "${pkgdir}/usr/lib/turboprint/gnomeapplet/tpmonapplet.server" "${pkgdir}/usr/lib/bonobo/servers/tpmonapplet.server"
  install -D -m755 "${pkgdir}/usr/lib/turboprint/gnomeapplet/tpgnomeapplet" "${pkgdir}/usr/bin/tpgnomeapplet"

  # Fix permissions
  chmod 4755 "${pkgdir}/usr/share/turboprint/lib/pipeutility"
}

# vim:set ts=2 sw=2 et:
