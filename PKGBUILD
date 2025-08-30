# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=rook
pkgver=0.4.3
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

  rm -rf man1
  
  go generate

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -s -w" \
    -buildmode=pie .

  gzip man1/*
}

check() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  test "$(./${pkgname} version)" = "$pkgname v${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install      -Dm755 rook              "${pkgdir}"/usr/bin/rook
  install      -Dm644 LICENSE           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install      -Dm644 README.md         "${pkgdir}/usr/share/doc/rook/README.md"
  install      -Dm644 CHANGELOG.md         "${pkgdir}/usr/share/doc/rook/CHANGELOG.md"
  install      -Dm644 SECURITY.md         "${pkgdir}/usr/share/doc/rook/SECURITY.md"
  install      -Dm644 man1/*         -t "${pkgdir}"/usr/share/man/man1/
  # Install utility apps IFF the dependencies exist. Always return true.
	(type rg && type xdotool && type xprop && type yad && type zsh && type rofi) > /dev/null \
    && install -Dm755 utils/autotype.sh "${pkgdir}/usr/bin/rook-autotype" \
    || true
  # Install utility apps IFF the dependencies exist. Always return true.
	(type rofi && type xsel && type xdotool && type column) > /dev/null \
    && install -Dm755 utils/getAttr.sh  "${pkgdir}/usr/bin/rook-getattr" \
    || true
}
sha256sums=('a60df2af6946743cbf890f1e51808cbb8a542af615fb76b79ce1ffadc1f433e9')
