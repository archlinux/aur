# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

_pkgname=vinegar
pkgname=vinegar-git
pkgver=1.7.3.r8.gcd7faa4
pkgrel=1
pkgdesc="A weirdo launcher for Roblox Player and Studio (Git version)"
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
install="${pkgname}.install"

prepare() {
  cd "${srcdir}/${_pkgname}"

  # HACK (FIXME): Don't rebuild the icons when installing them
  # (upstream repo has them anyway and building them causes race conditions)
  sed -i 's/install-icons: icons/install-icons:/' Makefile

  # Disable a malicious feature
  sed -i 's/_, err := os.Stat(dirs.Prefix); err == nil/false/' cmd/vinegar/main.go
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
