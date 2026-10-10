# Maintainer: CharOfString <root@charofstring.cc>

pkgname=spark-webapp-runtime-git
_pkgname=spark-web-app-runtime
pkgver=1.8.2.r0.gaf941e0
pkgrel=1
pkgdesc='Spark WebApp Runtime, a simple solution for packaging web apps'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/spark-web-app-runtime'
license=(GPL-3.0-or-later)
depends=(gxde-dtk6-git qt6-base qt6-webengine libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools)
provides=(spark-webapp-runtime)
conflicts=(spark-webapp-runtime)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g[0-9a-f]*\)$/r\1/;s/-/./g'
}

prepare() {
  local _tag
  _tag=$(git -C "$_pkgname" describe --tags --abbrev=0)
  msg2 "$_pkgname -> $_tag"
  git -C "$_pkgname" checkout -q --detach "refs/tags/$_tag"
}

build() {
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DVERSION="$(git -C "$_pkgname" describe --tags --abbrev=0)"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
