# Maintainer: Davide Briani <116493713+brianidavide@users.noreply.github.com>
#
# Kalipso from the latest commit on main: for trying what is not released yet.

pkgname=kalipso-git
pkgver=0.1.r64.g50da5e2
pkgrel=1
pkgdesc='Teleprompter that keeps your place: follows your voice on your computer, scrolls at a steady pace or waits for your pedal (development version)'
arch=('x86_64')
url='https://brianidavide.github.io/kalipso/'
license=('AGPL-3.0-or-later')
# pipewire: pw-record captures the microphone.
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libpipewire' 'libstdc++' 'pipewire' 'qt6-base' 'qt6-svg')
makedepends=('cmake' 'git' 'ninja' 'python' 'qt6-tools')
optdepends=('plasma-workspace: the Plasma widget and the KWin script'
            'gnome-shell: the GNOME Shell extension'
            'xdg-desktop-portal: reader colours from the window behind')
provides=('kalipso')
conflicts=('kalipso')
source=('kalipso::git+https://github.com/brianidavide/kalipso.git')
sha256sums=('SKIP')

pkgver() {
  cd kalipso
  printf '%s.r%s.g%s' "$(sed -n 's/^project(Kalipso VERSION \([0-9.]*\).*/\1/p' CMakeLists.txt)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S kalipso -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  sh kalipso/packaging/linux/install-extras.sh "$srcdir/kalipso" "$pkgdir/usr"
}
