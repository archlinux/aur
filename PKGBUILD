# Maintainer: Arthur LAURENT <arthur.laurent4@gmail.com>
pkgname='stormkit-git'
pkgver=r190.08bc01b
pkgrel=1
pkgdesc='Arthapz personal C++ TooKit'

arch=('any')
url='https://gitlab.com/Arthapz/stormkit'
license=('MIT')

provides=('stormkit')
depends=('microsoft-gsl' 'glm' 'fmt' 'vulkan-headers' 'range-v3')
makedepends=('cmake' 'git' 'ninja' 'meson' 'libxcb' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util' 'gli')
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
    cd 'stormkit'
    export DESTDIR=/usr
    meson builddir-debug --prefix /usr -Dbuildtype=debug -Denable_examples=false -Dexamples_data_dir='/usr/share/' -Dgli_include_dir=/usr/include
    meson builddir-release --prefix /usr -Dbuildtype=release -Denable_examples=true -Dexamples_data_dir='/usr/share/' -Dgli_include_dir=/usr/include
}

build() {
    cd 'stormkit'
    ninja -C builddir-debug
    ninja -C builddir-release
}

package() {
    cd 'stormkit'
    DESTDIR="${pkgdir}" ninja -C builddir-debug install
    DESTDIR="${pkgdir}" ninja -C builddir-release install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/stormkit/LICENSE"
}
