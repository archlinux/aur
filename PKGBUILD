# Merged with official ABS kio PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kio-git
pkgver=6.0.0_r6895.gcfc712cc0
pkgrel=1
pkgdesc='Resource and network access abstraction'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(acl gcc-libs glibc karchive-git kauth-git kbookmarks-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git kguiaddons-git ki18n-git kiconthemes-git kitemviews-git kjobwidgets-git kservice-git kwallet-git kwidgetsaddons-git kwindowsystem-git libxml2 libxslt qt6-5compat qt6-base solid-git util-linux-libs)
makedepends=(git doxygen extra-cmake-modules-git kdoctools-git qt6-doc qt6-tools)
optdepends=('kded-git: proxy management and cookie storage'
            'kdoctools-git: for the help kioslave'
            'kio-extras-git: extra protocols support (sftp, fish and more)'
            'kio-fuse-git: to mount remote filesystems via FUSE'
            'switcheroo-control: hybrid GPU support')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
