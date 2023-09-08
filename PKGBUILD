# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

pkgname=vinegar
pkgver=1.4.2
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme")
makedepends=("git" "go")
optdepends=("wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("eb3476b8de6a76b585206bb5fe901d74980de24b3c5c8e4c59598b0b25276f2b")

build() {
  cd "${pkgname}-${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Make sure Vinegar rebuilds
  make clean

  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "${pkgname}-${pkgver}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
