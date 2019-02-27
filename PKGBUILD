# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>
# Contributor: phi-mah

pkgname=toggldesktop
pkgver=7.4.347
pkgrel=1
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl/toggldesktop"
license=('BSD')
depends=('libxss'
         'qt5-base'
         'qt5-webengine'
         'qt5-x11extras'
         'openssl'
         'poco'
         'lua'
         'jsoncpp'
         )
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/toggl/toggldesktop/archive/v${pkgver}.tar.gz"
        "production.patch"
        'jsoncpp.patch')

sha512sums=('d6dbbef0039f9f4b0e5a560d716cb1dcfb9e4d7bb2b590b89269e3cc1625a0e58ab73bbc5a8df852e420f6422aa031b47df5b6a3bf12e01fb07d5a4aca92a09e'
            '90ed77b0c2b6708c256e5f8fd74d37275cd85ccb81b6eeffa96f6adb22441b853386d6b16a157522d77820a032daf044917d2fb885a15502d218e3e48458e75a'
            '1b340bf5df760c47b0a8c7ba46c783ed2821ef4336d350a346782e74f0308ec96d350a6fe7acee59441f24b42ee55904095beba1162ac49de6418a7cfd139e63')

conflicts=('toggldesktop-bin' 'toggl-bin')

prepare() {
    cd "${pkgname}-${pkgver}"

    # patch to build for production
    # https://github.com/toggl/toggldesktop/wiki/Building-Toggl-Desktop-from-source-for-usage-with-live-servers
    patch -p1  < ../production.patch
    patch -p1  < ../jsoncpp.patch
}

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd "../${pkgname}-${pkgver}"

  # license file in standard location
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
