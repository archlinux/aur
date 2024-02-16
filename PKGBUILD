# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=nomacs-qt6-git
pkgver=r3974.645eaaf
pkgrel=1
pkgdesc="A Qt image viewer"
arch=(x86_64)
url="https://nomacs.org/"
license=(GPL3)
provides=("nomacs")
conflicts=("nomacs")
depends=(exiv2 gcc-libs glibc libraw libtiff opencv qt6-base qt6-svg qt6-5compat)
makedepends=(cmake git git-lfs qt6-tools python)
optdepends=('qt6-imageformats: support additional image formats')
source=("git+https://github.com/nomacs/nomacs.git"
        "git+https://github.com/v-tyrtov/nomacs-plugins.git"
)
b2sums=('SKIP'
        'SKIP'
)

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
  cd "$srcdir/nomacs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/nomacs"
  # copy plugin sources into place
  cp -av "${srcdir}/nomacs-plugins/"* "ImageLounge/plugins"
}

build() {
  cd "$srcdir/nomacs"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DQT_VERSION_MAJOR=6 \
    -DUSE_SYSTEM_QUAZIP=ON \
    -DENABLE_AVIF=ON \
    -DENABLE_TRANSLATIONS=ON \
    -W no-dev \
    -B build \
    -S ./ImageLounge
  make VERBOSE=1 -C build
}

package() {
  cd "$srcdir/nomacs"
  make DESTDIR="${pkgdir}" install -C build
}
