# Maintainer: David Barchiesi <david@barchie.si>

pkgname=vbox-runner-git
pkgver=0.4.1
pkgrel=1
pkgdesc="Allows you to start your VirtualBox virtual machines from Krunner (Alt-Space) in Plasma 5."
arch=('any')
url="https://github.com/alvanieto/vbox-runner"
license=('GPL')
makedepends=('git' 'cmake' 'extra-cmake-modules')
conflicts=('kdeplasma-runners-vbox')

_gitroot="https://github.com/alvanieto/vbox-runner"
_gitname=$pkgname

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

	cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
		-DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` \
		-DCMAKE_BUILD_TYPE=Release

	make
}

package() {
  cd "$srcdir/$_gitname-build"
	make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
