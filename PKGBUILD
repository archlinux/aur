# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=nomacs-qt6-git
pkgver=r3918.1b955ec
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
source=("git+https://github.com/v-tyrtov/nomacs.git"
        "git+https://github.com/v-tyrtov/nomacs-plugins.git"
        "https://github.com/nomacs/nomacs/files/11703502/nomacs-fix-exiv2-0.28.patch.txt"
)
b2sums=('SKIP'
        'SKIP'
        '7144b3e3391047bf89df4da8b78cf0b9273ff7cb2db8637f719ac4b926290901ba3f6f2dee4ba342f8dac4939b4d60be3d80a45dd2481d25408e712160a1bb78'
)

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
  cd "$srcdir/nomacs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/nomacs"
  # https://github.com/nomacs/nomacs/issues/951
  patch -Np1 -i ../nomacs-fix-exiv2-0.28.patch.txt
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
