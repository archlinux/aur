# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

pkgname=vinegar
pkgver=1.4.1
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme")
makedepends=("git" "go" "mingw-w64-gcc")
optdepends=("wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("2b19e08fe0566e63483444ebc1d8d07dc8161a921b069a0175ef5798f6e96698")

build() {
  cd "${pkgname}-${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Make sure Vinegar rebuilds
  make clean

  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" vinegar robloxmutexer
}

package() {
  cd "${pkgname}-${pkgver}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install install-robloxmutexer

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
