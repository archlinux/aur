# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Michael Düll <mail@akurei.me>
# Ported from the upstream synergy package

_pkgname=synergy
pkgname=$_pkgname-git
pkgver=20160315.r2453.2ed3d26
pkgrel=1
pkgdesc='Share a single mouse and keyboard between multiple computers'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl')
makedepends=('cmake' 'git' 'libxt' 'qt5-base' 'unzip')
optdepends=(
  'qt5-base: gui support'
  'openssl: encryption support'
)
license=('GPL2')
source=(
  "$_pkgname::git+https://github.com/symless/$_pkgname.git"
  "${_pkgname}s_at.socket"
  "${_pkgname}s_at.service"
  'missing-include-fix.patch'
)
sha512sums=(
  'SKIP'
  'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
  'e85cc3452bb8ba8fcccb1857386c77eb1e4cabb149a1c492c56b38e1b121ac0e7d96c6fcbd3c9b522d3a4ae9d7a9974f4a89fc32b02a56f665be92af219e371c'
  '19d7afb79d02e04463fe574106b38b611465326188a7b698dd78412ad848d22a95bbb43bd645b68e69d4acf8e350d3a93c6d3a166add23a2e89ba3dd6b17d4df'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" \
    "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 < ../missing-include-fix.patch
  cd ext
  rm -rf gmock-1.6.0 gtest-1.6.0
  unzip gmock-1.6.0.zip -d gmock-1.6.0
  unzip gtest-1.6.0.zip -d gtest-1.6.0
}

build() {
  cd $_pkgname

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

  cd $_pkgname

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

  # plugin
  install -Dm644 bin/plugins/libns.so "$pkgdir/usr/lib/$_pkgname/libns.so"

  # install desktop/icon stuff
  install -Dm644 res/$_pkgname.ico "$pkgdir/usr/share/icons/$_pkgname.ico"
  install -Dm644 res/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

