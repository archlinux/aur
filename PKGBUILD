# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributor: Gordon Schulz <gordon.schulz@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=physlock-git
_pkgname='physlock'
pkgver=v13.r5.g4541222
pkgrel=1
pkgdesc="lightweight linux console locking tool"
arch=('x86_64')
license=('GPL')
url="https://github.com/muennich/physlock"
depends=('pam')
makedepends=('git')
provides=('physlock')
conflicts=('physlock')
source=("${_pkgname}::git+${url}.git"
        'physlock.pam')
sha512sums=('SKIP'
            '51f35b2b736d8b601a6ea42c038ab0f498225ce4e392eeb35fdcec4a51a7a492a836de451a28565a27dea694a4a29ac4de7ea2c8852bba63cad58710641557fe')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  make PREFIX="/usr" -C "${_pkgname}"
}

package() {
  install -D -m 644 physlock.pam "$pkgdir/etc/pam.d/physlock"
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C "${_pkgname}" install
}

