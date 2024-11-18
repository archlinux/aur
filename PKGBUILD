# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgbase=jack-audio-tools
pkgname=("$pkgbase-common" "$pkgbase-transport" "$pkgbase-lv2" "$pkgbase-carla" "$pkgbase-dbus")
pkgver=0.4.1
pkgrel=1
pkgdesc="A collection of utilities and tools for the JACK audio ecosystem."
arch=('any')
url="https://github.com/SpotlightKid/jack-audio-tools"
license=('MIT')
makedepends=(python-build python-installer python-wheel 'lv2' 'python-rtmidi' 'python-dbus' 'python-gobject')
depends=('jack' 'lilv' 'python-rdflib')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('030ea28165551f801d7c9170c1fd06da5fa7b0473d7c9d37f7bc4351b0955191')

build() {
  cd "$pkgbase-$pkgver"

  python -m build --wheel --no-isolation
}

package_jack-audio-tools-common() {
  cd "$pkgbase-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{lv2*,carxp2lv2presets,jack*}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{carla,lv2,transport,jackdbus}
}

package_jack-audio-tools-transport() {
  depends=('jack-audio-tools-common' 'python-rtmidi' 'python-jack-client')

  cd "$pkgbase-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{jack-dbus*,lv2*,carxp2lv2presets}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{carla,lv2,jackdbus}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}

package_jack-audio-tools-lv2() {
  depends=('jack-audio-tools-common' 'lv2' 'lilv')

  cd "$pkgbase-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{jack*,carxp2lv2presets}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{carla,transport,jackdbus}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}

package_jack-audio-tools-carla() {
  depends=('jack-audio-tools-common' 'carla' 'python-rdflib')

  cd "$pkgbase-$pkgver"

  python -m installer  --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{jack*,lv2*}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{transport,lv2,jackdbus}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}

package_jack-audio-tools-dbus() {
  depends=('jack-audio-tools-common' 'python-dbus' 'python-gobject' )

  cd "$pkgbase-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{*transport*,jack-timebase-master,lv2*,carxp2lv2presets}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{transport,lv2,carla}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}
