# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname='perf-tools'
pkgdesc='Performance analysis tools based on Linux perf_events (aka perf) and ftrace'
pkgver=1.0
pkgrel=1
arch=('any')
url='https://github.com/brendangregg/perf-tools'
depends=('perf')
conflicts=('perf-tools-git')
license=('GPL')
source=(perf-tools-"$pkgver".tar.gz::https://github.com/brendangregg/perf-tools/archive/v"$pkgver".tar.gz)
sha256sums=('2d4e964e9b5d97b0ecf33a4e4e627692b65abeaad1b104976a09c57487c208ee')

package () {
  cd "${pkgname}-${pkgver}"

  local file
  for file in bin/*
  do
    if [[ -L ${file} ]] ; then
      file=$(readlink -f "${file}")
    fi
    local basename=${file##*/}
    install -Dm755 "${file}" "${pkgdir}/usr/bin/${basename}"
    if [[ -r man/man8/${basename}.8 ]]
    then
      install -Dm644 "man/man8/${basename}.8" \
        "${pkgdir}/usr/share/man/man8/${basename}.8"
    fi
  done

  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md examples/*
}
