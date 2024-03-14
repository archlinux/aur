# Maintainer: imskyyc <sky at imskyyc dot com>
# shellcheck shell=bash disable=SC2034

_pkgname=vinegar
pkgname=vinegar-git
pkgver=1.7.4.r1.g837cda9
pkgrel=1
pkgdesc="Fast and robust bootstrapper for Roblox that has many ease-of-use features."
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL-3.0-only")
depends=("glibc" "hicolor-icon-theme" "libgles" "libxcursor" "libxfixes"
         "libxkbcommon" "libxkbcommon-x11" "libx11" "wayland")
makedepends=("git" "go" "vulkan-headers" "wayland-protocols")
optdepends=("gamemode: Gamemode integration"
            "vulkan-driver: Vulkan support in GUI"
            "wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar")
source=("git+${url}")
sha256sums=("SKIP")
provides=("${pkgname}=${pkgver}");

prepare() {
  cd "${srcdir}/${_pkgname}"

  # HACK (FIXME): Don't rebuild the icons when installing them
  # (upstream repo has them anyway and building them causes race conditions)
  sed -i 's/install-icons: icons/install-icons:/' Makefile

  make clean
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
