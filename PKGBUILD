# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>

pkgbase=immortal-barons
pkgname=('immortal-barons' 'immortal-barons-sysop')
pkgver=0.2.3
pkgrel=1
pkgdesc='Persistent multiplayer BBS door game inspired by Barren Realms Elite'
arch=('x86_64')
url='https://github.com/andy5995/immortal-barons'
license=('MIT')
makedepends=(
  'go'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-headers'
  'wayland'
)
# The vendored-source asset, not the tag archive: the repo does not commit
# vendor/, so this is the one that builds without downloading modules.
source=("${url}/releases/download/v${pkgver}/${pkgbase}-v${pkgver}-vendored-source.tar.gz")
sha256sums=('36d780a1511766d6d3ce528898cda72c021c284eca82002f1057075f5e247ee8')

build() {
  cd "${pkgbase}-v${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

  go build -ldflags "-linkmode=external" -o immortal-barons ./cmd/immortal-barons
  # The sysop panel is its own Go module with its own vendor/ directory.
  go build -C cmd/ib-sysop -ldflags "-linkmode=external" -o ../../ib-sysop
}

check() {
  cd "${pkgbase}-v${pkgver}"
  go test -mod=vendor ./...
}

package_immortal-barons() {
  depends=('glibc')

  cd "${pkgbase}-v${pkgver}"
  install -Dm755 immortal-barons -t "${pkgdir}/usr/bin"
  install -Dm644 README.md ChangeLog install-xtrn.ini \
    -t "${pkgdir}/usr/share/doc/immortal-barons"
  install -Dm644 docs/*.md -t "${pkgdir}/usr/share/doc/immortal-barons/docs"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/immortal-barons"
}

package_immortal-barons-sysop() {
  pkgdesc='Desktop sysop panel for Immortal Barons'
  # The panel runs the game binary for every command it offers.
  depends=(
    'glibc'
    "immortal-barons=${pkgver}-${pkgrel}"
    'libglvnd'
    'libx11'
    'libxcursor'
    'libxfixes'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
  )

  cd "${pkgbase}-v${pkgver}"
  install -Dm755 ib-sysop -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/immortal-barons-sysop"
}
