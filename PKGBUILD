# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
_pkgname=bitwarden-cli
pkgver=1.3.0
pkgrel=2
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('nodejs')
conflicts=('bitwarden-cli-git')
options=('!strip')
source=("${_pkgname}-git-repo::git+https://github.com/bitwarden/cli.git#tag=v${pkgver}"
        'jslib-git-repo::git+https://github.com/bitwarden/jslib.git'
        'bw.sh')
sha512sums=('SKIP'
            'SKIP'
            '71729c0ee95429ab03fa586de6bbf8ebad29d6d5544775564bb35eaa68cc4a915007db54b5928e99234bfe7828491829a5d32750f641056a0b68e05aa842f9ee')

prepare() {
  cd "${_pkgname}-git-repo"
  git submodule init
  git config submodule.jslib.url $srcdir/jslib-git-repo
  git submodule update
}

build() {
  cd "${_pkgname}-git-repo"
  npm install
  npm run build:prod
}

package() {
  cd "${_pkgname}-git-repo"
  
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a build/. "${pkgdir}/usr/lib/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/bw.sh" "${pkgdir}/usr/bin/bw"
}
