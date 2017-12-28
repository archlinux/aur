# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>
# Contributor: Manolis Tzanidakis

pkgname=gkrellweather
pkgver=2.0.8
pkgrel=5
pkgdesc="A weather monitor plugin for gkrellm2"
arch=('i686' 'x86_64')
depends=('gkrellm' 'perl' 'wget' 'gtk2')
license=('GPL')
url="https://sites.google.com/site/makovick/gkrellm-plugins"
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('06236ad489151019e71bab4ba63b4b8b06d58c58890caed8b1a28fdd05cde16d')

prepare() {
  cd $pkgname-$pkgver
  old_url='http://weather.noaa.gov/pub/data/observations/metar/decoded'
  new_url='http://tgftp.nws.noaa.gov/data/observations/metar/decoded/'

  sed -i -e 's|/usr/local|/usr|' Makefile
  sed -i -e 's|PREFIX|"/usr/share/gkrellm"|' gkrellweather.c
  sed -i -e 's|/bin/GrabWeather|/GrabWeather|' gkrellweather.c
  sed -i -e "s|WeatherSrc = '$old_url'|WeatherSrc = '$new_url'|" GrabWeather
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 gkrellweather.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellweather.so"
  install -D -m755 GrabWeather "$pkgdir/usr/share/gkrellm/GrabWeather"
}

# vim: ts=2 sw=2 et ft=sh
