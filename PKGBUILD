# Maintainer: Dominik Fischer <d dot f dot fischer at web dot de>
pkgname=git-makepkg-template-git
pkgver=r0
pkgrel=1
pkgdesc="makepkg-template for git source packages"
arch=('any')
url="https://github.com/dffischer/git-makepkg-template"
license=('GPL')
depends=('pacman>=4.1.2' 'git')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  install -m644 -Dt "$pkgdir/usr/share/$pkgname/" README.md PKGBUILD
  local destdir="$pkgdir/usr/share/makepkg-template"
  find -iname '*.template' -type f -exec install -m644 -Dt "$destdir" '{}' +
  cd "$destdir"
  for file in *
  do
    ln -s $file ${file%-*.template}.template
  done
}
