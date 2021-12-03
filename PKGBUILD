# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='stratis-cli'
pkgver=2.4.2
_pkgver=$pkgver
pkgrel=2
pkgdesc='A CLI for the Stratis Project.'
arch=('any')
license=('Apache')
url='https://stratis-storage.github.io/'
depends=('python-dbus-client-gen' 'python-into-dbus' 'python-justbytes' 'python-dateutil' 'python-semantic-version' 'python-psutil')
makedepends=('dbus-glib' 'git' 'mpfr' 'python-argparse' 'python-dbus' 'python-pip' 'asciidoc')
#checkdepends=('python-nose' 'python-hypothesis' 'stratisd')
source=(
  "${pkgname}-${_pkgver}.tar.gz::https://github.com/stratis-storage/stratis-cli/archive/v${_pkgver}.tar.gz"
)
sha256sums=('f81d24e771bb29d6fddea4a9d6dba3709466fb026244f12f0e940ad897c14178')

### ignore tests because it requires root permission to access stratisd
#check() {
#  cd "${pkgname}-${_pkgver}"
#  export STRATISD="/usr/lib/stratisd"
#  nosetests
#}

build () {
  cd "${pkgname}-${_pkgver}/docs"
  make stratis.8
}
package() {
  cd "${pkgname}-${_pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 "shell-completion/bash/stratis" "$pkgdir/usr/share/bash-completion/completions/stratis"
	install -D -m644 "shell-completion/zsh/_stratis" "$pkgdir/usr/share/zsh/site-functions/_stratis"
	install -D -m644 "shell-completion/fish/stratis.fish" "$pkgdir/usr/share/fish/completions/stratis.fish"

  cd "docs"
  install -D -m644 stratis.8 "${pkgdir}/usr/share/man/man8/stratis.8"
}

# vim: ts=2 sw=2 et:
