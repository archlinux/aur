# Contributor: Patric Schmitz <bzk0711@aol.com>
# Ported from the synergy-git AUR package

_pkgname=synergy
pkgname=$_pkgname-1.6
pkgver=1.6.3
pkgrel=2
pkgdesc='Synergy upstream 1.6 branch. 1.7.x is very unstable on Linux.'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
depends=('libxtst' 'qt5-base' 'avahi')
makedepends=(
  'cmake'
  'libxt'
  'unzip'
)
optdepends=(
  'openssl: encryption support'
)
license=('GPL2')
source=(
  "${_pkgname}-${pkgver}.tar.gz"::"https://github.com/symless/synergy-core/archive/1.6.3-final.tar.gz"
  "${_pkgname}s.service"
  "${_pkgname}s.socket"
  'c++11-noexcept-destructor-fix.patch'
  'missing-include-fix.patch'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

sha256sums=(
  'affd151965f97d3338595331c9e976ab0371a74e96a382f89e9a3ad02a37ddba'
  '30460dfbb53116b13a2e8e665c34e04b5b8ece759ea9e56eccceaa2455ada1af'
  'aeb357ba161131524aa70a5303a17f78831c9a1ab17dbc7c97e4781a5c4bac44'
  'a14e1defabd30700ffe1616ea679e33e56a3baa601c8734c936783a641979b44'
  '2f766961d7a78dd283b8480571fd748aa1adde930928bcce91515b5eb440a8a9'
)

_pkgdir=synergy-core-1.6.3-final

prepare() {
  cd "${srcdir}/${_pkgdir}"

  patch -p1 < ../missing-include-fix.patch

  cd ext
  unzip -o gmock-1.6.0.zip -d gmock-1.6.0
  unzip -o gtest-1.6.0.zip -d gtest-1.6.0
  unzip -o cryptopp562.zip -d cryptopp562

  patch -p2 < ../../c++11-noexcept-destructor-fix.patch
}

build() {
  cd "${srcdir}/${_pkgdir}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS='-std=c++11' \
    .
  make

  cd src/gui
  qmake
  make
}

package() {
  cd "${srcdir}"

  # install systemd service and socket
  install -Dm644 "${_pkgname}s.service" -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 "${_pkgname}s.socket" -t "$pkgdir/usr/lib/systemd/user"

  cd "${srcdir}/${_pkgdir}"

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
