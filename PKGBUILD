pkgname=dh-python
pkgver=7.20260309
pkgrel=0

_debpy_name=python3-defaults
_debpy_ver=3.13.9
_debpy_rel=3

pkgdesc="debhelper scripts for Python 3: py3versions, python3.pm"
arch=('any')
url="http://packages.debian.org/sid/python3"
license=('custom:MIT')
depends=('python-docutils')
makedepends=('debhelper' 'python')
optdepends=('sgmltools-lite')
provides=('debhelper-python' 'dh-python' 'dh-sequence-python3')
conflicts=('debhelper-python')
replaces=('debhelper-python')
source=(https://deb.debian.org/debian/pool/main/p/${_debpy_name}/${_debpy_name}_${_debpy_ver}-${_debpy_rel}.tar.gz
        https://deb.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz
        py3versions.patch)
b2sums=('569df94fb85d45ece5ce391d6ff73ac4d975cb82b6fdcc2be723fc257a58931a647b16c35aba18ed72d87c24fb1c759eb646bcc248b7505bf6cd4a2cb614a335'
        'e4ae5f9413ce9cad47c64a38242b163f7796671556926adac59438c0fe05ab2ef7aadddb33785ffd4ad46a134577fd27f3bbbdfa99d87eb2348d6e4268f29fdf'
        '04ca5e93e07c4eb5f6ac02e758a6b3f078d844982a945a6d2ecf811ca315efedb4e12c3238edb56dacfcc6e480adf9c30b4f472545f1934fd4cd92bc6cc65ef2')

prepare() {
  cd "${srcdir}/${_debpy_name}-${_debpy_ver}"
  patch -Np1 < "${srcdir}"/py3versions.patch
}

build() {
  cd "${srcdir}/${_debpy_name}-${_debpy_ver}"
  make

  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_debpy_name}-${_debpy_ver}"
  sed -i -e 's|/usr/share/python3/debian_defaults|debian/debian_defaults|' \
    debpython/version.py
  make -k check_versions
  sed -i -e 's|debian/debian_defaults|/usr/share/python3/debian_defaults|' \
    debpython/version.py
}

package() {
  cd "${srcdir}/${_debpy_name}-${_debpy_ver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install

  mkdir -p ${pkgdir}/usr/share/python3
  install -m 755 debian/py3versions.py ${pkgdir}/usr/share/python3/
  ln -s -r ${pkgdir}/usr/share/python3/py3versions.py ${pkgdir}/usr/bin/py3versions
  install -m 755 debian/debian_defaults ${pkgdir}/usr/share/python3/
  gzip -f debian/py3versions.1
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -m 644 debian/py3versions.1.gz ${pkgdir}/usr/share/man/man1/

  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname/
  install -D -m 644 debian/copyright ${pkgdir}/usr/share/licenses/$pkgname/

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install

  # create symlinks to executables in order to make this look like in
  # debian
  ln -s -r ${pkgdir}/usr/share/dh-python/dh_python3 ${pkgdir}/usr/bin/dh_python3
  ln -s -r ${pkgdir}/usr/share/dh-python/pybuild ${pkgdir}/usr/bin/pybuild

  mkdir -p ${pkgdir}/usr/share/perl5/vendor_perl
  mv ${pkgdir}/usr/share/perl5/Debian ${pkgdir}/usr/share/perl5/vendor_perl/Debian
}

# vim:set ts=2 sw=2 et:
