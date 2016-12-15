# Maintainer: Étienne Deparis <etienne@depar.is>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=bluecurve-icon-theme
pkgver=8.0.2
pkgrel=16
_rhfedver=24
_rhpkgrel=12
_rhpkgver=23
pkgdesc="Red Hat Icons from Fedora 10"
arch=('any')
url="https://fedorahosted.org/bluecurve/"
license=('GPL')
groups=('redhat-artwork')
optdepends=(
  'gnome-icon-theme: for inheriting missing icons'
)

source=("ftp://rpmfind.net/linux/fedora/linux/releases/${_rhfedver}/Everything/x86_64/os/Packages/b/bluecurve-icon-theme-${pkgver}-${_rhpkgrel}.fc${_rhpkgver}.noarch.rpm")
sha256sums=('25d69cd3bff37bc346d482b4453e728bdaf39766c6a847dd83fff4dec3098792')

build() {
  cd $srcdir/usr/share/icons
  mv Bluecurve BluecurveRH

  sed -i "s/^Name=Bluecurve$/Name=BluecurveRH/" BluecurveRH/index.theme
  sed -i "s/^Context=FileSystems$/Context=Places/" BluecurveRH/index.theme
  sed -i "s|^\[\(.*\)/status\]$|[\1/status]\nContext=Status|" BluecurveRH/index.theme

  find BluecurveRH -name '*.icon' -exec rm {} \;

  for size in 16x16 24x24 32x32 36x36 48x48; do
    cd $srcdir/usr/share/icons/BluecurveRH/$size/filesystems
    ln -s ../../$size/apps/desktop.png user-desktop.png
    ln -s ../../$size/apps/icon-network-systems.png network-server.png
    ln -s ../../$size/apps/icon-network-systems.png network-workgroup.png

    ## Uncomment the following lines to use the Red Hat logo instead of
    ## default gnome foot
    # ln -s ../../$size/apps/redhat-icon-panel-menu.png start-here.png
    # ln -s ../../$size/apps/redhat-icon-panel-menu.png distributor-logo.png

    [ ! -d ../status ] && mkdir ../status
    cd ../status
    for icon in $(find ../apps -type f -name 'gpm-*'); do
      mv $icon .
    done
    for icon in $(find . -type f -name 'gpm-primary*' -printf "%f\n"); do
      ln -s ../../$size/status/$icon ${icon/primary/battery}
    done
    ln -s ../../$size/status/gpm-primary-080-charging.png battery-good-charging.png
    ln -s ../../$size/status/gpm-primary-100-charging.png battery-full-charging.png
    ln -s ../../$size/status/gpm-primary-100-charged.png battery-full-charged.png
    ln -s ../../$size/status/gpm-primary-100.png battery-full.png
    ln -s ../../$size/status/gpm-primary-missing.png battery-missing.png
    ln -s ../../$size/status/gpm-primary-080.png battery-good.png
    ln -s ../../$size/status/gpm-primary-020.png battery-low.png
    ln -s ../../$size/status/gpm-primary-010.png battery-empty.png
    ln -s ../../$size/status/gpm-primary-020-charging.png battery-low-charging.png
    if [ -f ../stock/printer-broken.png ]; then
        ln -s ../../$size/stock/printer-broken.png battery-caution-charging.png
        ln -s ../../$size/stock/printer-broken.png battery-caution.png
    fi

    [ ! -d ../actions ] && mkdir ../actions
    cd ../actions
    [ -f connect_no.png ] && ln -s ../../$size/actions/connect_no.png system-shutdown.png
    [ -f ../status/gpm-hibernate.png ] && mv ../status/gpm-hibernate.png .
    [ -f ../status/gpm-suspend.png ] && mv ../status/gpm-suspend.png .
    ln -s ../../$size/apps/gnome-searchtool.png system-search.png
    ln -s ../../$size/apps/gnome-run.png system-run.png

    cd ../apps
    [ -f ../status/gpm-ac-adapter ] && mv ../status/gpm-ac-adapter.png .
    [ -f ../status/gpm-brightness.png ] && mv ../status/gpm-brightness.png .
    rm icon-system-settings.png
    ln -s ../../$size/apps/preferences-desktop-wallpaper.png icon-system-settings.png
    ln -s ../../$size/apps/file-manager.png caja.png
    ln -s ../../$size/apps/file-manager.png system-file-manager.png
    ln -s ../../$size/mimetypes/user-home.png caja_home.png
    ln -s ../../$size/apps/gdm.png lightdm-gtk-greeter-settings.png
    ln -s ../../$size/apps/icon-network-systems.png mate-network-properties.png
    ln -s ../../$size/apps/gnome-grecord.png multimedia-volume-control.png
    ln -s ../../$size/status/gpm-primary-100-charging.png mate-power-manager.png
    ln -s ../../$size/apps/gnome-ccwindowmanager.png preferences-system-windows.png
    ln -s ../../$size/apps/display-capplet.png mate-preferences-desktop-display.png
    ln -s ../../$size/apps/display-capplet.png preferences-desktop-display.png
    ln -s ../../$size/apps/display-capplet.png display.png
    ln -s ../../$size/apps/gnome-run.png mate-run.png
    ln -s ../../$size/apps/gnome-ccperiph.png preferences-desktop-peripherals.png
    ln -s ../../$size/apps/gaim.png mate-notification-properties.png
    ln -s ../../$size/apps/gnome-settings-keybindings.png preferences-desktop-keyboard-shortcuts.png
    ln -s ../../$size/apps/500_setup.png preferences-desktop-default-applications.png
    ln -s ../../$size/apps/gnome-panel.png mozo.png
    ln -s ../../$size/apps/gnome-panel.png alacarte.png
    ln -s ../../$size/apps/gnome-panel.png mate-panel.png
    ln -s ../../$size/apps/gnome-log.png mate-system-log.png
    ln -s ../../$size/apps/gnome-session.png mate-session-properties.png
    ln -s ../../$size/apps/icon-user-id.png user-info.png
    ln -s ../../$size/apps/gnome-color-xterm.png utilities-terminal.png
    ln -s ../../$size/apps/utilities-system-monitor.png mate-power-statistics.png
    ln -s ../../$size/apps/accessories-text-editor.png emacs.png
    ln -s ../../$size/apps/email.png thunderbird.png
    ln -s ../../$size/apps/galeon.png firefox.png
    if [ "$size" != "36x36" ]; then
        cp openofficeorg-writer.png libreoffice-writer.png
        cp openofficeorg-calc.png libreoffice-calc.png
        cp openofficeorg-math.png libreoffice-math.png
        cp openofficeorg-base.png libreoffice-base.png
        cp openofficeorg-impress.png libreoffice-impress.png
        cp openofficeorg-draw.png libreoffice-draw.png
    fi
    ln -s ../../$size/apps/gpm-brightness.png mate-brightness-applet.png
    ln -s ../../$size/apps/gnome-clock.png mate-panel-clock.png
    ln -s ../../$size/apps/icon-launcher.png mate-panel-launcher.png
    ln -s ../../$size/apps/icon-memory-profile.png mate-cpu-frequency-applet.png
    ln -s ../../$size/apps/icon-traceroute.png mate-netspeed-applet.png
    ln -s ../../$size/apps/gnome-ccwindowmanager.png mate-panel-window-menu.png
    ln -s ../../$size/apps/gnome-ccwindowmanager.png mate-panel-window-list.png
    ln -s ../../$size/apps/utilities-system-monitor.png mate-invest-applet.png
    ln -s ../../$size/apps/display-capplet.png mate-panel-workspace-switcher.png
    ln -s ../../$size/actions/gpm-suspend.png mate-inhibit-applet.png
    if [ -d ../stock ]; then
        ln -s ../../$size/stock/panel-launcher.png applications-science.png
        ln -s ../../$size/stock/panel-launcher.png package_science.png
        ln -s ../../$size/stock/panel-drawer.png mate-panel-drawer.png
        ln -s ../../$size/stock/panel-amusements.png mate-eyes-applet.png
        ln -s ../../$size/stock/panel-amusements.png mate-panel-fish.png
        ln -s ../../$size/stock/dialog-information.png mate-panel-notification-area.png
        ln -s ../../$size/stock/dialog-cancel.png mate-panel-force-quit.png
    fi

    [ ! -d ../devices ] && mkdir ../devices
    cd ../devices
    ln -s ../../$size/apps/gpm-ac-adapter.png ac-adapter.png
    ln -s ../../$size/status/gpm-primary-100-charging.png battery.png
  done

  for size in 16x16 24x24 48x48 96x96; do
    cd $srcdir/usr/share/icons/BluecurveRH/$size/mimetypes
    cp openofficeorg-drawing.png libreoffice-drawing.png
    cp openofficeorg-presentation-template.png libreoffice-presentation-template.png
    cp openofficeorg-oasis-text-template.png libreoffice-oasis-text-template.png
    cp openofficeorg-presentation.png libreoffice-presentation.png
    cp openofficeorg-spreadsheet-template.png libreoffice-spreadsheet-template.png
    cp openofficeorg-oasis-drawing.png libreoffice-oasis-drawing.png
    cp openofficeorg-oasis-text.png libreoffice-oasis-text.png
    cp openofficeorg-oasis-web-template.png libreoffice-oasis-web-template.png
    cp openofficeorg-oasis-spreadsheet.png libreoffice-oasis-spreadsheet.png
    cp openofficeorg-oasis-presentation.png libreoffice-oasis-presentation.png
    cp openofficeorg-text-template.png libreoffice-text-template.png
    cp openofficeorg-oasis-master-document.png libreoffice-oasis-master-document.png
    cp openofficeorg-spreadsheet.png libreoffice-spreadsheet.png
    cp openofficeorg-text.png libreoffice-text.png
    cp openofficeorg-drawing-template.png libreoffice-drawing-template.png
    cp openofficeorg-oasis-drawing-template.png libreoffice-oasis-drawing-template.png
    cp openofficeorg-oasis-spreadsheet-template.png libreoffice-oasis-spreadsheet-template.png
    cp openofficeorg-oasis-presentation-template.png libreoffice-oasis-presentation-template.png
  done
}

package() {
  install -d -m755 $pkgdir/usr/share/icons
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  cd $srcdir/usr/share/doc/$pkgname
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 AUTHORS $pkgdir/usr/share/licenses/$pkgname/AUTHORS

  cp -R $srcdir/usr/share/icons/BluecurveRH $pkgdir/usr/share/icons/
}
