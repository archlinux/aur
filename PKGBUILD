# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>
# Contributor: Alessio 'Bl@ster' Biancalana <dottorblaster@gmail.com>

pkgname=docky
pkgver=2.2.1.1
pkgrel=4
pkgdesc="Full fledged dock application that makes opening common applications and managing windows easier and quicker"
url="https://launchpad.net/docky"
arch=('any')
license=('GPL')
depends=('gconf-sharp' 'gkeyfile-sharp' 'gnome-keyring-sharp' 'librsvg' 'libwnck' 'mono-addins' 'notify-sharp')
makedepends=('intltool' 'gio-sharp')
source=("https://launchpad.net/$pkgname/2.2/$pkgver/+download/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('E4884AEEDE4CC02043C3D8045DECDBA89270E723') # Rico Tzschichholz
sha256sums=('3759c052a375dea4ab462669896d92acc6eb497197dd5a73ff30527d668dfbc6'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver

  # Fix build
  sed -i 's/dmcs/mcs/' m4/shamrock/mono.m4

  # Fix weather docklet
  sed -i 's|http://xoap.weather.com/|http://wxdata.weather.com/|
          s|http://www.weather.com/outlook/travel/businesstraveler/wxdetail/|https://weather.com/weather/today/l/|
          s|"http://www.weather.com/outlook/travel/businesstraveler/map/" + location|"https://weather.com/weather/radar/interactive/l/" + WeatherController.EncodedCurrentLocation|' \
    StandardPlugins/Weather/src/Sources/WeatherChannelWeatherSource.cs
  sed -i '/GoogleWeatherSource/d' StandardPlugins/Weather/src/WeatherController.cs

  # Fix trash docklet
  sed -i -e '/"Restore Files"/d' -e 's/, (o, a) => RestoreFile (f)//' StandardPlugins/Trash/src/TrashDockItem.cs

  # Fix bookmarks docklet
  sed -i 's|".gtk-bookmarks"|".config/gtk-3.0/bookmarks"|' StandardPlugins/Bookmarks/src/BookmarksItemProvider.cs

  # Disable broken docklets and services
  sed -i -e '/BatteryMonitor/d' -e '/NetworkManager/d' -e '/NetworkMonitor/d' -e '/SessionManager/d' StandardPlugins/Makefile.am
  sed -i '/System.Initialize/d' Docky.Services/Docky.Services/DockServices.cs
  sed -i 's/NetworkConnected { get; private set; }/NetworkConnected = true;/' Docky.Services/Docky.Services/SystemService.cs

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
