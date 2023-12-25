# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

_pkgname=vinegar
pkgname=vinegar-git
pkgver=1.6.0.r1.gc3160de
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio (Git version)"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme" "libgles" "libxcursor" "libxfixes"
         "libxkbcommon" "libxkbcommon-x11" "libx11" "wayland")
makedepends=("git" "go" "vulkan-headers" "wayland-protocols")
optdepends=("gamemode: Gamemode integration"
            "vulkan-driver: Vulkan support in GUI"
            "wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar")
source=("git+${url}")
sha256sums=("SKIP")

prepare() {
  cd "${srcdir}/${_pkgname}"

  # HACK (FIXME): Don't rebuild the icons when installing them
  # (upstream repo has them anyway and building them causes race conditions)
  sed -i 's/install-icons: icons/install-icons:/' Makefile
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Needed for RELRO support (which is a security feature)
  export CGO_LDFLAGS="${LDFLAGS}"

  # Make sure Vinegar rebuilds
  make clean

  make DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "${srcdir}/${_pkgname}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
