# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-dynd'
pkgname='python-dynd'
pkgver=0.7.2
pkgrel=1
pkgdesc='Bindings for the C++ dynd array library (numpy array replacement).'
groups=('blaze-ecosystem')
arch=('i686' 'x86_64')
url='https://github.com/libdynd/dynd-python'
license=('BSD')
makedepends=('python-setuptools' 
             'python-numpy>=1.7.1'
             'cython>=0.24'
             'python>=3.4'
             'cmake>=2.8.11')
depends=('python-numpy>=1.7.1' 'dynd=0.7.2' 'python>=3.4')
source=("https://github.com/libdynd/dynd-python/archive/v${pkgver}.tar.gz")
sha1sums=('e0c6aa25df0f1dacb536d6e5c438b484f050e01c')
md5sums=('8d50606db6975e181212c997843797f7')

prepare() {
  cd "${srcdir}"/dynd-python-$pkgver
  pwd
  patch setup.py $startdir/set_version_without_git.patch
}

build() {
  cd "${srcdir}"/dynd-python-$pkgver
  args="-DCMAKE_BUILD_TYPE=RelWithDebInfo"
  args="$args -DCMAKE_INSTALL_PREFIX=/usr"
  args="$args -DCMAKE_CXX_FLAGS='-march=native -O3 -pipe -fstack-protector-strong'"
  args="$args -DCMAKE_CXX_FLAGS_RELWITHDEBINFO='-DNDEBUG'"
  python setup.py build_py -cO1
  python setup.py build_ext --extra-cmake-args="$args"
  python setup.py build_clib
  python setup.py build_scripts
}

package_python-dynd() {
  cd "${srcdir}"/dynd-python-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
