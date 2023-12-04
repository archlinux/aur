# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
pkgname=tuxclocker
pkgver=1.4.0
pkgrel=1
pkgdesc="Qt overclocking tool for GNU/Linux"
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
depends=('boost-libs' 'hicolor-icon-theme' 'qt5-base' 'qt5-charts')
makedepends=('boost' 'git' 'meson' 'qt5-tools')
optdepends=('libdrm: AMD support'
            'libxnvctrl: NVIDIA support'
            'nvidia-utils: NVIDIA support'
            'python-hwdata: Prettier AMD GPU names')
_commit=89139f0ab1137d261233bb92e563c5d80eed8ae7  # tags/1.4.0^0
source=("git+https://github.com/Lurkki14/tuxclocker.git#commit=${_commit}"
        'git+https://github.com/mpark/patterns.git'
        'git+https://github.com/Dobiasd/FunctionalPlus.git'
        "$pkgname.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '9e0f528d7f24e501fa9586101231c7f85cf5fbb1709ff354b2abe8d422977d9f')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.src/include/deps/patterns.url "$srcdir/patterns"
  git config submodule.src/include/deps/FunctionalPlus.url "$srcdir/FunctionalPlus"
  git -c protocol.file.allow=always submodule update

  # Add missing cstdint include
  patch -Np1 -i ../"$pkgname.patch"
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
