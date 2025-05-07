# Maintainer: hodasemi <michaelh.95 at t-online dot de>
# Maintainer: wheaney <wayne at xronlinux dot com>
_pkgbase=breezy-desktop
pkgname="${_pkgbase}"-gnome-git
pkgver=2.1.6
pkgrel=1
pkgdesc="Breezy GNOME - XR desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/wheaney/breezy-desktop"
license=('GPL-3.0')
makedepends=('ninja' 'meson' 'librsvg')
depends=('gtk4' 'python' 'python-pydbus' 'python-yaml' 'python-gobject' 'gnome-shell>=45.0' 'xr-driver-git>=2.0.0' 'libadwaita' 'gst-python' 'gst-plugin-pipewire')
source=("git+${url}#commit=53afe9e71dba583277ca487a25b77a01164d6567")
md5sums=(SKIP)

_uuid="breezydesktop@xronlinux.com"

prepare() {
  USER=${SUDO_USER:-$USER}
  if [ -n "$USER" ]; then
    USER_HOME=$(getent passwd $USER | cut -d: -f6)
    if [ -e "$USER_HOME/.local/bin/breezy_gnome_uninstall" ]; then
      echo "Please uninstall Breezy Desktop first using $USER_HOME/.local/bin/breezy_gnome_uninstall, then reattempt the AUR installation"
      exit 1
    fi
  fi
}

build() {
    cd ${_pkgbase}

    # init submodules (only required ones)
    git submodule update --init --recursive modules/sombrero
    git submodule update --init --recursive ui/modules/PyXRLinuxDriverIPC

    # build binaries
    cd ui
    meson setup build
    cd build
    meson compile

    # prepare extension
    cd ../..
    unlink gnome/src/schemas/com.xronlinux.BreezyDesktop.gschema.xml
    cp ui/data/com.xronlinux.BreezyDesktop.gschema.xml gnome/src/schemas/
    glib-compile-schemas --targetdir="gnome/src/schemas" "gnome/src/schemas"

    unlink gnome/src/textures/custom_banner.png
    cp vulkan/custom_banner.png gnome/src/textures/

    unlink gnome/src/textures/calibrating.png
    cp modules/sombrero/calibrating.png gnome/src/textures/

    unlink gnome/src/Sombrero.frag
    cp modules/sombrero/Sombrero.frag gnome/src/

    # create icon
    rsvg-convert ui/data/icons/hicolor/scalable/apps/com.xronlinux.BreezyDesktop.svg -w 64 -h 64 -o ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_64.png
    rsvg-convert ui/data/icons/hicolor/scalable/apps/com.xronlinux.BreezyDesktop.svg -w 128 -h 128 -o ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_128.png
    rsvg-convert ui/data/icons/hicolor/scalable/apps/com.xronlinux.BreezyDesktop.svg -w 256 -h 256 -o ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_256.png
    rsvg-convert ui/data/icons/hicolor/scalable/apps/com.xronlinux.BreezyDesktop.svg -w 1024 -h 1024 -o ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_1024.png
}

package() {
    # copy gnome extension
    install -Dm755 ${_pkgbase}/ui/data/com.xronlinux.BreezyDesktop.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/com.xronlinux.BreezyDesktop.gschema.xml

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
    cp -r ${_pkgbase}/gnome/src/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"

    # copy binaries
    install -d "${pkgdir}"/usr/local/share/breezydesktop/breezydesktop/
    cp -r ${_pkgbase}/ui/src/*.py "${pkgdir}"/usr/local/share/breezydesktop/breezydesktop/
    install -d "${pkgdir}"/usr/local/share/locale/
    cp -r ${_pkgbase}/ui/po/mo/* "${pkgdir}"/usr/local/share/locale/
    install -Dm755 ${_pkgbase}/ui/modules/PyXRLinuxDriverIPC/xrdriveripc.py "${pkgdir}"/usr/local/share/breezydesktop/breezydesktop/xrdriveripc.py

    install -Dm755 ${_pkgbase}/ui/build/src/breezydesktop "${pkgdir}"/usr/bin/breezydesktop
    install -Dm755 ${_pkgbase}/ui/build/src/virtualdisplay "${pkgdir}"/usr/bin/virtualdisplay

    install -Dm755 ${_pkgbase}/ui/build/src/breezydesktop.gresource "${pkgdir}"/usr/local/share/breezydesktop/breezydesktop.gresource
    install -Dm755 ${_pkgbase}/ui/build/data/com.xronlinux.BreezyDesktop.desktop "${pkgdir}"/usr/share/applications/com.xronlinux.BreezyDesktop.desktop
    sed -i '/Exec/c\Exec=env APPDIR=/usr/local/share BINDIR=/usr/bin breezydesktop --skip-verification' "${pkgdir}"/usr/share/applications/com.xronlinux.BreezyDesktop.desktop

    install -Dm755 ${_pkgbase}/ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/com.xronlinux.BreezyDesktop.png
    install -Dm755 ${_pkgbase}/ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/com.xronlinux.BreezyDesktop.png
    install -Dm755 ${_pkgbase}/ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/com.xronlinux.BreezyDesktop.png
    install -Dm755 ${_pkgbase}/ui/data/icons/hicolor/com.xronlinux.BreezyDesktop_1024.png "${pkgdir}"/usr/share/icons/hicolor/1024x1024/apps/com.xronlinux.BreezyDesktop.png
}

