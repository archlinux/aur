# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Michel Blanc <mblanc@erasme.org>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Bartłomiej Piotrowski <b@bpiotrowski.pl>
# Contributor: cgtx <carl@carlgeorge.us>
# Contributor: Daniel Wallace <danielwallace@gtmanfred.com>
# Contributor: John Gosset <john.gosset@gmail.com>
# Contributor: Joshua Lund <josh@joshlund.com>
# Contributor: Matt Klich <matt.klich@readytalk.com>
# Contributor: Michael DeHaan <michael@ansible.com>

pkgname=ansible-py3-git
pkgver=1.6.0.218.g188ab7b
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='http://www.ansible.com'
license=('GPL3')
depends=('python' 'python-paramiko' 'python-jinja' 'python-yaml')
makedepends=('git' 'asciidoc' 'fakeroot' 'bc')
optdepends=('python-pyasn1: needed for accelerated mode'
            'python-crypto: needed for accelerated mode'
            'python-keyczar: needed for accelerated mode')
conflicts=('ansible')
provides=('ansible')
backup=('etc/ansible/ansible.cfg')
source=($pkgname::git://github.com/ansible/ansible.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/-/./g'
}

prepare() {
  # Convert Python 2 to Python 3, concurrently
  local procs=`grep processor /proc/cpuinfo | wc -l`
  local np=`echo $procs+1 | bc`
  2to3 "$pkgname" -w -n --no-diff -j $np
}

build() {
  make -C "$pkgname" PYTHON=python
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/share/ansible"
  cp -dpr --no-preserve=ownership ./library/* "$pkgdir/usr/share/ansible/"
  cp -dpr --no-preserve=ownership ./examples "$pkgdir/usr/share/ansible"

  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 examples/ansible.cfg "$pkgdir/etc/ansible/ansible.cfg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/ansible/README.md"
  install -Dm644 COPYING "$pkgdir/usr/share/doc/ansible/COPYING"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/ansible/CHANGELOG.md"

  install -d "$pkgdir/usr/share/man/man1"
  cp -dpr --no-preserve=ownership docs/man/man1/*.1 "$pkgdir/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
