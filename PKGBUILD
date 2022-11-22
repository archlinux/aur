# Maintainer: Xinc

pkgname=unity-indicator-session
_actual_name=indicator-session
_actual_ver=17.3.20
_extra_ver=+21.10.20210613.1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Indicator showing session management, status and user switching used by the Unity7 user interface"
arch=(x86_64)
url="https://launchpad.net/indicator-session"
license=(GPL)
depends=(unity-settings-daemon dbus gnome-user-docs yelp glibc gsettings-desktop-schemas gnome-settings-daemon dconf libindicator-gtk3)
makedepends=(cmake-extras systemd glib2 ninja)
group=(unity-indicators-meta)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/indicator-session_${_actual_ver}${_extra_ver}.orig.tar.gz"
        unity-yelp.desktop)
sha512sums=('SKIP')

prepare() {
  sed -i -e 's:distro_name = g_strdup(value):distro_name = g_strdup(\"Unity\"):g' src/service.c
  sed -i -e 's:yelp:yelp help\:ubuntu-help:g' src/backend-dbus/actions.c
  sed -i '/gtk-update-icon-cache/,+1 d' data/icons/CMakeLists.txt
  # Remove dependency on whoopsie (Ubuntu's error submission tracker) 
  sed -i 's:libwhoopsie):):g' CMakeLists.txt || die
  for each in $(grep -ri whoopsie | awk -F: '{print $1}'); do
	  sed -i -e '/whoopsie/Id' "${each}"
  done
  sed -i "/add_subdirectory (po)/d" CMakeLists.txt
  sed -i -e "/enable_testing ()/d" -e "/add_subdirectory (tests)/d" CMakeLists.txt
}

build() {
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LOCALSTATEDIR=/var -DCMAKE_INSTALL_FULL_DATADIR=/usr/share -Wno-dev -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -t "$pkgdir"/usr/share/applications -Dm644 ../unity-yelp.desktop
}



