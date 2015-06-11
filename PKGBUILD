# Maintainer:  jyantis <yantis@yantis.net>

pkgname=nodejs-normit-git
pkgver=1.0.8.r97.d445ed3
pkgrel=2
pkgdesc='Google translate with speech synthesis in your terminal as node package'
arch=('any')
url='https://github.com/pawurb/normit'
license=('custom')
depends=('nodejs' 'mpg123')
source=('git+https://github.com/pawurb/normit.git')
_repo="git://github.com/pawurb/normit.git"
sha256sums=('SKIP')
makedepends=('git')
provides=('nodejs-normit')
conflicts=('nodejs-normit')

pkgver() {
  cd normit
  printf "%s." "$(grep -Ri "version" package.json | awk -F\" '{print $4}')" | sed 's/-/./g'

  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd normit

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install Readme as license since no license but maybe they will update this in the future
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # the module
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_repo
}

# vim:set ts=2 sw=2 et:
