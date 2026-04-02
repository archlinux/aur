# Maintainer: tam1m <tbacc plus aur at pm dot me>
_pkgname=pipeweaver
pkgname=pipeweaver-app-git
pkgver=r456.840024f
pkgrel=1
pkgdesc="An application wrapper for the Pipeweaver UI"
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipeweaver-git' 'qt6-webengine')
makedepends=('git' 'rust' 'cargo')
conflicts=('pipeweaver-app')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto') # build fails with lto enabled

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build -p pipeweaver-app --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -m755 "target/release/pipeweaver-app" "${pkgdir}/usr/bin/pipeweaver-app"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # pipeweaver.svg is part of pipeweaver-git already. so skipping it here.
  # install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  # install -m644 resources/pipeweaver.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pipeweaver.svg"
  install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  install -m644 app/resources/pipeweaver-icon.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pipeweaver-icon.png"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 app/resources/pipeweaver-icon.png "${pkgdir}/usr/share/pixmaps/pipeweaver-icon.png"
  install -d "${pkgdir}/usr/share/applications"
  install -m644 app/resources/pipeweaver-app.desktop "${pkgdir}/usr/share/applications/pipeweaver-app.desktop"
}

