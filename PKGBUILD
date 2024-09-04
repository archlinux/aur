# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_pkgname="doctoc"
pkgname="$_pkgname-git"
pkgver=2.6.4.r0.ga973f88
pkgrel=1
pkgdesc="Generates table of contents for markdown files inside local git repository"
arch=('any')
url="https://github.com/technote-space/doctoc"
license=('MIT')

depends=(
  'nodejs'
)
makedepends=(
  'git'
  'npm'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"

  install -dm755 "$pkgdir/usr"
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz

  find "$pkgdir" -name "package.json" -exec sed -e "s&(${pkgdir}|${srcdir})&&" -i {} \;

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
