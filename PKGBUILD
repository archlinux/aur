# Maintainer: lucas <lucaszhou007@163.com>
#
# Upstream ships fully self-contained Linux tarballs per release:
#   baidu-netdisk-rust        Rust backend (serves the SPA and the API)
#   frontend/                 prebuilt Vue 3 assets
#
# The binary resolves everything relative to its working directory:
#   config/app.toml, downloads/, logs/, wal/, data/
# and looks for the frontend next to the executable, so we install the code
# under /usr/lib/baidupcs-rust and run it with WorkingDirectory pointing at the
# service state directory.  config/app.toml is created by the app on first
# start (with 127.0.0.1:18888 and an absolute download dir), so no config file
# is shipped here.

pkgname=baidupcs-rust-bin
pkgver=2.4.1
pkgrel=2
pkgdesc='Modern Baidu Netdisk client with a Rust backend and Vue 3 web UI (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/komorebiCarry/BaiduPCS-Rust'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=('baidupcs-rust')
conflicts=('baidupcs-rust' 'baidupcs-rust-git')
# upstream ships the binary as-is; do not strip/modify it (namcap then reports
# "unstripped ELF", which is expected for a -bin package)
options=('!strip' '!debug')

_gh='https://github.com/komorebiCarry/BaiduPCS-Rust'

source=("LICENSE::${_gh}/raw/v${pkgver}/LICENSE"
        "baidupcs-rust.service"
        "baidupcs-rust.sysusers"
        "baidupcs-rust.tmpfiles")
sha256sums=('e16b4327f1906f93d4ef790ba2deaadd149a60371d77aee091cce33c4d7b4477'
            '3d1f5c87a77fe0bc45d557b4e1aa4c959b4ef95fcad1586814b4f42b47391587'
            'cc6a08cbf54ddc00d363ab7efbc37fc5a00ec4f35eef163ae7ec8c7631350c8e'
            'eecbf21db30348ed25ba39870d1e2badf870e6741e3117eb86c0b478e25e3408')
sha256sums_x86_64=('7cab3ff52e443371d0747f6853bee298252d2501b02abaa945b501b7a962cfe4')
sha256sums_aarch64=('ecd8db09e0cd42706b87a6024e6568cb6bd5de8917ba473936bc0a069bd5a46c')

# Upstream calls the arm64 asset differently from the makepkg CARCH, so that
# array spells out "arm64" literally (namcap only flags the x86 literal, hence
# $CARCH there; .SRCINFO is generated on x86_64).
source_x86_64=("BaiduPCS-Rust-v${pkgver}-linux-${CARCH}.tar.gz::${_gh}/releases/download/v${pkgver}/BaiduPCS-Rust-v${pkgver}-linux-${CARCH}.tar.gz")

source_aarch64=("BaiduPCS-Rust-v${pkgver}-linux-arm64.tar.gz::${_gh}/releases/download/v${pkgver}/BaiduPCS-Rust-v${pkgver}-linux-arm64.tar.gz")

package() {
  local _release_arch=$CARCH
  [[ $CARCH == aarch64 ]] && _release_arch='arm64'
  local _srcdir="BaiduPCS-Rust-v${pkgver}-linux-${_release_arch}"

  install -Dm755 "$srcdir/$_srcdir/baidu-netdisk-rust" \
    "$pkgdir/usr/lib/baidupcs-rust/baidu-netdisk-rust"
  cp -a "$srcdir/$_srcdir/frontend" "$pkgdir/usr/lib/baidupcs-rust/"

  # frontend lookup also probes the directory of /proc/self/exe, which stays
  # /usr/lib/baidupcs-rust/ when started through this symlink.
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/baidupcs-rust/baidu-netdisk-rust "$pkgdir/usr/bin/baidupcs-rust"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/baidupcs-rust.service" \
    "$pkgdir/usr/lib/systemd/system/baidupcs-rust.service"
  install -Dm644 "$srcdir/baidupcs-rust.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/baidupcs-rust.conf"
  install -Dm644 "$srcdir/baidupcs-rust.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/baidupcs-rust.conf"
}
