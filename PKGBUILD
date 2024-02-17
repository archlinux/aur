# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=vinegar
pkgver=1.7.3
pkgrel=2
pkgdesc="A launcher for Roblox Player and Studio"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL-3.0-only")
depends=("glibc" "hicolor-icon-theme" "libgles" "libxcursor" "libxfixes"
         "libxkbcommon" "libxkbcommon-x11" "libx11" "wayland")
makedepends=("git" "go" "vulkan-headers" "wayland-protocols")
optdepends=("gamemode: Gamemode integration"
            "vulkan-driver: Vulkan support in GUI"
            "wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha256sums=("6d8cf5f4fea17560c7cca601ad4da6ed305318e27d00d8e9589d0a9407632aeb")

prepare() {
  cd "${pkgname}-v${pkgver}"

  # Disable a malicious feature
  sed -i 's/_, err := os.Stat(dirs.Prefix); err == nil/false/' cmd/vinegar/main.go
}

build() {
  cd "${pkgname}-v${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Needed for RELRO support (which is a security feature)
  export CGO_LDFLAGS="${LDFLAGS}"

  # Make sure Vinegar rebuilds
  make clean

  make DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "${pkgname}-v${pkgver}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
