# Maintainer: Arthur LAURENT <arthur.laurent4@gmail.com>
pkgname='stormkit-git'
pkgver=r8.f6a2a92
pkgrel=1
pkgdesc='Arthapz personal C++ TooKit'

arch=('any')
url='https://gitlab.com/Arthapz/stormkit'
license=('MIT')

provides=('stormkit')
depends=('microsoft-gsl' 'glm' 'fmt' 'vulkan-headers')
makedepends=('cmake' 'git' 'ninja' 'meson' 'libxcb' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util')
optdepends=('libpng' 'libjpeg')
conflicts=('stormkit')

source=('git+https://gitlab.com/Arthapz/stormkit.git')
sha256sums=('SKIP')

pkgver() {
  cd 'stormkit'
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    range="range"
    if pacman -Qi $range > /dev/null ; then
    	git clone https://aur.archlinux.org/range-v3-git.git
    	cd 'range-v3-git'
    	makepkg -si
    	cd '../'
    fi

    cd 'stormkit'
    export DESTDIR=/usr
    meson builddir-debug -Dbuildtype=debug -Denable_examples=false
    meson builddir-release -Dbuildtype=release -Denable_examples=true
}

build() {
    cd 'stormkit'
    ninja -C builddir-debug
    ninja -C builddir-release
}

package() {
    cd 'stormkit'
    ninja -C builddir-debug install
    ninja -C builddir-release install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/stormkit/LICENSE"
}
