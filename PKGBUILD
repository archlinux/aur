# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=pistache-git
_name=${pkgname%-git}
pkgver=1534.ff9db0d
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Modern and elegant HTTP and REST framework for C++'
license=('APACHE')
depends=('openssl')
makedepends=('rapidjson' 'meson' 'git')
checkdepends=('gtest')
provides=("${_name}")
conflicts=("${_name}")
options=(staticlibs)
url="https://github.com/pistacheio/${_name}"
source=("git+https://github.com/pistacheio/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"

  arch-meson build \
    --buildtype=release \
    -DPISTACHE_USE_SSL=true \
    -DPISTACHE_BUILD_EXAMPLES=true \
    -DPISTACHE_BUILD_TESTS=true \
    -DPISTACHE_BUILD_DOCS=false
  meson compile -C build
}

check() {
  cd "${srcdir}/${_name}"
  meson test -C build
}

package() {
  cd "${srcdir}/${_name}"
  DESTDIR="$pkgdir" meson install -C build
}
