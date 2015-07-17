# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=qibuild
pkgver='3.9'
pkgrel='1'
pkgdesc='The meta build framework'
arch=('any')
url='http://doc.aldebaran.com/qibuild/'
license=('BSD')
depends=('python2' 'cmake')
optdepends=(
  'git: for qisrc'
  'python2-sphinx: Sphinx support in qidoc'
  'python2-virtualenv: for qipy'
  'doxygen: Doxygen support in qidoc'
  'gettext: Gettext support in qilinguist'
  'qt5-tool: QtLinguist support in qilinguist'
)
makedepends=('python2' 'python2-docutils')

source=("https://pypi.python.org/packages/source/q/qibuild/qibuild-${pkgver}.tar.gz")
md5sums=('ccd4b2b2f31edb40a0b479204a464215')


build() {
  # build python:
  cd ${pkgname}-${pkgver}
  python2 setup.py build

  # build man pages
  cd doc/source/man
  for f in *.rst ; do
    rst2man2 ${f} $(basename $f .rst).1
  done
}

package() {
  cd ${pkgname}-${pkgver}

  # python
  python2 setup.py install --root="$pkgdir/"  --optimize=1

  # license
  mkdir -p "${pkgdir}/usr/share/licenses/qibuild"
  install -m 644 COPYING  "${pkgdir}/usr/share/licenses/qibuild"

  # qicd
  mkdir -p "${pkgdir}/etc/profile.d"
  sed -i 's!python!/usr/bin/python2!g' etc/qibuild.sh
  install -m 755 etc/qibuild.sh ${pkgdir}/etc/profile.d/

  # man pages
  mkdir -p "${pkgdir}/usr/share/man/man1"
  cd doc/source/man
  for f in *.1 ; do
    install $f  "${pkgdir}/usr/share/man/man1"
  done
}

# vim:set ts=2 sw=2 et:
