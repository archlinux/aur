# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wordpress-git
pkgver=5.2.1.r75.gce21465841
pkgrel=2
pkgdesc="Blog tool, publishing platform and CMS"
arch=('any')
url="https://wordpress.org/"
license=('GPL')
depends=('php')
makedepends=('git')
optdepends=('apache: Web server for serving WordPress'
            'mariadb: Database server'
            'nginx: Web server for serving WordPress')
provides=('wordpress')
conflicts=('wordpress')
install=wordpress.install
source=("git://core.git.wordpress.org/"
        "password_reset_exploit.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/password_reset_exploit.patch?h=packages/wordpress")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "core"

  patch -Np1 -i "$srcdir/password_reset_exploit.patch"
}

pkgver() {
  cd "core"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

package() {
  cd "core"

  install -d "$pkgdir/usr/share/webapps/wordpress"
  cp -r ./* "$pkgdir/usr/share/webapps/wordpress"
}
