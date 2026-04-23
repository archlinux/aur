pkgname=hyprspaces
pkgver=1.5
pkgrel=1
pkgdesc="Paired workspace plugin and setup scripts for Hyprland"
arch=('x86_64')
url='https://github.com/jtaw5649/hyprspaces'
license=('MIT')
depends=('bash' 'hyprland' 'python')
makedepends=('cmake' 'pkgconf')
optdepends=('cmake: automatic plugin rebuild on Hyprland updates'
            'pkgconf: automatic plugin rebuild on Hyprland updates')
install=hyprspaces.install
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "hyprspaces.hook")
sha256sums=('SKIP'
            'SKIP')

build() {
  cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/${pkgname}-${pkgver}/build" -DCMAKE_BUILD_TYPE=Release
  cmake --build "${srcdir}/${pkgname}-${pkgver}/build"
}

check() {
    ctest --test-dir "${srcdir}/${pkgname}-${pkgver}/build" --output-on-failure
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install "${srcdir}/${pkgname}-${pkgver}/build" --prefix /usr

  # Pacman hook for automatic rebuild on Hyprland updates.
  install -Dm644 "${srcdir}/hyprspaces.hook" "${pkgdir}/usr/share/libalpm/hooks/hyprspaces.hook"
}
