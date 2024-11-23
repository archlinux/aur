# Maintainer: Rin <icealtria at gmail dot com>

pkgbase=geph5-git
_pkgbase=geph5
pkgname=(
         #'geph5-bridge-git'
         #'geph5-broker-git'
         'geph5-client-gui-git'
         'geph5-client-git'
         #'geph5-exit-git'
         )
pkgver=r685.a04eff8
pkgrel=1
pkgdesc="Geph is a modular Internet censorship circumvention system designed specifically to deal with national filtering."
arch=('x86_64')
url="https://github.com/geph-official/geph5"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("git+${url}.git"
        "https://raw.githubusercontent.com/geph-official/gephgui/master/public/gephlogo.png"
        "geph5-client.service"
        'geph5-client@.service'
        "geph5-client-gui.desktop")
md5sums=('SKIP'
         '4655e64a5d56c316383e1ffa79ddc772'
         '02a4c190230663efc619f42b75ec817c'
         '9cb39de202d985699357f7a6830b8779'
         '374b014018c671a40c3a2b81d1334121')

pkgver() {
  cd "${srcdir}"/"${_pkgbase}"/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${srcdir}"/"${_pkgbase}"/
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS+=" -ffat-lto-objects" # https://github.com/launchbadge/sqlx/issues/3149
  cd "${srcdir}"/"${_pkgbase}"/
  cargo build --frozen --release --manifest-path binaries/geph5-client/Cargo.toml
  cargo build --frozen --release --manifest-path binaries/geph5-client-gui/Cargo.toml
}

package_geph5-client-git() {
  cd "${srcdir}"/"${_pkgbase}"/
  provides=('geph5-client')
  conflicts=('geph5-client')
  install -Dm0644 "${srcdir}"/geph5-client@.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm0644 "${srcdir}"/geph5-client.service -t "${pkgdir}"/usr/lib/systemd/user/
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/geph5-client"
}

package_geph5-client-gui-git() {
  provides=('geph5-client-gui')
  conflicts=('geph5-client-gui')
  install -Dm0644 "${srcdir}/gephlogo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/geph5-client-gui.png"
  install -Dm0644 geph5-client-gui.desktop "$pkgdir/usr/share/applications/geph5-client-gui.desktop"
  cd "${srcdir}/${_pkgbase}/"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/geph5-client-gui"
}
