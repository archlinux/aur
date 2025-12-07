# Maintainer: tam1m <tbacc plus aur at pm dot me>
_pkgname=pipeweaver
pkgname=${_pkgname}-git
pkgver=r316.45d0579
pkgrel=1
pkgdesc="An audio management tool for Linux built on top of PipeWire, designed specifically with streaming and broadcasting in mind."
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipewire')
makedepends=('git' 'rust' 'cargo' 'clang' 'npm')
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto') # build fails with lto enabled

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -m755 "target/release/pipeweaver-daemon" "${pkgdir}/usr/bin/pipeweaver-daemon"
  # install -m755 "target/release/pipeweaver-client" "${pkgdir}/usr/bin/pipeweaver-client"
  # install -m755 "target/release/pipeweaver-app" "${pkgdir}/usr/bin/pipeweaver-app"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m644 daemon/resources/icons/pipeweaver.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pipeweaver.svg"
  install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  install -m644 daemon/resources/icons/pipeweaver.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pipeweaver.png"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 daemon/resources/icons/pipeweaver-large.png "${pkgdir}/usr/share/pixmaps/pipeweaver.png"
  install -d "${pkgdir}/usr/share/applications"
  install -m644 daemon/resources/desktop/pipeweaver.desktop "${pkgdir}/usr/share/applications/pipeweaver.desktop"
}


