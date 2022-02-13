# Maintainer: Luís Ferrreira <contact at lsferreira dot net>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=arcanist
pkgname="${_pkgname}-php7-git"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver=r2330.b50a646a
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('php7' 'python')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/phacility/arcanist.git"
        "0001-php7-fix.patch")
sha256sums=('SKIP'
            'c4a1293d77b04597287a9ff60fa9329007b29c3ee73ccedbb43d500a4753a324')

package() {
  cd "$srcdir/$_pkgname"
  patch -Np1 < "../0001-php7-fix.patch"

  grep -nrwe '^#!/usr/bin/env php$' "$srcdir/$_pkgname" | \
    cut -d: -f1 | \
    xargs -I {} sed 's/^\(#!\/usr\/bin\/env php\)$/\17/' -i {}

  install -d "$pkgdir/usr/share/php7/$_pkgname/" "$pkgdir/usr/bin/"
  cp -a * "$pkgdir/usr/share/php7/$_pkgname/"
  ln -s "../share/php7/$_pkgname/bin/arc" "$pkgdir/usr/bin/arc"
}
