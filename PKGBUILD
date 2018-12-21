# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=conan-git
pkgver=1.11.1.r6.ge03c60c6
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0'
         'python-requests>=2.7.0'
         'python-colorama>=0.3.3'
         'python-yaml>=3.11'
         'python-patch>=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver>=0.6.1'
         'python-bottle>=0.12.8'
         'python-distro>=1.0.2'
         'python-pluginbase>=0.5'
         'python-pylint>=1.9.3'
         'python-future>=0.16.0'
         'python-pygments>=2.0'
         'python-astroid>=1.6.5'
         'python-deprecation>=2.0'
         'python-tqdm>=4.28.1')
provides=('conan')
conflicts=('conan')
source=("conan-git::git+https://github.com/conan-io/conan.git" "arch-reqs.patch")
md5sums=('SKIP'
         'a916d69a8cfbd40151065bc29a0d0d03')


pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  patch -Np1 -i "${srcdir}/arch-reqs.patch"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
  install -m755 -d "${pkgdir}/usr/share/doc/conan"
  install -m644 contributors.txt "${pkgdir}/usr/share/doc/conan/"
}
