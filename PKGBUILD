# Maintainer: Étienne Deparis <etienne@depar.is>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=bluecurve-icon-theme
pkgver=8.0.2
pkgrel=23
_md5=3a3ecac0922f964bb1c4be617e8dec37

pkgdesc="Red Hat Icons from Fedora 10"
arch=('any')
url="https://fedorahosted.org/bluecurve/"
license=('GPL')
groups=('redhat-artwork')
makedepends=('python')
optdepends=('gnome-icon-theme: for inheriting missing icons')
conflicts=('xcursor-bluecurve')
options=(!emptydirs)

source=("https://src.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.bz2/${_md5}/$pkgname-$pkgver.tar.bz2")
md5sums=("$_md5")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Call upstream make"
  ./configure --prefix="$pkgdir/usr"
  make

  cd theme

  msg2 "Remove now useless Make files"

  for theme in Bluecurve Bluecurve-inverse LBluecurve LBluecurve-inverse; do
    find . -type f -name "Makefile*" -exec rm {} \;
    find . -type f -name "*.in" -exec rm {} \;
    find . -type f -name "*.icon" -exec rm {} \;
  done

  cd Bluecurve

  msg2 "Patch index.theme and symlink.manifest"

  sed -i "s/^Context=FileSystems$/Context=Places/" index.theme
  sed -i "s|^\[\(.*\)/status\]$|[\1/status]\nContext=Status|" index.theme
  sed -i "/^[0-9x]*\/apps\/icon-system-settings.png /d" symlink.manifest

  for size in 16x16 20x20 24x24 32x32 36x36 48x48 64x64 96x96; do
    for folder in actions devices filesystems status; do
      [ ! -d "$size/$folder" ] && mkdir "$size/$folder"
    done
    for icon in $(find "$size/apps" -type f -name 'gpm-*'); do
      mv $icon $size/status/
    done
    [ -f "$size/status/gpm-hibernate.png" ] && mv $size/status/gpm-hibernate.png $size/actions/
    [ -f "$size/status/gpm-suspend.png" ] && mv $size/status/gpm-suspend.png $size/actions/
    [ -f "$size/status/gpm-ac-adapter" ] && mv $size/status/gpm-ac-adapter.png $size/apps/
    [ -f "$size/status/gpm-brightness.png" ] && mv $size/status/gpm-brightness.png $size/apps/

    ## Uncomment the following lines to use the Red Hat logo instead of
    ## default gnome foot
    # echo "$size/filesystems/start-here.png ../apps/redhat-icon-panel-menu.png" >> symlink.manifest
    # echo "$size/filesystems/distributor-logo.png ../apps/redhat-icon-panel-menu.png" >> symlink.manifest
    ## Uncomment the following lines for some more customization
    # echo "$size/apps/thunderbird.png email.png" >> symlink.manifest
    # echo "$size/apps/firefox.png galeon.png" >> symlink.manifest
    # echo "$size/apps/cliqz.png galeon.png" >> symlink.manifest
    # echo "$size/apps/chromium.png galeon.png" >> symlink.manifest
    echo "$size/filesystems/user-desktop.png ../apps/desktop.png" >> symlink.manifest
    echo "$size/filesystems/network-server.png ../apps/icon-network-systems.png" >> symlink.manifest
    echo "$size/filesystems/network-workgroup.png ../apps/icon-network-systems.png" >> symlink.manifest
    echo "$size/filesystems/network-wired.png ../apps/applications-internet.png" >> symlink.manifest
    echo "$size/status/battery-good-charging.png gpm-primary-080-charging.png" >> symlink.manifest
    echo "$size/status/battery-full-charging.png gpm-primary-100-charging.png" >> symlink.manifest
    echo "$size/status/battery-full-charged.png gpm-primary-100-charged.png" >> symlink.manifest
    echo "$size/status/battery-full.png gpm-primary-100.png" >> symlink.manifest
    echo "$size/status/battery-missing.png gpm-primary-missing.png" >> symlink.manifest
    echo "$size/status/battery-good.png gpm-primary-080.png" >> symlink.manifest
    echo "$size/status/battery-low.png gpm-primary-020.png" >> symlink.manifest
    echo "$size/status/battery-empty.png gpm-primary-010.png" >> symlink.manifest
    echo "$size/status/battery-low-charging.png gpm-primary-020-charging.png" >> symlink.manifest
    echo "$size/actions/system-shutdown.png connect_no.png" >> symlink.manifest
    echo "$size/actions/system-search.png ../apps/gnome-searchtool.png" >> symlink.manifest
    echo "$size/actions/system-run.png ../apps/gnome-run.png" >> symlink.manifest
    echo "$size/apps/icon-system-settings.png icon-settings.png" >> symlink.manifest
    echo "$size/apps/caja.png file-manager.png" >> symlink.manifest
    echo "$size/apps/system-file-manager.png file-manager.png" >> symlink.manifest
    echo "$size/apps/caja_home.png ../mimetypes/user-home.png" >> symlink.manifest
    echo "$size/apps/lightdm-gtk-greeter-settings.png gdm.png" >> symlink.manifest
    echo "$size/apps/mate-network-properties.png icon-network-systems.png" >> symlink.manifest
    echo "$size/apps/multimedia-volume-control.png gnome-grecord.png" >> symlink.manifest
    echo "$size/apps/mate-power-manager.png ../status/gpm-primary-100-charging.png" >> symlink.manifest
    echo "$size/apps/preferences-system-windows.png gnome-ccwindowmanager.png" >> symlink.manifest
    echo "$size/apps/mate-preferences-desktop-display.png display-capplet.png" >> symlink.manifest
    echo "$size/apps/preferences-desktop-screensaver.png icon-xscreensaver.png" >> symlink.manifest
    echo "$size/apps/preferences-desktop-display.png display-capplet.png" >> symlink.manifest
    echo "$size/apps/display.png display-capplet.png" >> symlink.manifest
    echo "$size/apps/mate-run.png gnome-run.png" >> symlink.manifest
    echo "$size/apps/preferences-desktop-peripherals.png gnome-ccperiph.png" >> symlink.manifest
    echo "$size/apps/mate-notification-properties.png gaim.png" >> symlink.manifest
    echo "$size/apps/preferences-desktop-keyboard-shortcuts.png gnome-settings-keybindings.png" >> symlink.manifest
    echo "$size/apps/preferences-desktop-default-applications.png 500_setup.png" >> symlink.manifest
    echo "$size/apps/applications-other.png 500_setup.png" >> symlink.manifest
    echo "$size/apps/mozo.png gnome-panel.png" >> symlink.manifest
    echo "$size/apps/alacarte.png gnome-panel.png" >> symlink.manifest
    echo "$size/apps/mate-panel.png gnome-panel.png" >> symlink.manifest
    echo "$size/apps/mate-system-log.png gnome-log.png" >> symlink.manifest
    echo "$size/apps/mate-session-properties.png gnome-session.png" >> symlink.manifest
    echo "$size/apps/user-info.png icon-user-id.png" >> symlink.manifest
    echo "$size/apps/utilities-terminal.png gnome-color-xterm.png" >> symlink.manifest
    echo "$size/apps/mate-power-statistics.png utilities-system-monitor.png" >> symlink.manifest
    echo "$size/apps/emacs.png accessories-text-editor.png" >> symlink.manifest
    echo "$size/apps/nitrogen.png preferences-desktop-wallpaper.png" >> symlink.manifest
    echo "$size/apps/gajim.png gaim.png" >> symlink.manifest
    echo "$size/apps/glade.png glade-2.png" >> symlink.manifest
    echo "$size/apps/zeal.png accessories-dictionary.png" >> symlink.manifest
    echo "$size/apps/net.poedit.Poedit.png preferences-desktop-locale.png" >> symlink.manifest
    echo "$size/apps/org.gnome.seahorse.Application.png icon-security-keys.png" >> symlink.manifest
    echo "$size/apps/org.gnome.SimpleScan.png ../mimetypes/scanner.png" >> symlink.manifest
    echo "$size/apps/libreoffice-startcenter.png applications-office.png" >> symlink.manifest
    echo "$size/apps/libreoffice-writer.png openofficeorg-writer.png" >> symlink.manifest
    echo "$size/apps/libreoffice-calc.png openofficeorg-calc.png" >> symlink.manifest
    echo "$size/apps/libreoffice-math.png openofficeorg-math.png" >> symlink.manifest
    echo "$size/apps/libreoffice-base.png openofficeorg-base.png" >> symlink.manifest
    echo "$size/apps/libreoffice-impress.png openofficeorg-impress.png" >> symlink.manifest
    echo "$size/apps/libreoffice-draw.png openofficeorg-draw.png" >> symlink.manifest
    echo "$size/apps/mate-brightness-applet.png gpm-brightness.png" >> symlink.manifest
    echo "$size/apps/mate-panel-clock.png gnome-clock.png" >> symlink.manifest
    echo "$size/apps/mate-panel-launcher.png icon-launcher.png" >> symlink.manifest
    echo "$size/apps/mate-cpu-frequency-applet.png icon-memory-profile.png" >> symlink.manifest
    echo "$size/apps/mate-netspeed-applet.png icon-traceroute.png" >> symlink.manifest
    echo "$size/apps/mate-panel-window-menu.png gnome-ccwindowmanager.png" >> symlink.manifest
    echo "$size/apps/mate-panel-window-list.png gnome-ccwindowmanager.png" >> symlink.manifest
    echo "$size/apps/mate-invest-applet.png utilities-system-monitor.png" >> symlink.manifest
    echo "$size/apps/mate-panel-workspace-switcher.png display-capplet.png" >> symlink.manifest
    echo "$size/apps/mate-inhibit-applet.png ../actions/gpm-suspend.png" >> symlink.manifest
    echo "$size/devices/ac-adapter.png ../apps/gpm-ac-adapter.png" >> symlink.manifest
    echo "$size/devices/battery.png ../status/gpm-primary-100-charging.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-drawing.png openofficeorg-drawing.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-presentation-template.png openofficeorg-presentation-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-text-template.png openofficeorg-oasis-text-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-presentation.png openofficeorg-presentation.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-spreadsheet-template.png openofficeorg-spreadsheet-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-drawing.png openofficeorg-oasis-drawing.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-text.png openofficeorg-oasis-text.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-web-template.png openofficeorg-oasis-web-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-spreadsheet.png openofficeorg-oasis-spreadsheet.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-presentation.png openofficeorg-oasis-presentation.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-text-template.png openofficeorg-text-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-master-document.png openofficeorg-oasis-master-document.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-spreadsheet.png openofficeorg-spreadsheet.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-text.png openofficeorg-text.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-drawing-template.png openofficeorg-drawing-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-drawing-template.png openofficeorg-oasis-drawing-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-spreadsheet-template.png openofficeorg-oasis-spreadsheet-template.png" >> symlink.manifest
    echo "$size/mimetypes/libreoffice-oasis-presentation-template.png openofficeorg-oasis-presentation-template.png" >> symlink.manifest
    for icon in $(find $size/status -type f -name 'gpm-primary*' -printf "%f\n"); do
      echo "$size/status/${icon/primary/battery} $icon" >> symlink.manifest
    done
    if [ -d $size/stock ]; then
      echo "$size/apps/applications-science.png ../stock/panel-launcher.png" >> symlink.manifest
      echo "$size/apps/package_science.png ../stock/panel-launcher.png" >> symlink.manifest
      echo "$size/apps/mate-panel-drawer.png ../stock/panel-drawer.png" >> symlink.manifest
      echo "$size/apps/mate-eyes-applet.png ../stock/panel-amusements.png" >> symlink.manifest
      echo "$size/apps/mate-panel-fish.png ../stock/panel-amusements.png" >> symlink.manifest
      echo "$size/apps/mate-panel-notification-area.png ../stock/dialog-information.png" >> symlink.manifest
      echo "$size/apps/mate-panel-force-quit.png ../stock/dialog-cancel.png" >> symlink.manifest
      echo "$size/status/battery-caution-charging.png ../stock/printer-broken.png" >> symlink.manifest
      echo "$size/status/battery-caution.png ../stock/printer-broken.png" >> symlink.manifest
    fi
  done

  msg2 "Apply symlink.manifest"

  cat > read_manifest.py <<PYSCRIPT
import os

manifest = []
with open('symlink.manifest') as f:
    manifest = f.readlines()
curpwd = os.getcwd()
for linkdata in manifest:
    link = linkdata.strip().split(' ')
    if link[1].endswith('.icon'):
       continue
    goto = os.path.dirname(link[0])
    target = os.path.basename(link[0])
    try:
        os.chdir(goto)
        if not os.path.exists(link[1]):
            raise FileNotFoundError(
                "[Errno 2] No such file or directory: '{}'".format(link[1])
            )
        os.symlink(link[1], target)
    except FileExistsError as e:
        print(e)
    except FileNotFoundError as e:
        # print("{} in {}".format(str(e), os.getcwd()))
        pass
    os.chdir(curpwd)
PYSCRIPT
  python read_manifest.py
  rm read_manifest.py symlink.manifest

  # Remove broken links if any
  find -L . -type l -exec rm {} \;

}

package() {
  install -d -m755 $pkgdir/usr/share/icons
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  cd $srcdir/$pkgname-$pkgver

  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 AUTHORS $pkgdir/usr/share/licenses/$pkgname/AUTHORS

  for theme in Bluecurve Bluecurve-inverse LBluecurve LBluecurve-inverse; do
    cp -R theme/$theme $pkgdir/usr/share/icons/
  done
}

# Local Variables:
# sh-basic-offset: 2
# End:
