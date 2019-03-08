# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=balena-cli-git
pkgdesc='balena.io command line interface, development version'
pkgver=9.14.5.r0.gf356550
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
license=('APACHE')
depends=('nodejs')
makedepends=('npm' 'git' 'python2')
source=('git+https://github.com/balena-io/balena-cli.git')
options=(!strip)
optdepends=('python: balena-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
provides=('balena-cli')
conflicts=('balena-cli')
replaces=('resin-cli-git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"

  _branch=$(git rev-parse --abbrev-ref HEAD)
  git archive --format=tar --prefix=${pkgname%-git}/ ${_branch} | gzip >"${srcdir}/${pkgname}.tar.gz"

  npm install --global -user root --prefix "${pkgdir}/usr" "$srcdir/${pkgname}.tar.gz"
}
