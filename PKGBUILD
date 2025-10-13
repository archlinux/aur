# Maintainer: imskyyc <sky at imskyyc com>
# shellcheck shell=bash disable=SC2034

pkgname=vinegar
pkgver=1.9.0
pkgrel=1
pkgdesc="Fast and robust bootstrapper for Roblox that has many ease-of-use features."
arch=("x86_64")
url="https://vinegarhq.org"
license=("GPL-3.0-only")
depends=("glibc" "hicolor-icon-theme" "libgles" "libxcursor" "libxfixes"
         "libxkbcommon" "libxkbcommon-x11" "libx11" "wayland" "libadwaita" "gtk4" "xdg-utils")
makedepends=("git" "go" "vulkan-headers" "wayland-protocols")
optdepends=("gamemode: Gamemode integration"
            "vulkan-driver: Vulkan support in GUI"
            "wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("https://github.com/vinegarhq/vinegar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("57cc1124c90a33c436a9f5c3985b16a644f4fba805a24ccd9d5b131532aea572")

prepare() {
  # Extract the tarball
  cd "${pkgname}-${pkgver}"
  make clean
}

build() {
  cd "${pkgname}-${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  sed -i '/gtk-update-icon-cache/d' Makefile

  make DESTDIR="${pkgdir}" PREFIX="/usr" BINPREFIX="/usr/lib/vinegar" all
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="/usr" BINPREFIX="/usr/lib/vinegar" DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
