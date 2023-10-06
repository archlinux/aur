# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

#  shellcheck disable=SC2034
pkgname=jetporch-git
pkgver=r236.50a0f04
pkgrel=1
pkgdesc='Jet is a general-purpose, community-driven IT automation platform for configuration, deployment, orchestration, patching, and arbitrary task execution workflows.'
#arch=('i686' 'x86_64' 'armv6h')
arch=('x86_64')
url='https://www.jetporch.com/'
license=('GPL')
depends=('pkg-config')
makedepends=('git' 'rust' 'cargo' 'openssl')
#optdepends=('')
provides=('jetporch')
conflicts=('jetporch')
replaces=('jetporch')
source=('git+https://git.sr.ht/~mpdehaan/jetporch')
b2sums=('SKIP')
_gitname=${pkgname%-git}

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  install -Dm755 target/release/jetp "${pkgdir}/usr/bin/jetp"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
