# Maintainer: ibrahim Tunali<ibrahimtunali@gmail.com>
pkgname=git-secret
pkgver=0.2.4
pkgrel=1
pkgdesc="A bash-tool to store your private data inside a git repository"
arch=('any')
url="https://github.com/sobolevn/git-secret"
license=('GPL')
groups=()
depends=('git' 'gnupg')
makedepends=('git' 'ruby-ronn')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/sobolevn/git-secret.git
_gitname=git-secret

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && git checkout "v$pkgver"
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" -b "v$pkgver"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make build
  make build-man
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m644 man/man1/*.1 -t $pkgdir/usr/share/man/man1/
  install -D -m644 man/man7/*.7 -t $pkgdir/usr/share/man/man7/
  install -D -m755 git-secret.plugin.zsh -t $pkgdir/usr/share/zsh/plugins/
  install -D -m755 git-secret -t $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
