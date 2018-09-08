# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=emulationstation-autoscraper
pkgver=1.4.6
pkgrel=1
pkgdesc="An auto-scraper for EmulationStation written in Go using hashes"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/sselph/scraper"
license=('custom')
makedepends=('git' 'go')

source=($pkgname-$pkgver.tar.gz::https://github.com/sselph/scraper/archive/v${pkgver}.tar.gz)
sha256sums=('898d13a94f630bcb2e78b144fb06c106a6f29a316ab1d63f9b702719cf98e0cd')

scraperdir="scraper-${pkgver}"

build() {
  # echo $arch # for later use on different arches
  mkdir -p "github.com/sselph"
  ln -s "${srcdir}/${scraperdir}" "${srcdir}/github.com/sselph/scraper"
  GOPATH="$(pwd)" && export GOPATH=$(echo ${GOPATH%src})
  echo $(go build github.com/sselph/scraper)
}

package() {
  cd "${srcdir}"
  strip "scraper"
  install -Dm755 "${srcdir}/scraper" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${scraperdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  for LIC in $(find "${srcdir}/${scraperdir}/vendor/github.com" -name LICENSE); do
    PKGNAME="$(echo ${LIC} | awk -F "/" '{print $(NF-1)}')"
    install -Dm644 "${LIC}" "${pkgdir}/usr/share/licenses/${pkgname}/license.${PKGNAME}"
  done
}
