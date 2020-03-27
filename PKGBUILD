# Maintainer: Brate Z <bratekannkarate at gmail dot com>

_pkgname=coronavirus-tracker-cli
pkgname="$_pkgname"-git
pkgver=r131.1ea59c3
pkgrel=1
pkgdesc="Track The Coronavirus from your CLI"
url="https://github.com/sagarkarira/coronavirus-tracker-cli"
license=('WTFPL')
arch=(any)
depends=('nodejs')
makedepends=('npm' 'jq' 'git')
source=("git+$url.git")
md5sums=('SKIP')

package() {
    npm install -g --user root --prefix "$pkgdir"/usr $(npm pack "./$_pkgname" | tail -1)

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
