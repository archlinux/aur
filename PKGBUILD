# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

pkgname=vinegar
pkgver=1.5.2
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme" "libgles" "libxcursor" "libxfixes"
         "libxkbcommon" "libxkbcommon-x11" "libx11" "wayland")
makedepends=("git" "go" "vulkan-headers" "wayland-protocols")
optdepends=("vulkan-driver: Vulkan support in GUI"
            "wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha256sums=("b7651d9facccf190cfc8d1f12ff0e15f9501ff3fa7c53226dbae6d804001951b")

build() {
  cd "${pkgname}-v${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Needed for RELRO support (which is a security feature)
  export CGO_LDFLAGS="${LDFLAGS}"

  # Make sure Vinegar rebuilds
  make clean

  # Enable all Gio features (overriding default upstream behavior)
  make VINEGAR_GOFLAGS="" DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "${pkgname}-v${pkgver}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
