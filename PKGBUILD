# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>

pkgname=svgbob-git
pkgver=0.4.1.r324.c3e84c8
pkgrel=1
pkgdesc='Convert your ascii diagram scribbles into happy little SVG'
arch=('i686' 'x86_64')
url="https://github.com/ivanceras/svgbob"
license=('Apache')
depends=('gcc-libs')
conflicts=('svgbob')
provides=('svgbob')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/ivanceras/svgbob.git"
  "https://patch-diff.githubusercontent.com/raw/ivanceras/svgbob/pull/41.patch"
	"https://patch-diff.githubusercontent.com/raw/ivanceras/svgbob/pull/43.patch")
sha1sums=('SKIP'
          '594ca54a020e4427ecb7ca6b12b8a7f4ff2deadd'
          'bfdbff3e0c6c2f42bb445e4d48490c2c6ecd226c')

pkgver() {
    cd "${srcdir}/svgbob"
    printf "%s.r%s.%s" "$(grep version svgbob_cli/Cargo.toml | sed -e "s/version = \"//" -e "s/\"//")"\
                       "$(git rev-list --count HEAD)"\
                       "$(git rev-parse --short HEAD)"
}

prepare() {
    msg2 "Applying PR #41 and #43"
    cat {41,43}.patch | patch -p1 -d "${srcdir}/svgbob"
}


build() {
  cd "${srcdir}/svgbob/svgbob_cli"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/svgbob/svgbob_cli/target/release/svgbob" "${pkgdir}/usr/bin/svgbob"
  install -Dm644 "${srcdir}/svgbob/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
