pkgname=steamvr-openhmd-git
pkgver=r61.b4899b2
pkgrel=1
pkgdesc="SteamVR plugin for using OpenHMD drivers in SteamVR"
arch=(i686 x86_64)
url="https://github.com/ChristophHaag/SteamVR-OpenHMD"
license=('custom')
makedepends=('git' 'cmake')
depends=('openhmd-git')
source=("steamvr-openhmd::git+https://github.com/ChristophHaag/SteamVR-OpenHMD")
install="${pkgname}.install"
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/steamvr-openhmd"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/steamvr-openhmd/subprojects/openhmd"
  git submodule init
  git submodule update

  mkdir -p "$srcdir/steamvr-openhmd-build"
}

build() {
  cd steamvr-openhmd-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BINARY_DIR="$pkgdir/usr/lib/steamvr/openhmd" ../steamvr-openhmd
  make
}

package() {
  cd steamvr-openhmd-build

  # Install SteamVR plugin
  install -Dm644 "$srcdir/steamvr-openhmd-build/driver.vrdrivermanifest" "$pkgdir/usr/lib/steamvr/openhmd/driver.vrdrivermanifest"
  install -Dm644 "$srcdir/steamvr-openhmd-build/bin/linux64/driver_openhmd.so" "$pkgdir/usr/lib/steamvr/openhmd/bin/linux64/driver_openhmd.so"
  install -Dm644 "$srcdir/steamvr-openhmd-build/resources/driver.vrresources" "$pkgdir/usr/lib/steamvr/openhmd/resources/driver.vrresources"
  install -d "$pkgdir/usr/lib/steamvr/openhmd/resources/icons"
  install -Dm644 "$srcdir/steamvr-openhmd-build/resources/icons/"*.png "$pkgdir/usr/lib/steamvr/openhmd/resources/icons/"
  install -Dm644 "$srcdir/steamvr-openhmd-build/resources/icons/"*.gif "$pkgdir/usr/lib/steamvr/openhmd/resources/icons/"
  install -Dm644 "$srcdir/steamvr-openhmd-build/resources/settings/default.vrsettings" "$pkgdir/usr/lib/steamvr/openhmd/resources/settings/default.vrsettings"

  # Install README and extra files
  install -Dm644 "$srcdir/steamvr-openhmd/Readme.md" "$pkgdir/usr/share/doc/steamvr-openhmd-git/Readme.md"
  install -Dm644 "$srcdir/steamvr-openhmd/steamvr.vrsettings" "$pkgdir/usr/lib/steamvr/openhmd/steamvr.vrsettings"
  install -Dm644 "$srcdir/steamvr-openhmd/LICENSE" "$pkgdir/usr/share/licenses/steamvr-openhmd-git/LICENSE"

  # Install helper scripts
  install -Dm755 "$srcdir/steamvr-openhmd/register.sh" "$pkgdir/usr/lib/steamvr/openhmd/paths.sh"
  install -Dm755 "$srcdir/steamvr-openhmd/register.sh" "$pkgdir/usr/lib/steamvr/openhmd/register.sh"
  install -Dm755 "$srcdir/steamvr-openhmd/unregister.sh" "$pkgdir/usr/lib/steamvr/openhmd/unregister.sh"
}


# vim:set ts=2 sw=2 et:
