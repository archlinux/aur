# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=parcimonie-git
pkgver=20130224
pkgrel=1
pkgdesc="A tool that incrementally refreshes a GnuPG keyring"
arch=('any')
url="https://gaffer.ptitcanardnoir.org/intrigeri/code/parcimonie/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-any-moose' 'perl-namespace-autoclean'
         'perl-gnupg-interface' 'perl-clone' 'perl-config-general'
         'perl-file-homedir' 'perl-path-class' 'perl-net-dbus'
         'perl-tie-cache' 'perl-time-duration-parse'
         'perl-moosex-types-path-class' 'perl-moosex-getopt')
makedepends=('git')
provides=('parcimonie')

_gitroot=git://gaffer.ptitcanardnoir.org/App-Parcimonie.git
_gitname=parcimonie

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  git checkout debian

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_gitname-build"

  perl Build install
}

# vim:set ts=2 sw=2 et:
