# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgbase=jack-audio-tools
pkgname=("$pkgbase-common" "$pkgbase-transport" "$pkgbase-lv2" "$pkgbase-carla")
pkgver=0.3.2
pkgrel=1
pkgdesc="A collection of utilities and tools for the JACK audio ecosystem."
arch=('any')
url="https://github.com/SpotlightKid/jack-audio-tools"
license=('MIT')
makedepends=('python-setuptools' 'lv2' 'python-rtmidi')
depends=('jack' 'lilv' 'python-rdflib')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('288de54dd783d4f37ebe754910166318f7efe9ac90ce2e41564ff366236526ec')

build() {
  cd "$pkgbase-$pkgver"

  python setup.py build

}

package_jack-audio-tools-common() {
  cd "$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{lv2*,carxp2lv2presets,jack*}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{carla,lv2,transport}
}

package_jack-audio-tools-transport() {
  depends=('jack-audio-tools-common' 'jack' 'python-rtmidi' 'python-jack-client')

  cd "$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{lv2*,carxp2lv2presets}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{carla,lv2}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}

package_jack-audio-tools-lv2() {
  depends=('jack-audio-tools-common' 'lv2' 'lilv')

  cd "$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{jack*,carxp2lv2presets}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{carla,transport}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}

package_jack-audio-tools-carla() {
  depends=('jack-audio-tools-common' 'carla' 'python-rdflib')

  cd "$pkgbase-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm $pkgdir/usr/bin/{jack*,lv2*}
  rm -r $pkgdir$site_packages/${pkgbase//-/}/{transport,lv2}
  rm -r $pkgdir$site_packages/${pkgbase//-/_}*
}
