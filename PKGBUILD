# Maintainer: Yuri Pieters <magejohnyjtp+archlinux@gmail.com>
# Contributor: Ray Powell <ray+archlinux@xphoniexx.net>
# Contributor: Joe Davison <joedavison.davison@gmail.com>

# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=wxlauncher-git

pkgver=0.12.0.rc3.r18.ga204abb
pkgrel=1

pkgdesc="A cross-platform launcher for the FreeSpace 2 Open engine - Git version"
# NOTE: architectures other than x86_64 have not been tested. However, all the hard dependencies
# are available for all the listed architectures, so they should work.
arch=('x86_64' 'i486' 'i686' 'pentium4' 'aarch64' 'armv7h')
url="https://github.com/scp-fs2open/wxLauncher"
license=(GPL2)

depends=(
  'sdl2' 
  'wxwidgets'
)
makedepends=(
  'cmake' 
  'git'
  'openal'
  'python'
  'python-markdown'
)
optdepends=(
  'fs2_open: FreeSpace 2 Open engine executable' 
  'openal: audio device configuration support'
)

provides=('wxlauncher')
conflicts=('wxlauncher')

source=(
  "git+https://github.com/scp-fs2open/wxLauncher.git"
  "wxwidgets-3.2-compatibility.patch"
)

sha256sums=('SKIP'
            '704efd1e3404fc800e001811b579b82a3045330ea9513b15025fe5db1c71abb9')

pkgver() {
  cd wxLauncher || exit
  git describe --long --tags | sed -E 's/[^-]*-g/r\0/; s/rc\.(\d*)/rc\1/; s/-/./g'
}

prepare() {
  cd wxLauncher || exit
  patch --forward --strip=1 --input="../wxwidgets-3.2-compatibility.patch"
}

build() {
  cmake -B build \
        -S wxLauncher \
        -DUSE_OPENAL=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
