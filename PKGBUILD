# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

#  shellcheck disable=SC2034
pkgname=jetporch-git
pkgver=0.0.1.r126.g565e639
pkgrel=1
pkgdesc='Jet is a general-purpose, community-driven IT automation platform for configuration, deployment, orchestration, patching, and arbitrary task execution workflows.'
#arch=('i686' 'x86_64' 'armv6h')
arch=('x86_64')
url='https://www.jetporch.com/'
license=('GPL')
#depends=('')
makedepends=('git' 'rust' 'cargo' 'openssl')
#optdepends=('')
provides=("jetporch=$pkgver")
conflicts=('jetporch')
source=('git+https://git.sr.ht/~mpdehaan/jetporch')
b2sums=('SKIP')
_gitname=${pkgname%-git}

pkgver () {
  cd "$_gitname"
  # Add tag from GH mirror to SH source repo; https://github.com/jetporch/jetporch/releases/tag/v0.0.1
  git tag | grep -Fq 'v0.0.1' || git tag 'v0.0.1' 9bf80bd4
  git describe --long --tags --abbrev=7 --match='v[0-9]*' |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  install -Dm755 target/release/jetp "${pkgdir}/usr/bin/jetp"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  cp -R examples "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
