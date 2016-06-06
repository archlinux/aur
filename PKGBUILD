# Maintainer: Patric Schmitz <bzk0711@aol.com>
# Ported from the synergy-git AUR package

_pkgname=synergy
pkgname=$_pkgname-1.6
pkgver=1.6.3
pkgrel=1
pkgdesc='Synergy upstream 1.6 branch. 1.7.x is very unstable on Linux.'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
depends=('libxtst' 'qt5-base' 'avahi')
makedepends=('libxt' 'cmake' 'unzip')
optdepends=(
  'openssl: encryption support'
)
license=('GPL2')
source=(
  "https://github.com/symless/synergy/archive/1.6.3-final.tar.gz"
  "${_pkgname}s_at.socket"
  "${_pkgname}s_at.service"
  'missing-include-fix.patch'
  'c++11-noexcept-destructor-fix.patch'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
sha512sums=('8af7a920cb38f0bf057f005d612317fc81f937f74bff49aaf85e95559548d8a85de968e5f55690382ac2e133e0e6c3ae61c94156fc97a8f075956a7803db0825'
            'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
            'e85cc3452bb8ba8fcccb1857386c77eb1e4cabb149a1c492c56b38e1b121ac0e7d96c6fcbd3c9b522d3a4ae9d7a9974f4a89fc32b02a56f665be92af219e371c'
            '679cc88794d2ef65325ef93f1034f465824efeb2f01521eda7050556c1200df31abf9b5d055b9438d24f040c234d37b74c489e4db6acbf15a2e7fec8e1da226d'
            'e9bb015240421ba49478f124a627f82f6d4623bfbb77a498d8682ab3ee02a0e96c1f332fae0ea5e212c37528a404e9d6aa05e03e0d0277fa87dbbfa742036991')

prepare() {
  cd $_pkgname-1.6.3-final

  patch -p1 < ../missing-include-fix.patch

  cd ext
  unzip -o gmock-1.6.0.zip -d gmock-1.6.0
  unzip -o gtest-1.6.0.zip -d gtest-1.6.0
  unzip -o cryptopp562.zip -d cryptopp562

  patch -p2 < ../../c++11-noexcept-destructor-fix.patch
}

build() {
  cd $_pkgname-1.6.3-final

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make

  cd src/gui
  qmake
  make
}

package() {
  # install systemd service and socket
  install -Dm644 ${_pkgname}s_at.service "$pkgdir/usr/lib/systemd/system/${_pkgname}s@.service"
  install -Dm644 ${_pkgname}s_at.socket "$pkgdir/usr/lib/systemd/system/${_pkgname}s@.socket"

  cd $_pkgname-1.6.3-final

  # install binary
  install -Dm755 bin/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 bin/${_pkgname}c "$pkgdir/usr/bin/${_pkgname}c"
  install -Dm755 bin/${_pkgname}d "$pkgdir/usr/bin/${_pkgname}d"
  install -Dm755 bin/${_pkgname}s "$pkgdir/usr/bin/${_pkgname}s"
  install -Dm755 bin/syntool "$pkgdir/usr/bin/syntool"
  install -Dm755 bin/u$_pkgname "$pkgdir/usr/bin/u$_pkgname"

  # install config
  install -Dm644 doc/$_pkgname.conf.example "$pkgdir/etc/$_pkgname.conf.example"
  install -Dm644 doc/$_pkgname.conf.example-advanced "$pkgdir/etc/$_pkgname.conf.example-advanced"
  install -Dm644 doc/$_pkgname.conf.example-basic "$pkgdir/etc/$_pkgname.conf.example-basic"

  # install manfiles
  install -Dm644 doc/${_pkgname}c.man "$pkgdir/usr/share/man/man1/${_pkgname}c.1"
  install -Dm644 doc/${_pkgname}s.man "$pkgdir/usr/share/man/man1/${_pkgname}s.1"

  # install desktop/icon stuff
  install -Dm644 res/$_pkgname.ico "$pkgdir/usr/share/icons/$_pkgname.ico"
  install -Dm644 res/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
