# Maintainer: Bernhard Landauer <bernhard@manjaro.org>
# Maintainer: Bogdan Covaciu <bogdan@manjaro.org

pkgbase=artwork-breath
pkgname=(
    'plasma5-themes-breath-migration'
    'plasma5-themes-breath'
    'plasma5-themes-breath-extra'
    'breath-wallpapers'
    'sddm-breath-theme')
pkgver=21.2.0
pkgrel=2
_commit=cb3a79366ac13dddd4454fdc5511b8d374e71de9
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/breath"
license=('LGPL')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'plasma-framework')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {

  echo "Building plasma5-themes-breath-migration..."
  cmake -B build-breath-migration -S breath \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_MIGRATION=ON
  make -C build-breath-migration

  echo "Building plasma5-themes-breath..."
  cmake -B build-breath -S breath \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_PLASMA_THEMES=ON
  make -C build-breath

  echo "Building plasma5-themes-breath-extra..."
  cmake -B build-breath-extra -S breath \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_EXTRA_COLORS=ON
  make -C build-breath-extra

  echo "Building sddm-breath-theme..."
  cmake -B build-sddm -S breath \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_SDDM_THEME=ON
  make -C build-sddm
}

package_plasma5-themes-breath-migration() {
  pkgdesc='Breath theme migration routine for kconf_update'
  arch=('x86_64' 'aarch64')

  make -C build-breath-migration DESTDIR="${pkgdir}" install
}

package_plasma5-themes-breath() {
  pkgdesc='Breath theme for KDE Plasma 5'
  depends=('breeze' 'plasma5-themes-breath-migration')
  conflicts=('plasma5-themes-breath2' 'breath2-icon-themes')
  replaces=('plasma5-themes-breath2' 'breath2-icon-themes')

  make -C build-breath DESTDIR="${pkgdir}" install
}

package_plasma5-themes-breath-extra() {
  pkgdesc='Additional Breath colors for KDE Plasma 5'

  make -C build-breath-extra DESTDIR="${pkgdir}" install
}

package_breath-wallpapers() {
  pkgdesc='Breath wallpapers'

  cd "${srcdir}/breath/wallpapers"
  install -Dm644 Bamboo/contents/images/5120x2880.png \
    ${pkgdir}/usr/share/backgrounds/bamboo.png
  install -Dm644 Bamboo\ at\ Night/contents/images/5120x2880.png \
    ${pkgdir}/usr/share/backgrounds/bambooatnight.png
}

package_sddm-breath-theme() {
  pkgdesc="Breath theme for SDDM"
  depends=('plasma-framework' 'plasma-workspace')
  conflicts=('sddm-breath2-theme-dev')
  replaces=('sddm-breath2-theme')

  make -C build-sddm DESTDIR="${pkgdir}" install
}
