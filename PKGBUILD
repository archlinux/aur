# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

pkgname=vinegar
pkgver=1.0.3
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme")
makedepends=("git" "go")
conflicts=("vinegar-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("ee9662f81e97c76afb4737552102d1418ea4a3173edf6caf4fffe2365eeafc6e")

build() {
  cd "${pkgname}-${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" vinegar
}

package() {
  cd "${pkgname}-${pkgver}"

  # This does all the work (except for the optional LICENSE file)
  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
