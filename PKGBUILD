# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-video-gliden64-highscore-git
pkgver=4.0.r710.g55c436c
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for Highscore port of Mupen64Plus"
arch=('x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL-2.0-only')
depends=(
  'libglvnd'
  'mupen64plus-git'
)
makedepends=(
  'cmake'
  'git'
)
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
source=('git+https://github.com/gonetz/GLideN64.git'
        'gliden64-framebuffer-fix.patch'
        'gliden64-resize-fix.patch')
sha256sums=('SKIP'
            'f1bae3a1b25106b004b75c70a3607fbe7bad94a92db2111c56f16ddc168f7178'
            '4bcfbbb48208086e29f2b0d755e7be5ff4a2e106e10f3c0a50c32675e37f0818')

pkgver() {
  cd GLideN64
  git describe --long --tags --match "Public_Release*" --abbrev=7 | sed 's/^Public_Release_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd GLideN64

  # https://gitlab.gnome.org/World/highscore/-/raw/main/flatpak/cores/
  patch -Np1 -i ../gliden64-framebuffer-fix.patch
  patch -Np1 -i ../gliden64-resize-fix.patch
}

build() {
  cmake -B build -S GLideN64/src \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_LIBS='ON' \
    -DMUPENPLUSAPI='ON' \
    -DNO_OSD='ON' \
    -DNOHQ='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
