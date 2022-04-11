# Maintainer: prg <prg _at_ xannode _dot_ com>
# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=haruna
pkgver=0.7.3
pkgrel=2
pkgdesc='Video player built with Qt/QML on top of libmpv.'
arch=('x86_64')
url='https://invent.kde.org/multimedia/haruna/'
license=('GPL3')
depends=('kfilemetadata' 'kio' 'mpv' 'qt5-quickcontrols2' 'kirigami2' 'breeze-icons')
makedepends=('extra-cmake-modules' 'kdoctools')
source=("$url/-/archive/v$pkgver/haruna-v$pkgver.tar.gz" "fix-ffmpeg.patch")
sha256sums=('8ef599a6b986fdff85067d9c9c47aa8d70f07e365446036247b8da1237d75bd4'
            '6ea1f8f1fa2fd887690f3e5a11e47f6984b14af1d58d8b692c19d022ce8f6f87')

prepare() {
  cd "$pkgname-v$pkgver"
  patch -p1 < "$srcdir/fix-ffmpeg.patch"
}

build() {
  export CFLAGS+=" $CPPFLAGS"
  export CXXFLAGS+=" $CPPFLAGS"
  cmake -B 'build' -S "$pkgname-v$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="$pkgdir" PREFIX='/usr' -C 'build' install
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" "$pkgname-v$pkgver/README.md"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-v$pkgver/LICENSES"/*
}

# vim: ts=2 sw=2 et:
