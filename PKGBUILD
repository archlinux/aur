# Maintainer: Fabian Habermann <internetenjoyer at web dot de>
pkgname=kapsule-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Incus-based container manager with KDE/Plasma integration"
url="https://invent.kde.org/kde-linux/kapsule"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('qt6-base' 'incus' 'systemd' 'glib2' 'dbus' 'icu' 'zlib' 'zstd' 'libb2' 'double-conversion' 'pcre2' 'gcc-libs' 'glibc' 'kcoreaddons' 'ki18n' 'kconfig' 'qcoro' 'python')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'ninja' 'python')
provides=('kapsule')
conflicts=('kapsule')
source=("git+https://invent.kde.org/kde-linux/kapsule.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kapsule"
  # read version from pyproject.toml as kapsule does not define git tags
  python -c "import tomllib; print(tomllib.load(open('pyproject.toml','rb'))['project']['version'])"

}

build() {
  cd "$srcdir/kapsule"
  mkdir -p build
  cd build
  cmake -G Ninja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_KDE_COMPONENTS=ON \
    -DVENDOR_PYTHON_DEPS=ON \
    -DINSTALL_PYTHON_DAEMON=ON
  # The python deps are bundled because kapsule requires python-dbus-fast ver 4, but in the repos is only version 3
  ninja
}

package() {
  cd "$srcdir/kapsule/build"
  DESTDIR="$pkgdir" ninja install
}
