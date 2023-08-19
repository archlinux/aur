# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

_pkgname=vinegar
pkgname=vinegar-git
pkgver=1.1.0.r1.ge4e8951
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio (Git version)"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme")
makedepends=("git" "go" "mingw-w64-gcc")
optdepends=("wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar")
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Make sure Vinegar rebuilds
  make clean

  make DESTDIR="${pkgdir}" PREFIX="/usr" vinegar robloxmutexer
}

package() {
  cd "${srcdir}/${_pkgname}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install install-robloxmutexer

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
