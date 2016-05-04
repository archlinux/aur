# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
# Contributor: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
pkgname=yumbootstrap-git
pkgver=78.a99c946
pkgrel=1
pkgdesc="Tool for installing Yum-based distributions (Red Hat, CentOS, Fedora) in a chroot directory"
arch=('any')
url="http://dozzie.jarowit.net/trac/wiki/yumbootstrap"
license=('GPL')
groups=()
depends=('python2' 'yum')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_gitroot=https://github.com/dozzie/yumbootstrap.git
_gitname=yumbootstrap

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
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
  python2 setup.py install --root="$pkgdir/" --optimize=1
  sed -i 's/python/python2/' bin/yumbootstrap distros/scripts/*.py

  mkdir -p $pkgdir/etc/yumbootstrap/suites
  cp -R distros/* $pkgdir/etc/yumbootstrap/suites/

  mkdir -p $pkgdir/usr/bin
  cp bin/yumbootstrap $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
