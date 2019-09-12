# Maintainer: libertylocked <libertylocked@disroot.org>

pkgname=bitwarden-cli-git
_pkgname=bitwarden-cli
pkgver=1.7.4.r17.g3915e43
pkgrel=1
pkgdesc='Bitwarden Command-line Interface'
arch=('x86_64')
url='https://github.com/bitwarden/cli'
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('nodejs')
conflicts=('bitwarden-cli')
options=('!strip')
source=("${_pkgname}-git-repo::git+https://github.com/bitwarden/cli.git"
        'jslib-git-repo::git+https://github.com/bitwarden/jslib.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}-git-repo"
  git describe --long --tags | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rmdir "${srcdir}/${_pkgname}-git-repo/jslib"
  ln -s "${srcdir}/jslib-git-repo" "${srcdir}/${_pkgname}-git-repo/jslib"
  sed -i 's/"postinstall": "npm run sub:init",//' "${_pkgname}-git-repo/package.json"
}

build() {
  cd "${_pkgname}-git-repo"
  npm install
  npm run dist:lin
}

package() {
  cd "${_pkgname}-git-repo"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 ./dist/linux/bw "${pkgdir}/usr/bin/bw"
}
