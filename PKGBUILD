# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=rook
pkgver=0.2.0
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
source=(
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
      	"claphelp.tar.gz::https://hg.sr.ht/~ser/claphelp/archive/v2.3.3.tar.gz"
)

prepare() {
  cd "${srcdir}/claphelp-v2.3.3"
  go build -o "${srcdir}/${pkgname}-v${pkgver}"/makeclapman ./cmd/makeclapman
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS} -s -w" \
    -buildmode=pie .

  mkdir -p man1
  CLAPTRAP_USAGE_JSON=true ./rook | \
    ./makeclapman -d man1 --author "Sean E. Russell" \
      --description "Rook allows you to use a KeePass v2 database as storage for secrets. It provides client and server modes; the server unlocks the database and stays in memory, while the client communicates over a socket with the server and fetches data."
  gzip man1/*
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install      -Dm755 rook              "${pkgdir}"/usr/bin/rook
  install      -Dm644 LICENSE           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install      -Dm644 README.md         "${pkgdir}/usr/share/doc/rook/README.md"
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
sha256sums=('5888ffb49862f8fab25339c3ce049d103a55da7beee7677ebda36c08382df88c'
            'd8721700bb8f1f09bf9334c353eae1023a1cc1b341f2b6723799ddc779ae12c7')
