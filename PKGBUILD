# Maintainer: Westin Miller <equinox.aur@gmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>

pkgname=kodi-addon-pvr-mythtv-git
pkgver=r677.a2a56f3
pkgrel=1
if [ -z "$API" ]; then
  error "No API Version Defined, defaulting to 17.  15 = Isengard, 16 = Jarvis, 17 = Krypton, 99 = git master"
fi
API=${API:-17}

_branch=$(
  case "${API}" in
    15) echo "Isengard";;
    16) echo "Jarvis";;
    17) echo "Krypton";;
    99) echo "master";;
    *) error "Unknown API version.";;
  esac
)
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.mythtv"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-platform-git')
if [ "$API" -eq "99" ]; then
  depends=("kodi-git")
else
  depends=("kodi>=$API.0" "kodi<$[$API+1].0")
fi
provides=('kodi-addon-pvr-mythtv')
conflicts=('kodi-addon-pvr-mythtv' 'kodi-pvr-addons')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.mythtv.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  echo "API Version $API"
  echo "Branch version $_branch"
  mkdir -p "$pkgname/build"
  cd "$pkgname/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
