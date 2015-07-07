# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=fbx-conv-git
pkgver=20140707
pkgrel=1
pkgdesc="Command line utility using the FBX SDK to convert FBX/Collada/Obj files to a custom text/binary format for static, keyframed and skinned meshes."
arch=('i686' 'x86_64')
url="https://github.com/libgdx/fbx-conv"
license=('unknown')
depends=('fbx-sdk')
makedepends=('git' 'premake')

_gitroot=https://github.com/libgdx/fbx-conv.git
_gitname=fbx-conv

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
  unset LDFLAGS
  unset CXXFLAGS
  unset CPPFLAGS
  unset CFLAGS
  unset MAKEFLAGS
  FBX_SDK_ROOT="/usr" ./generate_makefile
  cd build/gmake
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D fbx-conv "$pkgdir/usr/bin/fbx-conv"
}

# vim:set ts=2 sw=2 et:
