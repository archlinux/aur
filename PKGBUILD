# Maintainer: httpanimations

pkgname=t3-code-git
pkgver=0.0.17.r54.gd22c6f5
pkgrel=2
pkgdesc='Minimal web GUI for coding agents (desktop app, git build)'
arch=('x86_64')
url='https://github.com/pingdotgg/t3code'
license=('MIT')
options=('!strip' '!debug')
provides=('t3-code')
conflicts=('t3-code')
depends=('fuse2')
makedepends=('git' 'bun' 'nodejs' 'npm' 'python' 'gcc' 'make')
source=(
  "git+https://github.com/pingdotgg/t3code.git"
  "t3-code.desktop"
  "t3-code.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/t3code"
  local desc rest count hash tag

  desc=$(git describe --long --tags --abbrev=7 --exclude='nightly*' 2>/dev/null) || {
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    return
  }

  hash=${desc##*-g}
  rest=${desc%-g*}
  count=${rest##*-}
  tag=${rest%-${count}}
  tag=${tag%-}
  tag=${tag#nightly-v}
  tag=${tag#v}
  tag=${tag//-/.}

  printf '%s.r%s.g%s' "${tag}" "${count}" "${hash}"
}

build() {
  cd "${srcdir}/t3code"
  bun install --frozen-lockfile
  bun run dist:desktop:linux
}

package() {
  cd "${srcdir}/t3code"

  install -d "${pkgdir}/opt/t3-code"
  install -m755 "${srcdir}/t3code/release/"*.AppImage "${pkgdir}/opt/t3-code/t3-code.AppImage"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/t3-code.sh" "${pkgdir}/usr/bin/t3-code"

  install -d "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/t3-code.desktop" "${pkgdir}/usr/share/applications/t3-code.desktop"

  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/t3code/apps/desktop/resources/icon.png" "${pkgdir}/usr/share/pixmaps/t3-code.png"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/t3code/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
