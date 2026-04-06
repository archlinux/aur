pkgname=hyprspaces
pkgver=1.4.1
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

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "build/hyprspaces.so" "${pkgdir}/usr/lib/hyprspaces/hyprspaces.so"

  install -Dm755 "scripts/hyprspaces-load" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-load"
  install -Dm755 "scripts/hyprspaces-install" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-install"
  install -Dm755 "scripts/hyprspaces-uninstall" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-uninstall"
  install -Dm755 "scripts/hyprspaces-rebuild" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-rebuild"
  install -Dm755 "scripts/hyprspaces-waybar-restart" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-waybar-restart"
  install -Dm755 "scripts/hyprspaces-waybar-use-fork" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-fork"
  install -Dm755 "scripts/hyprspaces-waybar-use-stock" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-stock"
  install -Dm644 "scripts/hyprspaces-lib.sh" "${pkgdir}/usr/lib/hyprspaces/scripts/hyprspaces-lib.sh"
  install -Dm755 "scripts/waybar_jsonc.py" "${pkgdir}/usr/lib/hyprspaces/scripts/waybar_jsonc.py"

  install -Dm644 "config/hyprspaces-plugin.conf" "${pkgdir}/usr/share/hyprspaces/config/hyprspaces-plugin.conf"
  install -Dm644 "config/hyprspaces-bindings.conf" "${pkgdir}/usr/share/hyprspaces/config/hyprspaces-bindings.conf"

  # Pacman hook for automatic rebuild on Hyprland updates.
  install -Dm644 "${srcdir}/hyprspaces.hook" "${pkgdir}/usr/share/libalpm/hooks/hyprspaces.hook"

  # Ship source for the pacman hook rebuild script.
  install -Dm644 "CMakeLists.txt" "${pkgdir}/usr/src/hyprspaces/CMakeLists.txt"
  install -Dm644 "src/main.cpp" "${pkgdir}/usr/src/hyprspaces/src/main.cpp"
  install -Dm644 "src/logic.cpp" "${pkgdir}/usr/src/hyprspaces/src/logic.cpp"
  install -Dm644 "src/logic.hpp" "${pkgdir}/usr/src/hyprspaces/src/logic.hpp"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-load" "${pkgdir}/usr/bin/hyprspaces-load"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-install" "${pkgdir}/usr/bin/hyprspaces-install"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-uninstall" "${pkgdir}/usr/bin/hyprspaces-uninstall"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-rebuild" "${pkgdir}/usr/bin/hyprspaces-rebuild"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-waybar-restart" "${pkgdir}/usr/bin/hyprspaces-waybar-restart"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-fork" "${pkgdir}/usr/bin/hyprspaces-waybar-use-fork"
  ln -s "/usr/lib/hyprspaces/scripts/hyprspaces-waybar-use-stock" "${pkgdir}/usr/bin/hyprspaces-waybar-use-stock"
}
