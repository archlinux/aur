# Maintainer: aNNiMON <annimon119 at gmail dot com>
_pkgauthor=aNNiMON
pkgname=effy
pkgver=0.11.0
pkgrel=1
pkgdesc="A small and friendly terminal FFmpeg helper that simplifies common tasks"
url="https://projects.annimon.com/projects/effy/"
license=('MIT')
makedepends=('cargo')
depends=('ffmpeg' 'gcc-libs' 'glibc')
optdepends=('wl-clipboard: copy commands on Wayland'
            'xclip: copy commands on X11'
            'xsel: copy commands on X11 (xclip alternative)')
arch=('x86_64' 'aarch64')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ba6c192ce91b4da19bb8d96e6d10b741e761909388a242b40937010a0a9fc15b9add11959793671023b3dd84b8eb4fee6399d8a3dbb8f03e6ff4461ea8fd5612')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features --all-targets
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
