# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=arcanist
pkgver=2024.35
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://phorge.it/"
license=('Apache')
depends=('php' 'python' 'ca-certificates-utils')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
source=("git+https://github.com/phorgeit/arcanist.git#tag=${pkgver}"
        "0001-Fix-implicitly-nullable-parameter-declarations-for-P.patch"
        "0002-Fix-implicitly-nullable-parameter-declarations-for-P.patch")
sha256sums=('2f9eddd9f7e61e5dc5b6a347fb38c004e4645c32117f54cc85cbd0c368158b09'
            'bdeb18382103dc4cf343b92a1c5c449811a45da7d6ad5447290438d0e9bcf9f4'
            '2d5b288fa33eb662a2d0cf0b9b2226bb068cf4eac760a471055a07b04bb48ba2')

package() {
  (
    cd "$srcdir/$pkgname"
    patch -p1 -i "$srcdir/0001-Fix-implicitly-nullable-parameter-declarations-for-P.patch"
    patch -p1 -i "$srcdir/0002-Fix-implicitly-nullable-parameter-declarations-for-P.patch"
  )

  install -d "$pkgdir/usr/share/php/$pkgname/" "$pkgdir/usr/bin/"
  cp -a $pkgname/* "$pkgdir/usr/share/php/$pkgname/"
  install -Dm644 $pkgname/support/shell/hooks/bash-completion.sh "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s ../share/php/$pkgname/bin/arc "$pkgdir/usr/bin/arc"
  ln -sf ../../../../../../etc/ssl/cert.pem "$pkgdir/usr/share/php/arcanist/resources/ssl/default.pem"
}
