# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=nomacs-qt6-git
pkgver=3.21.0.r15.g1f44552
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
        "git+https://github.com/nomacs/nomacs-plugins.git"
        https://github.com/v-tyrtov/nomacs-plugins/commit/1b87f615ce0e7125ec739bc3e40d8ff7f6783587.patch
        https://github.com/v-tyrtov/nomacs-plugins/commit/a869962f051504dd2c1dedeb3bc3d266c17070c1.patch
)
b2sums=('SKIP'
        'SKIP'
        '35b0e5d7e8a35112c3a71cf09e22b74cd386cac5d246757e824fd85215c15d6b1aefa9c4002ea48dafca9a970a40e5120046d234b2fe47fb266f95fc4b048540'
        '9be1275f3912d250b44eae6882316ce57850ff69c9e2d611c5bfb08b39792cf7cceb030ee498b79333eaaa8c629ad6ef0e4ab6eaaf698292df39930e945fbb07')

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
  cd "nomacs"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "nomacs-plugins"

  patch -Np1 -i ../1b87f615ce0e7125ec739bc3e40d8ff7f6783587.patch
  patch -Np1 -i ../a869962f051504dd2c1dedeb3bc3d266c17070c1.patch

  cd "${srcdir}/nomacs"
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
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -W no-dev \
    -B build \
    -S ./ImageLounge
  make VERBOSE=1 -C build
}

package() {
  cd "$srcdir/nomacs"
  make DESTDIR="${pkgdir}" install -C build
}
