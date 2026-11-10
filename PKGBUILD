# Maintainer: httpanimations

pkgname=t3-code-git
pkgver=0.1.8.r59.g633438d
pkgrel=1
pkgdesc='Minimal web GUI for coding agents (desktop app, git build)'
arch=('x86_64')
url='https://github.com/pingdotgg/t3code'
license=('MIT')
options=('!strip' '!debug')
provides=('t3-code')
conflicts=('t3-code')
depends=('fuse2' 'libsecret')
makedepends=(
  'git' 'nodejs>=26.12.1' 'npm' 'python' 'gcc' 'make'
  'vite-plus>=1.4.0' 'rust' 'pkgconf' 'imagemagick'
)
source=(
  "git+https://github.com/pingdotgg/t3code.git"
  "t3-code.desktop"
  "t3-code.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/t3code"
  local desc rest count hash tag

  desc=$(git describe --long --tags --abbrev=7 --match='v[0-9]*' --exclude='*nightly*' --exclude='*preview*' 2>/dev/null) || {
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    return
  }

  hash=${desc##*-g}
  rest=${desc%-g*}
  count=${rest##*-}
  tag=${rest%-${count}}
  tag=${tag%-}
  tag=${tag#v}
  tag=${tag//-/.}

  printf '%s.r%s.g%s' "${tag}" "${count}" "${hash}"
}

build() {
  cd "${srcdir}/t3code"
  vp install --frozen-lockfile
  vp run dist:desktop:linux
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
  install -m644 "${srcdir}/t3code/assets/prod/black-universal-1024.png" "${pkgdir}/usr/share/pixmaps/t3-code.png"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/t3code/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
