# Maintainer: Xinc

pkgname=unity
pkgver=7.6.0
pkgrel=1
pkgdesc="Main package for the Unity7 desktop"
url="https://gitlab.com/ubuntu-unity/unity"
arch=(x86_64)
license=(GPL)
optdepends=('doxygen: Documentation Support'
            'unity-hud: HUD Support for Unity7'
            'unity-control-center: not found yet'
            'unity-indicators-meta: not found yet'
            'unity-lens-meta: not found yet'
            'unity-session-migration: not found yet')
#unity-greeter: lack of dependencies
depends=(glew glewmx gtk-engine-murrine xcb-util-wm startup-notification libxtst dbus gnome-desktop gsettings-desktop-schemas xpathselect libxslt unity-asset-pool libxrender libxext libx11 gdk-pixbuf2 unity-language-pack unity-session-shortcuts libglvnd nemo gnome-session dconf at-spi2-atk libxi pango libxfixes libnotify cairo ido unity-settings-daemon nux gsettings-ubuntu-touch-schemas compiz bamf pam zeitgeist libunity-misc libunity libsigc++ libappindicator-gtk3 libdbusmenu-gtk3 json-glib dee atk appstream-glib)
makedepends=(gcc glibc systemd gtk3-ubuntu cmake ninja patch)
_commit=e7c90e4fad47878161fa9ba4a2aedacada624c1b
source=("git+https://gitlab.com/ubuntu-unity/unity/unity.git#commit=$_commit"
        unity-7.6.0-support-fixes.patch)
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd $pkgname
# Related to /etc/os-release NAME check #
  sed -i -e 's:"Ubuntu":"Arch Linux":' panel/PanelMenuView.cpp
# Change the name to Arch.
  sed -i -e 's/"Ubuntu Desktop"/"Arch Unity⁷ Desktop"/' panel/PanelMenuView.cpp
# see https://launchpad.net/bugs/974480 #
  sed -i -e "s/bool accept = FilterTray(title.Str(), res_name.Str(), res_class.Str());/bool accept = true;/" panel/PanelTray.cpp
# Setup Unity side launcher default applications #
  sed -i -e "s/org.gnome.Nautilus/nemo/" -e '/ubiquity/d' data/com.canonical.Unity.gschema.xml 
# Change ubuntu to unity #
  sed -i -e 's:SESSION=ubuntu:SESSION=unity:g' {data/unity7.conf.in,services/unity-panel-service.conf.in} 
  sed -i -e 's:ubuntu.session:unity.session:g' tools/{systemd,upstart}-prestart-check 
# Don't kill -9 unity-panel-service when launched using PANEL_USE_LOCAL_SERVICE env variable 
# It slows down the launch of unity-panel-service in lockscreen mode 
  sed -i -e '/killall -9 unity-panel-service/,+1 d' UnityCore/DBusIndicators.cpp 
# New stable boost 1.71 compatibility changes 
  sed -i -e 's:boost/utility.hpp:boost/next_prior.hpp:g' launcher/FavoriteStorePrivate.cpp 
# Apps launched from u-c-c need GTK_MODULES environment variable with unity-gtk-module value to use unity global/titlebar menu. Disable unity-gtk-module.service as it only sets dbus/systemd environment variable. We are providing xinit.d script to set GTK_MODULES environment variable to load unity-gtk-module (see unity-base/unity-gtk-module package)
  sed -i -e 's:unity-gtk-module.service ::' data/unity7.service.in 
# Don't use drop-down menu icon from Adwaita theme as it's too dark since v3.30 
  sed -i -e "s/go-down-symbolic/drop-down-symbolic/" decorations/DecorationsMenuDropdown.cpp 
# Fix build.ninja: lexing error #
  sed -i -e '/echo "/{s/"/\\"/g}' -e '/bzr log/{s/"/\\"/g}' -e 's/\\n/\\\\n/' CMakeLists.txt 
# Exp #1: Clean up pam file installation as used in lockscreen (LP# 1305440), provide own pam, see src_install 
# Exp #2: Disable recompiling GSettings schemas inside sandbox 
  sed -i -e "/(pam)/d" -e "/Compiling GSettings schemas/,+1 d" data/CMakeLists.txt   
  patch -Np1 -i ../../unity-7.6.0-support-fixes.patch
}

build() {
  cd $pkgname
# Tests will be disabled.
  cmake -B build -DCMAKE_INSTALL_LOCALSTATEDIR="${EPREFIX}/var" -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr" -DCMAKE_INSTALL_SYSCONFDIR="${EPREFIX}/etc" -DCOMPIZ_BUILD_WITH_RPATH=OF -DCOMPIZ_PACKAGING_ENABLED=ON -DCOMPIZ_PLUGIN_INSTALL_TYPE=package -DENABLE_UNIT_TESTS=OFF -DI18N_SUPPORT=ON -DUNITY_RELEASE="22.10 Kinetic" -Wno-dev -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
