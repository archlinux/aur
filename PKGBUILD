# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=plasma5-applets-uswitch-git
pkgver=1.3.0.r2.g4c9936a
pkgrel=2
pkgdesc='Modified version of User Switch plasmoid'
url='https://gitlab.com/divinae/uswitch'
license=('GPL3')
arch=('any')
depends=('plasma-workspace')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kcoreaddons5')
provides=('plasma5-applets-uswitch')
conflicts=('plasma5-applets-uswitch')
source=("$pkgname::git+https://gitlab.com/divinae/uswitch.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  cd package
  desktoptojson -i metadata.desktop

  mkdir -p plasmoid
  mv -t plasmoid metadata.json contents
}

build() {
  cd "$pkgname"

  cmake -S package -B build \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=RelWithDeb \
    -D KDE_INSTALL_LIBDIR=lib \
    -D KDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  cd "$pkgname"

  cmake --install build --prefix "${pkgdir}/usr"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
