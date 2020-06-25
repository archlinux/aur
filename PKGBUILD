# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Peter <craven@gmx.net>
pkgname=gerbil-scheme-git
pkgver=0.12
pkgrel=4
pkgdesc="Gerbil is an opinionated dialect of Scheme designed for Systems Programming, with a state of the art macro and module system on top of the Gambit runtime."
arch=(x86_64 i686)
url="https://github.com/vyzo/gerbil"
license=('LGPLv2.1' 'Apache 2.0')
groups=()
depends=('gambit-c')
makedepends=('git' 'gambit-c')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()



noextract=()
#generate with 'makepkg -g'

_gitroot=https://github.com/vyzo/gerbil.git
_gitname=gerbil

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  mkdir -p binx
  ln -s /usr/bin/gambitc binx/gsc
  export PATH=$(pwd)/binx:$PATH
  cd src/
  ./build.sh
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p ${pkgdir}/opt/gerbil-scheme-git
  cp -R bin ${pkgdir}/opt/gerbil-scheme-git/bin
  cp -R doc ${pkgdir}/opt/gerbil-scheme-git/doc
  cp -R etc ${pkgdir}/opt/gerbil-scheme-git/etc
  cp -R lib ${pkgdir}/opt/gerbil-scheme-git/lib
  cp -R CHANGELOG.md ${pkgdir}/opt/gerbil-scheme-git/CHANGELOG.md
  cp -R README.md ${pkgdir}/opt/gerbil-scheme-git/README.md
  mkdir -p ${pkgdir}/etc/profile.d/
  cat <<EOF > ${pkgdir}/etc/profile.d/gerbil-scheme-git.sh
#!/bin/bash
export GERBIL_HOME=/opt/gerbil-scheme-git
export PATH=/opt/gerbil-scheme-git/bin:$PATH
EOF
}

# vim:set ts=2 sw=2 et:
