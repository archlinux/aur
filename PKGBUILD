# Maintainer: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-core'
pkgver='22.0.0'
pkgrel=2
pkgdesc="Framework to ease the development of portable automated build systems"

arch=('any')
url="https://github.com/AdaCore/e3-core"
license=('GPL3')

depends=('python-colorama'
         'python-distro'
         'python-dateutil'
         'python-netifaces'
         'python-psutil'
         'python-requests'
         'python-requests-toolbelt'
         'python-stevedore>1.20.0'
         'python-tqdm'
         'python-yaml')
makedepends=('python-setuptools')
conflicts=('python2-e3-core')

_name='e3-core'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "distro.patch")
sha512sums=('1544c9cce9d7bab32db4617f70eaab301a526f84f8d89a22e5204eb7a7823a8e0103e12d490101a95d6255f3274732dbd77467064c856e1a05f8e7e18cce9f5a'
            '26ccd271cca25661ffc99154d44f210843f18e14641949d24d5a22bad0a62a449e5ed41eca1e5f8c409e504d20cccc9b5f9db3d2eadfc8214a02e26c6f99eee6')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    patch -Np0 -i "$srcdir/distro.patch"
}

build() {
    cd "$srcdir/$_name-$pkgver"

    # Remove binaries for unsupported architectures
    for a in ppc-aix ppc-linux sparc-solaris x86_64-darwin x86-linux \
        x86-solaris x86-windows x86_64-windows
    do
        rm -f src/e3/os/data/rlimit-$a
    done

    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
