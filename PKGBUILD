# Maintainer: swim <swim853279614@163.com>
pkgname=plasma-lyrics-git
pkgver=0.2.1.r8.g7810680
pkgrel=1
pkgdesc='Native synchronized desktop lyrics widget for Plasma 6'
arch=('x86_64')
url='https://github.com/swim233/plasma-lyrics'
license=('GPL-2.0-only')
# Arch ships the KF6 libraries without a kf6- prefix. libplasma and ksvg are
# named explicitly rather than leaned on through plasma-workspace, because the
# QML this widget imports comes from them directly. kdeclarative owns
# org.kde.kquickcontrols, whose ColorButton the config dialog needs -- missing
# it breaks only the config dialog, so the widget itself still looks fine.
# glibc, libgcc and libstdc++ are what the binaries actually link against; every
# other entry only satisfies them by accident, which is what namcap reports.
depends=('plasma-workspace' 'libplasma' 'kirigami' 'ksvg' 'ki18n' 'kdeclarative'
         'qt6-base' 'qt6-declarative' 'glibc' 'libgcc' 'libstdc++')
# gettext supplies msgfmt, which builds the translation catalogues.
makedepends=('git' 'cmake' 'ninja' 'extra-cmake-modules' 'gettext')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # The describe and the sed have to stay apart: a pipeline reports the exit
  # status of its last command, so piping a failed describe into sed yields an
  # empty version and a successful status, and the fallback never runs. Until
  # the first tag exists, that is every build.
  local described
  if described=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "$described" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  # None rather than Release: it leaves the compiler flags to makepkg.conf, so
  # the package picks up Arch's hardening and debug-package settings instead of
  # CMake's own -O3 -DNDEBUG. No production code path relies on assert().
  cmake -S "$pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
