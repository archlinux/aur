# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: I hope wael is a nice woman now :troll:

pkgname=vinegar
pkgver=1.4.4
pkgrel=1
pkgdesc="A transparent wrapper for Roblox Player and Roblox Studio"
arch=("x86_64")
url="https://github.com/vinegarhq/vinegar"
license=("GPL3")
depends=("glibc" "hicolor-icon-theme")
makedepends=("git" "go")
optdepends=("wine: A required dependency (made optional for flexbility)")
conflicts=("vinegar-git")
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=("fb174d94beaac98d59cc790d635d8259abb558f1760a2ff8cfc573ce918998b4")

build() {
  cd "${pkgname}-v${pkgver}"

  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"

  # Make sure Vinegar rebuilds
  make clean

  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "${pkgname}-v${pkgver}"

  # This does all the work (except for the optional LICENSE file)
  make DESTDIR="${pkgdir}" PREFIX="/usr" install

  # Install GPLv3 license (just in case)
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
