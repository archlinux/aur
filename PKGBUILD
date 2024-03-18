# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=rook
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight, stand-alone, headless secret service tool backed by a Keepass v2 database."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/rook"
license=(BSD 3-clause)
depends=(glibc)
makedepends=(go)
optdepends=('ripgrep: text search, for autotype'
            'zsh: shell scripting, for autotype'
            'xdotool: X input tool, for autotype & getAttr'
            'rofi: GUI multiple choice selection, for autotype & getAttr'
            'fzf: CLI multiple choice selection, for getAttr'
            'xorg-xprop: X window information, for autotype'
            'yad: dialog tool, for autotype'
            'xsel: X clipboard tool, for getAttr'
            'util-linux: for the column formatting command, for getAttr')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS} -s -w" \
    -buildmode=pie .
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-v${pkgver}/rook "${pkgdir}"/usr/bin/rook
	(type rg && type xdotool && type xprop && type yad && type zsh && type rofi) > /dev/null && \
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/utils/autotype.sh" "${pkgdir}/usr/bin/rook-autotype"
	# test for optional dependencies
	(type rofi && type xsel && type xdotool && type column) > /dev/null && \
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/utils/getAttr.sh" "${pkgdir}/usr/bin/rook-getattr"
  install -Dm644 "${srcdir}"/${pkgname}-v${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-v${pkgver}/README.md" "${pkgdir}/usr/share/doc/rook/README.md"
}
sha256sums=('c258a54146d4665c37c9dcd87fd74aad35532bdcfca2e333005b3672109de1c4')
