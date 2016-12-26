pkgname=douane-configurator-git
pkgver=0.2.0.r0.g97994aa
pkgrel=1
pkgdesc="Douane Firewall Kernel GTK GUI"
arch=('i686' 'x86_64')
url="http://douaneapp.com/"
license=('GPL2')
depends=('python3'
         'python-gobject'
         'python-dbus'
         'polkit')
makedepends=('git')
source=('git+https://github.com/Douane/douane-configurator.git'
        'git+https://github.com/zedtux/gtktwitterbox.git')
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$srcdir/douane-configurator"
  git submodule init
  git config submodule.gtktwitterbox.url $srcdir/gtktwitterbox
  git submodule update
}

pkgver() {
  cd "$srcdir/douane-configurator"
  # Tag
  git tag -a $(head VERSION) -m ""
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/douane-configurator"

  msg2 "Starting make..."
  make
}

package() {
  # Install
  cd "$srcdir/douane-configurator"
  msg2 "Starting make install..."
  python setup.py build -e "/usr/bin/env python3" install --prefix=/usr --root="${pkgdir}"

}
