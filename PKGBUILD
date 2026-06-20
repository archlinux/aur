# Maintainer: WackyIdeas <wackyideas@disroot.org>

pkgname=('uac-polkit-agent-git')
pkgver=6.7.0_816.rd8c2262
pkgrel=1
pkgdesc="Polkit authenticator with a User Account Control interface for AeroShell desktops"
arch=(x86_64)
url="https://github.com/aeroshell-desktop/uac-polkit-agent"
license=('GPL-3.0-or-later')
depends=(gcc-libs
         glibc
         libstdc++
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kirigami
         knotifications
         kwindowsystem
         polkit-qt6
         qt6-base
         qt6-declarative)
makedepends=(git
             extra-cmake-modules
             kdoctools)
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
conflicts=(uac-polkit-agent)
provides=(uac-polkit-agent)

pkgver() {
  cd "$srcdir/${pkgname%}"
  echo "$(grep 'set(PROJECT_VERSION ' CMakeLists.txt | cut -d '"' -f 2)_$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%} \
    -DBUILD_TESTING=OFF -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
