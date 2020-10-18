# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=git-subrepo-xdg
pkgver=0.4.1
pkgrel=3
pkgdesc="Git Submodule alternative"
arch=('any')
url="https://github.com/ingydotnet/git-subrepo"
license=('MIT')
depends=('git')
provides=("git-subrepo")
conflicts=("git-subrepo")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('64cc2490c54fe1e5396bb14f6bbf0aa8378085f3b8847fd8ed171e5ddd886065')

package() {
  sed -i '7 i BASH_SOURCE=/usr/bin' $srcdir/git-subrepo-${pkgver}/lib/git-subrepo
  sed -i '20 i SOURCE_DIR=/usr/lib/git-subrepo' $srcdir/git-subrepo-${pkgver}/lib/git-subrepo

  install -Dt $pkgdir/usr/bin/ $srcdir/git-subrepo-${pkgver}/lib/git-subrepo

  install -d $pkgdir/usr/lib/git-subrepo
  cp -a $srcdir/git-subrepo-${pkgver}/lib/git-subrepo.d $pkgdir/usr/lib/git-subrepo

  # TODO (maybe): package bashplus separately (https://github.com/ingydotnet/bashplus)
  rm $pkgdir/usr/lib/git-subrepo/git-subrepo.d/bash+.bash
  cp -a $srcdir/git-subrepo-${pkgver}/ext/bashplus/lib/bash+.bash $pkgdir/usr/lib/git-subrepo/git-subrepo.d/

  install -d $pkgdir/usr/share/man/man1
  gzip -c $srcdir/git-subrepo-${pkgver}/man/man1/git-subrepo.1 > $pkgdir/usr/share/man/man1/git-subrepo.1.gz

  # TODO: completions
  install -d $pkgdir/usr/share/zsh/site-functions
  sed -i '6,9d' $srcdir/git-subrepo-${pkgver}/share/zsh-completion/_git-subrepo
  cp -a $srcdir/git-subrepo-${pkgver}/share/zsh-completion/_git-subrepo $pkgdir/usr/share/zsh/site-functions

  # not sure about these, I don't use bash :)
  # Note: seems to work like git-annex; may need to install bash-completion to enable
  install -d $pkgdir/usr/share/bash-completion/completions
  cp -a $srcdir/git-subrepo-${pkgver}/share/completion.bash $pkgdir/usr/share/bash-completion/completions/git-subrepo

  # MIT license
  install -Dm644 $srcdir/git-subrepo-${pkgver}/License "$pkgdir/usr/share/licenses/$pkgname/License"
}

