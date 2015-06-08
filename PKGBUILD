# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=synergy-fixed
_pkgname=synergy
pkgver=1.7.3
pkgrel=2
pkgdesc="Share a single mouse and keyboard between multiple computers. (nulljobbuildup fixed)"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'crypto++' 'libxkbcommon-x11' 'avahi')
makedepends=('python2' 'libxt' 'cmake' 'qt5-base' 'unzip')
optdepends=('qt5-base: gui support')
license=('GPL2')
provides=("synergy=${pkgver}")
conflicts=('synergy')
source=("https://github.com/synergy/synergy/archive/v${pkgver}-stable.tar.gz"
        "socketmultiplexer.patch"
        "synergys.socket"
        "synergys.service")
md5sums=('cb8dfa78f87b9daa2d7abe480e55288a'
         'b9fd9f3faa673dfa30b924b120e16c12'
         '58f48336836d6faf3d5eecbe4155b77e'
         'b95e4b83d8a19c0bd81a15280078fcd5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-stable"

  # http://synergy-foss.org/spit/issues/details/2935/
  patch -Np1 <"${srcdir}/socketmultiplexer.patch"

  python2 hm.py conf -g 1

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="${CXXFLAGS} -pthread" .
  make -j1

  cd src/gui
  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-stable"

  # install binary
  install -Dm755 "bin/synergy" "${pkgdir}/usr/bin/synergy"
  install -Dm755 "bin/synergyc" "${pkgdir}/usr/bin/synergyc"
  install -Dm755 "bin/synergys" "${pkgdir}/usr/bin/synergys"
  install -Dm755 "bin/syntool" "${pkgdir}/usr/bin/syntool"

  # install config
  install -Dm644 "doc/${_pkgname}.conf.example" "${pkgdir}/etc/${_pkgname}.conf.example"
  install -Dm644 "doc/${_pkgname}.conf.example-advanced" "${pkgdir}/etc/${_pkgname}.conf.example-advanced"
  install -Dm644 "doc/${_pkgname}.conf.example-basic" "${pkgdir}/etc/${_pkgname}.conf.example-basic"

  # install manfiles
  install -Dm644 "doc/${_pkgname}c.man" "${pkgdir}/usr/share/man/man1/${_pkgname}c.1"
  install -Dm644 "doc/${_pkgname}s.man" "${pkgdir}/usr/share/man/man1/${_pkgname}s.1"

  # install systemd service and socket
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/synergys.service" "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/synergys.socket" "$pkgdir/usr/lib/systemd/system/"

  # install desktop/icon stuff
  install -Dm644 "res/synergy.ico" "${pkgdir}/usr/share/icons/${_pkgname}.ico"
  install -Dm644 "res/synergy.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
