# Merged with official ABS kmail PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kmail-git
pkgver=21.11.40_r25846.gbb906806c
pkgrel=1
pkgdesc="KDE mail client"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL2)
depends=(kdepim-runtime-git kmail-account-wizard-git akonadi-import-wizard-git mbox-importer-git
         pim-data-exporter-git pim-sieve-editor-git kontactinterface-git ktnef-git)
makedepends=(git extra-cmake-modules-git kdoctools-git boost)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kleopatra-git: mail encryption support' 'kdepim-addons-git: additional plugins')
groups=(kde-applications-git kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
