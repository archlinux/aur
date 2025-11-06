# Maintainer: imskyyc <sky at imskyyc com>
# shellcheck shell=bash disable=SC2034

pkgname=vinegar
pkgver=1.9.1
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
conflicts=("vinegar-git" "vinegar-git-debug")
source=("https://github.com/vinegarhq/vinegar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("2c146918abfa71085b14c2d020fa6c2d026152a4d5182e9afe7f1c8a886dd6e5")
options=(!debug)

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
