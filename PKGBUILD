#!/bin/hint/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=makepkg-cg
_ghuser=ctrlcctrlv
pkgver='0.2.2.pre'
#_pkgver="${pkgver%%.pre}"
_pkgver="$pkgver"
pkgrel=1
pkgdesc="A makepkg wrapper using Control Groups via systemd.resource-control"
arch=('any')
url="https://github.com/${_ghuser}/${pkgname}"
license=('Apache')
depends=('systemd' 'bash')
optdepends=('docker: for makedockerpkg-cg'
            'makechrootpkg: for makechrootpkg-cg')
source=("https://github.com/${_ghuser}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6ab4872547ed053ac4efdb968a7aced85ce620fb46be68127f0425c2bf77ca54f2256428572fb198fc5761137b7f40042ab0c0d439aad017a106a55b21007f26')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make all
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  local INSTALL='install -v'

  mkdir -p "${pkgdir}/usr/share/makepkg-cg"
  ${INSTALL} -Dm644 "inner.sh" "${pkgdir}/usr/share/makepkg-cg/inner.sh"
  # Install the makepkg-cg script
  ${INSTALL} -Dm755 makepkg-cg "${pkgdir}/usr/bin/makepkg-cg"
  command -v makechrootpkg >/dev/null 2>&1 && \
    ${INSTALL} -Dm755 makechrootpkg-cg "${pkgdir}/usr/bin/makechrootpkg-cg" || \
    warning "makechrootpkg not found, not installing makechrootpkg-cg"
  command -v docker >/dev/null 2>&1 && \
    ${INSTALL} -Dm755 makedockerpkg-cg "${pkgdir}/usr/bin/makedockerpkg-cg"
  
  # Install the eBPF program
  # ${INSTALL} -Dm755 makepkg-cg-prio/makepkg-cg-prio.bpf.o "${pkgdir}/usr/share/makepkg-cg/makepkg-cg-prio.bpf.o"

  # Install the makepkg-cg configuration file
  ${INSTALL} -Dm644 "doc/makepkg-cg.conf" "${pkgdir}/usr/share/makepkg-cg/makepkg-cg.conf"

  # Install readme
  ${INSTALL} -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
