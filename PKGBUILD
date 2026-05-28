pkgname=hyprspaces
pkgver=1.7
pkgrel=1
pkgdesc="Paired workspace plugin and setup scripts for Hyprland"
arch=('x86_64')
url='https://github.com/jtaw5649/hyprspaces'
license=('MIT')
depends=('bash' 'hyprland' 'python' 'cmake' 'pkgconf' 'gcc' 'make')
install=hyprspaces.install
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "hyprspaces.hook")
sha256sums=('6d349a8a5de7608e6970f8bbd9fa80afd80ac8b3e1c14ba1d1da0ef88dd7ec70'
            'a7868c8e64938386e8dd559b1bf1991ffbd7d144ec746830cbc80efacc357ebc')

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
