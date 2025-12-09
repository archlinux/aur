# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=markdown-pdf
pkgname=nodejs-$_npmname
pkgver=11.0.0
pkgrel=2
pkgdesc="Markdown to PDF converter"
arch=('any')
url="https://github.com/alanshaw/markdown-pdf"
license=('MIT')
depends=('nodejs' 'phantomjs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('9916faec08dd3d8300622ea36447866fb299eecc')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
