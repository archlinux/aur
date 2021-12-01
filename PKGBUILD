# Maintainer: Luís Ferreira <contact at lsferreira dot net>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Husam Bilal <me@husam.dev>
# Contributor: Doug Newgard <scimmia@archlinux.info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=arcanist
pkgname=${_pkgname}-ssl-stable-git
pkgver=r2462.59b273fd
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('libphutil' 'php' 'python' 'ca-certificates-utils')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/phacility/arcanist.git#branch=stable"
        "updated-ssl.patch::https://github.com/rashkov/arcanist/commit/e3659d43d8911e91739f3b0c5935598bceb859aa.patch")
sha256sums=('SKIP'
            '038cc4f25938dd344f4518bfc604c2a0d71e71fe7ffdbe5fcea9e4fb1580bf85')

pkgver() {
  cd "$srcdir/arcanist"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/arcanist"
  patch -Np1 < "../updated-ssl.patch"
}

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/" "$pkgdir/usr/bin/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
  install -Dm644 $_pkgname/support/shell/hooks/bash-completion.sh "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s ../share/php/$_pkgname/bin/arc "$pkgdir/usr/bin/arc"
  ln -sf ../../../../../../etc/ssl/cert.pem "$pkgdir/usr/share/php/arcanist/resources/ssl/default.pem"
}
