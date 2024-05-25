# Maintainer: Cynthetika Open Source <open.source@cynthetika.com>

pkgname=sysget-git
pkgver=2.3.r19.g3d972d1
pkgrel=1
pkgdesc="A front-end providing a bridge to enable a unified syntax for the majority of unix-based operating system package managers - git version"
arch=('any')
url="https://github.com/emilengler/sysget"
license=('GPL')
makedepends=('git')
source=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
sha512sums=('SKIP')
install=sysget.install

pkgver() {
  cd "$srcdir/$_gitname"

  ## generate suitable value for pkgver based on available tag and commit information
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  msg2 " == Starting utility binary build ..."

  ## invoke upstream Makefile to build utility binary
  make
}

package() {
  cd "$srcdir/$_gitname"

  msg2 " == Adding files for packaging ..."

  ## add source repository readme to package documentation
  install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname/" $srcdir/$_gitname/README.md

  ## gzip and add manfile for utility
  if [ -e $srcdir/$_gitname/contrib/man/$_gitname.8 ]; then
    if [ -e $srcdir/$_gitname/contrib/man/$_gitname.8.gz ]; then
      rm $srcdir/$_gitname/contrib/man/$_gitname.8.gz
    fi
    gzip $srcdir/$_gitname/contrib/man/$_gitname.8
  fi
  install -m644 -Dt "$pkgdir/usr/local/man/man8/" $srcdir/$_gitname/contrib/man/$_gitname.8.gz

  ## add Bash completion definition
  install -m644 -D "$srcdir/$_gitname/contrib/$_gitname.bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_gitname"

  ## naturally, add freshly-built utility binary
  install -m755 -Dt "$pkgdir/usr/bin/" $srcdir/$_gitname/$_gitname
}
