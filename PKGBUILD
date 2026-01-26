# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=gittorrent
pkgver=3.4.5
pkgrel=1
pkgdesc="a CLI version control system with a CI/CD pipeline"
arch=("x86_64")
url="https://projectgrid.net/portfolio/gittorrent"
license=("0BSD")
install="advice.install"
source=("${pkgname}-${pkgver}.tar.xz::https://projectgrid.net/archive/${pkgname}-${pkgver}.tar.xz")
sha256sums=('662d223b0052699438e1e0cddd53f22109402a4474ea2a790168f382e66e6bb1')

depends=('libssh2' 'openssl' 'zlib' 'gcc-libs')
makedepends=('cargo' 'pkgconf' 'cmake')
optdepends=("bash-completion: for command line completions when pressing the <tab> key")

options=('!lto')

prepare()
{
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build()
{
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
	export PKG_CONFIG_ALLOW_CROSS=1
	cargo clean
  cargo build --frozen --release --all-features
}

package()
{
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/$pkgname"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
