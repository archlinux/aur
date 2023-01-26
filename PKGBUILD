# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libredefender-git
pkgver=0.6.0.r2.ge9fac36
pkgrel=1
pkgdesc='Light-weight antivirus scanner for Linux (-git version)'
url='https://github.com/kpcyrd/libredefender'
arch=('x86_64')
license=('GPL2')
provides=('libredefender')
conflicts=('libredefender')
depends=('libclamav.so' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'git')
source=(git+https://github.com/kpcyrd/libredefender.git clamav-1.0.patch)
b2sums=('SKIP' '0850e5af585e13b95041ee7f6e0b392293102c2cbc94b9b4fcd7afa5e2cfcb93cfda1403fe638a154a6254a611cfe99bf0b6ea588ec939b0b9cf8adf4fef95e2')

pkgver() {
  cd libredefender
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd libredefender
  patch -i ../clamav-1.0.patch
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd libredefender
  cargo build --frozen --release
}

check() {
  cd libredefender
  cargo test --frozen
}

package() {
  cd libredefender
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/libredefender

  # install completions
  install -d "${pkgdir}/usr/share/bash-completion/completions" \
             "${pkgdir}/usr/share/zsh/site-functions" \
             "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${pkgdir}/usr/bin/libredefender" completions bash > "${pkgdir}/usr/share/bash-completion/completions/libredefender"
  "${pkgdir}/usr/bin/libredefender" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_libredefender"
  "${pkgdir}/usr/bin/libredefender" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/libredefender.fish"

  install -Dm 644 contrib/libredefender.desktop -t "${pkgdir}/etc/xdg/autostart"
  install -Dm 644 contrib/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/libredefender.svg"
  install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/libredefender"
}

# vim: ts=2 sw=2 et:
