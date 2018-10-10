# Maintainer: libertylocked <libertylocked@disroot.org>

pkgname=bitwarden-cli-git
_pkgname=bitwarden-cli
pkgver=1.3.0.r21.gbd38107
pkgrel=1
pkgdesc='Bitwarden Command-line Interface'
arch=('x86_64')
url='https://github.com/bitwarden/cli'
license=('GPL3')
makedepends=('nodejs' 'npm')
provides=('bitwarden-cli')
conflicts=('bitwarden-cli')
options=('!strip')
source=("${pkgname}::git+https://github.com/bitwarden/cli.git"
        'jslib::git+https://github.com/bitwarden/jslib.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.jslib.url $srcdir/jslib
  git submodule update
}

build() {
  cd "${pkgname}"

  # Download modules
  npm install

  # Build prod bundle
  npm run build:prod

  # Build binary
  npm run package:lin
}

package() {
  cd "${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "dist/linux/bw" "${pkgdir}/usr/bin/bw"
}
