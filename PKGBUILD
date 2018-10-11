# Maintainer: libertylocked <libertylocked@disroot.org>

pkgname=bitwarden-cli-git
_pkgname=bitwarden-cli
pkgver=1.3.0.r21.gbd38107
pkgrel=2
pkgdesc='Bitwarden Command-line Interface'
arch=('x86_64')
url='https://github.com/bitwarden/cli'
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('nodejs')
provides=('bitwarden-cli')
conflicts=('bitwarden-cli')
options=('!strip')
source=("${_pkgname}-git-repo::git+https://github.com/bitwarden/cli.git"
        'jslib-git-repo::git+https://github.com/bitwarden/jslib.git'
        'bw.sh')
sha512sums=('SKIP'
            'SKIP'
            '71729c0ee95429ab03fa586de6bbf8ebad29d6d5544775564bb35eaa68cc4a915007db54b5928e99234bfe7828491829a5d32750f641056a0b68e05aa842f9ee')

pkgver() {
  cd "${_pkgname}-git-repo"
  git describe --long --tags | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
