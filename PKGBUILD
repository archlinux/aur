# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois . archlinux . org>

pkgname=texlive-localmanager-git
pkgver=0.7
pkgrel=2
pkgdesc="A shell and command-line utility to manage TeXLive on Arch Linux"
arch=('any')
url="http://wiki.archlinux.org/index.php?title=TeXLive#TeXLive_Local_Manager"
license=('GPL')
depends=('texlive-core>=2011'
         'perl-libwww'
         'perl-term-shellui'
         'perl-term-readline-gnu'
         'perl-list-moreutils'
         'perl-lwp-protocol-https')
install='tllocalmgr.install'

_giturl="git://projects.archlinux.org/users/remy/${pkgname%-git}.git"
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
  install -d $pkgdir/usr/{bin,share/texmf/arch/tlpkg/TeXLive}
  install -m755 tllocalmgr $pkgdir/usr/bin/
  cd tlpkg/TeXLive
  for _f in *; do
    install -m644 $_f $pkgdir/usr/share/texmf/arch/tlpkg/TeXLive/
  done
}
