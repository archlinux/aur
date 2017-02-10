# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Michel Blanc <mblanc@erasme.org>
# Contributor: Scott Hansen https://github.com/firecat53
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Bartłomiej Piotrowski <b@bpiotrowski.pl>
# Contributor: cgtx <carl@carlgeorge.us>
# Contributor: Daniel Wallace <danielwallace@gtmanfred.com>
# Contributor: John Gosset <john.gosset@gmail.com>
# Contributor: Joshua Lund <josh@joshlund.com>
# Contributor: Matt Klich <matt.klich@readytalk.com>
# Contributor: Michael DeHaan <michael@ansible.com>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=ansible-git
pkgver=2.3.0.20858.d9d7e41
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='http://www.ansible.com'
license=('GPL3')
depends=('python2' 'python2-yaml' 'python2-paramiko' 'python2-jinja' 'python2-six' 'python2-pexpect' 'python2-crypto')
makedepends=('git' 'asciidoc' 'fakeroot' 'python-sphinx')
optdepends=('python2-passlib: crypt values for vars_prompt')
conflicts=('ansible')
provides=('ansible')
backup=('etc/ansible/ansible.cfg')
source=(ansible-git::git+https://github.com/ansible/ansible.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s.%s" "$(cut -d' ' -f1 VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  make PYTHON=python2
  make docs
}

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/ansible"
  cp -dpr --no-preserve=ownership ./examples "${pkgdir}/usr/share/ansible"

  python2 setup.py install -O1 --root="${pkgdir}"

  install -Dm644 examples/ansible.cfg "${pkgdir}/etc/ansible/ansible.cfg"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/ansible/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/doc/ansible/COPYING"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/ansible/CHANGELOG.md"

  install -dm755 "${pkgdir}/usr/share/man/man1"
  install -Dm644 "${srcdir}/${pkgname}/docs/man/man1/"*.1 "${pkgdir}/usr/share/man/man1"
}
