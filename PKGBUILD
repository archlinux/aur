# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="syzygy"
_pkgname="system-${_binname}"
pkgname="${_pkgname}-git"
pkgver=1.0.2.r0.g8eabf33
pkgrel=1
pkgdesc="A narrative meta-puzzle game"
arch=('x86_64')
url="https://mdsteele.games/syzygy"
_url="https://github.com/mdsteele/${_binname}"
license=('GPL-3.0-or-later')
makedepends=('git' 'cargo' 'gendesk')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'sdl2')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_binname}"
source=("${_pkgsrc}"::"git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"
  gendesk -f \
    --pkgname "${_binname}" \
    --name "System Syzygy" \
    --exec "/usr/bin/${_binname}" \
    --icon "${_binname}" \
    --categories "Game" \
    --comment "${pkgdesc}"

  cd "${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}"
  install -Dm644 "${_binname}.desktop" "${pkgdir}/usr/share/applications/${_binname}.desktop"

  cd "${_pkgsrc}"
  install -Dm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "data/icon"
  for _icon in 32x32 128x128 512x512 512x512@2x; do
    install -Dm644 "${_icon}.png" "${pkgdir}/usr/share/icons/hicolor/${_icon//@2x/@2}/apps/${_binname}.png"
  done
}
