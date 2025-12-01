# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.8
pkgrel=4
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui' 'kidletime5' 'kwin-x11' 'libcutefish' 'libxcb' 'libxcursor' 'libxtst' 'polkit-qt5')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'xf86-input-libinput' 'xf86-input-synaptics' 'xorg-server-devel')
optdepends=('appmenu-gtk-module: global menu support for some GTK3 applications')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        fix-build.patch
        0001-Allow-to-override-Qt-platformtheme.patch
        0001-Don-t-terminate-session-on-logout.patch
        0001-Start-kglobalacceld-on-login.patch
        0001-Load-mouse-and-touchpad-managers-only-on-X11.patch)
sha512sums=('e796e335f6465c6e68e3c533f38209206f2043f286aadd501a17180349cf4380fda604fbb32e1a13d541c34f8926785ed6a878a7bb1fb2691d546a99e82ab3ca'
            'acd45044e9742fa12fe3c47d63ee30141788f244b5a7db4a20a969db114e0a1b0161c3f34f63cd25c1447ae10599a5266b711500fbfc61050591a13b2a287537'
            '6f559a24c21f1637c70700dc5db445f8f0ad610062eddb368e30a0c6cc34a3f2381e4d55984439bac06a3b0b8852c24deb78a1028f2c456389475d9974092443'
            '7fa3dd01045f2797d418aa0827d92cc342460b6288aa6ae4b37a0e584b5d55be0666c978b8a7d3e9196d3ae662c1fd2ade4f6c832afb285c863c6c8a83004acc'
            '22cecefd88628bbef86af7cb637b91a691b5c4c44e2bfbb05fc7214dc12858594e13d3c477c88ca7a6727e63dc38c0cb5aa5efaf3d633eb916f825766c50f8c7'
            '691cac49dae557c329e437139bbf5e879be48b3b5e40ff6a2abd33397596a25f2412ae0cc96eee7e1a61551c58cae43fc50bea102000f8690789b592e16549ec')

prepare() {
  cd core-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Allow to override Qt platformtheme
  patch -p1 -i ../0001-Allow-to-override-Qt-platformtheme.patch

  # Don't terminate session on logout
  patch -p1 -i ../0001-Don-t-terminate-session-on-logout.patch

  # Start kglobalacceld on login
  patch -p1 -i ../0001-Start-kglobalacceld-on-login.patch

  # Load mouse and touchpad managers only on X11
  patch -p1 -i ../0001-Load-mouse-and-touchpad-managers-only-on-X11.patch

  # Disable layer effect when the Qt Quick software backend is used
  sed -i 's/layer\.enabled: true/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software/' shutdown-ui/main.qml

  # Don't enable appmenu-gtk-module in GTK settings, it's not needed
  sed -i '/writeGtk2Settings();/d
          /writeGtk3Settings();/d' gmenuproxy/menuproxy.cpp

  # Don't overwrite GTK3 and Fontconfig settings
  sed -i '/updateGtk3Config();/d
          /updateFontConfig();/d' settings-daemon/theme/thememanager.cpp
}

build() {
  cmake -G Ninja -B build -S core-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  cmake --build build --target translations
  cmake --build build --target notificationd_translations
  cmake --build build --target polkit-agent-translations
  cmake --build build --target shutdown-translations
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
