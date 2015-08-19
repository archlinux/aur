# Maintainer: Michael Unterkalmsteiner <miciu AT gmx DOT de>
pkgname=tpkbdctl-git
pkgver=20150819
pkgrel=1
pkgdesc="A tool that can be used to control features of the \"Lenovo ThinkPad USB Keyboard with TrackPoint\""
arch=('i686' 'x86_64')
url="https://github.com/bseibold/tpkbdctl"
license=('GPL2')
depends=('linux>=3.0' 'python')
makedepends=('git' 'python-setuptools')
backup=('etc/default/tpkbdctl')
install=tpkbdctl.install
source=(10-tpkbdctl.rules
	      tpkbdctl.default
        tpkbdctl_runner)
md5sums=('47dc611bbbef728ab5f016afbd3e86b5'
         'cc40b7b7c32ed713aafabc0af385a168'
         '69fd4aafd2a21798f86d98a9eb2d6ecd')

_gitroot=https://github.com/bseibold/tpkbdctl.git
_gitname=tpkbdctl

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
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t ../$_gitname-build # do not copy over the .git folder
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root=$pkgdir --optimize=1

  #install udev rule
  install -D -m644 $srcdir/10-tpkbdctl.rules $pkgdir/etc/udev/rules.d/10-tpkbdctl.rules

  #install default configuration file
  install -D -m644 $srcdir/tpkbdctl.default $pkgdir/etc/default/tpkbdctl

  #install runner
  install -D -m744 $srcdir/tpkbdctl_runner $pkgdir/usr/bin/tpkbdctl_runner
}

# vim:set ts=2 sw=2 et:
