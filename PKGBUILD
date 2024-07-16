# Maintainer: imskyyc <sky at imskyyc com>
# shellcheck shell=bash disable=SC2034

pkgname=vinegar
pkgver=1.7.5
pkgrel=2
pkgdesc="Fast and robust bootstrapper for Roblox that has many ease-of-use features."
arch=("x86_64")
url="https://vinegarhq.org"
license=("GPL-3.0-only")
depends=("glibc" "hicolor-icon-theme" "libgles" "libxcursor" "libxfixes"
         "libxkbcommon" "libxkbcommon-x11" "libx11" "wayland")
makedepends=("git" "go" "vulkan-headers" "wayland-protocols")
optdepends=("gamemode: Gamemode integration"
            "vulkan-driver: Vulkan support in GUI"
            "wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("https://github.com/vinegarhq/vinegar/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha256sums=("b79b5903b3063793cda0a0c7c23e3972f4914aa59ae8be4bfbd5db66766d9b0d")

prepare() {
  cd "${pkgname}-v${pkgver}"
  make clean
}

build() {
  cd "${pkgname}-v${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" BINPREFIX="/usr/lib/vinegar" all
}

package() {
  cd "${pkgname}-v${pkgver}"

  make PREFIX="/usr" BINPREFIX="/usr/lib/vinegar" DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
