# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=lutris-git
pkgver=0.5.9.1.r25.ge03f91f7
pkgrel=3
pkgdesc='Open Gaming Platform'
arch=('any')
url='https://lutris.net/'
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-evdev' 'python-dbus' 'gtk3'
         'glib2' 'psmisc' 'cabextract' 'unzip' 'p7zip' 'curl' 'xorg-xrandr'
         'python-pillow' 'python-requests' 'gnome-desktop' 'webkit2gtk'
         'mesa-utils' 'python-dbus' 'python-distro' 'python-magic' 'python-lxml')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
optdepends=(
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'vulkan-icd-loader: Vulkan support'
  'lib32-vulkan-icd-loader: Vulkan support'
  'vkd3d: Vulkan 3D support'
  'lib32-vkd3d: Vulkan 3D support'
  'gvfs: GVFS backend'
  'lib32-glibc: for 32bit games support'
  'gamemode: Allows games to request a temporary set of optimisations'
  'lib32-gamemode: Allows games to request a temporary set of optimisations'
  "mangohud: Display the games' FPS + other information"
  "lib32-mangohud: Display the games' FPS + other information"
  'innoextract: Extract Inno Setup installers'
  'xorg-xgamma: Restore gamma on game exit')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  appstream-util validate-relax --nonet build/net.lutris.Lutris.metainfo.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
