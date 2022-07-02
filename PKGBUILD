# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=smaragd-git
pkgver=0.0.8.r46.g3bc7310
pkgrel=1
pkgdesc="KWin plugin to support Emerald themes in KDE"
arch=(x86_64)
url="https://invent.kde.org/plasma/smaragd"
license=(GPL3)
depends=('kconfig' 'kcoreaddons' 'ki18n' 'kwidgetsaddons' 'kdecoration' 'glib2' 'cairo')
makedepends=('git' 'extra-cmake-modules')
optdepends=('emerald-themes: extra themes')
provides=('smaragd')
conflicts=('smaragd')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
