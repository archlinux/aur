# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>

pkgname=telegram-acp-git
_pkgname=telegram-acp
pkgver=0.2.0.r56.g6840ed7
pkgrel=1
pkgdesc='Bridge Telegram and ACP coding agents'
arch=('x86_64')
url='https://github.com/SuperKenVery/Telegram-ACP'
license=('GPL-3.0-only')
depends=('gcc-libs'
         'glibc'
         'gtk3'
         'libappindicator'
         'libx11'
         'openssl'
         'xdotool')
makedepends=('cargo'
             'git'
             'pkgconf')
provides=("telegram-acp")
conflicts=('telegram-acp')
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'b44262d25846b14ede73f50d207a0fe9ac7e7f4b50e7ca9567f412b59b0f1237')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local version revision
  version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)
  revision=$(git rev-list --count "$(git describe --abbrev=0 --tags)"..HEAD)
  printf '%s.r%s.g%s' "$version" "$revision" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  CARGO_TARGET_DIR=target cargo build --frozen --release --bin telegram-acp
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 target/release/telegram-acp "${pkgdir}/usr/bin/telegram-acp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
