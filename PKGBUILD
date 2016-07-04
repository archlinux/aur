# $Id$
# Maintainer: Dylan Whichard <dylan@whichard.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

_name=ode
pkgname=ode-python-bindings
pkgver=0.13.1
pkgrel=1
pkgdesc="An open source, high performance library for simulating rigid body dynamics with python bindings"
arch=('i686' 'x86_64')
url="https://bitbucket.org/odedevs/ode/"
license=('LGPL' 'BSD')
depends=('gcc-libs' 'bash' 'cython')
source=("https://bitbucket.org/odedevs/${_name}/downloads/${_name}-${pkgver}.tar.gz")
md5sums=('00f6613b3d8e5249be60e3a513d6aebd')
replaces=('ode')
conflicts=('ode')

prepare() {
  sed -i 's/read()/read().decode("utf-8")/g' "${srcdir}/${_name}-${pkgver}/bindings/python/setup.py"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  ./configure --prefix=/usr \
  	      --with-trimesh=opcode \
	      --enable-new-trimesh \
              --enable-shared \
              --enable-double-precision
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  make DESTDIR=${pkgdir}/ install

  install -Dm0644 ${srcdir}/${_name}-${pkgver}/ou/LICENSE-BSD.TXT \
                  ${pkgdir}/usr/share/licenses/${_name}/LICENSE-BSD.TXT
  install -Dm0644 ${srcdir}/${_name}-${pkgver}/GIMPACT/GIMPACT-LICENSE-BSD.TXT \
                  ${pkgdir}/usr/share/licenses/${_name}/GIMPACT-LICENSE-BSD.TXT
  install -Dm0644 ${srcdir}/${_name}-${pkgver}/libccd/BSD-LICENSE \
                  ${pkgdir}/usr/share/licenses/${_name}/BSD-LICENSE
  cd bindings/python/
  python setup.py install --root="${pkgdir}"
}
