# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=RP-Soundboard
pkgname=teamspeak3-plugin-rp-soundboard
pkgver=1.4.1.1826
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Easy to use soundboard'
arch=('x86_64')
url="https://github.com/MGraefe/${_pkgname}"
license=('Unknown')
makedepends=('python' 'qt5-base' 'ffmpeg')
depends=('teamspeak3>=3.3.0')
source=("https://github.com/MGraefe/${_pkgname}/archive/refs/tags/${pkgver}_linux.tar.gz"
        'Updated_API_QT_5.10.patch'::'https://github.com/MGraefe/RP-Soundboard/commit/a7653d62fe84d71cdcddf4b614b1a0083fc2deec.patch'
        'build-fixes.patch')
sha256sums=('aa70fe9db89c404c3f11aafc508e1d2618123bae7085cc543c91c7333c68ff48'
            '339889edd44b10bf153d9bac083e92e73f886d1aa87fab1f5edd6d4ae9c19bc9'
            '2866dec7059697df0030968549b67faedd5af78636269e6d84334a722817c2db')

prepare() {
  cd "${_pkgname}-${pkgver}_linux"

  patch -p1 -i ../Updated_API_QT_5.10.patch
  patch -p1 -i ../build-fixes.patch

  rm -rf build
  mkdir build

  cd src/version
  python version.py
}

build() {
  cd "${_pkgname}-${pkgver}_linux/build"

  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_LIBRARY_PATH=/usr/lib

  make
}

package() {
  cd "${_pkgname}-${pkgver}_linux/build"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 librp_soundboard_linux_amd64.so "$pkgdir/opt/teamspeak3/plugins/librp_soundboard.so"
}

# vim:set ts=2 sw=2 et:
