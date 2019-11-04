# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mamba
pkgver=0.10
pkgrel=4
pkgdesc="The definitive testing tool for Python. Born under the banner of Behavior Driven Development."
arch=('any')
license=('MIT')
url="https://nestorsalceda.github.io/mamba"
depends=('python-coverage' 'python-watchdog' 'python-clint' 'python-setuptools')
checkdepends=('python-doublex-expects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nestorsalceda/mamba/archive/v$pkgver.tar.gz"
         mamba-python-3.8.patch)
sha512sums=('f7a46c35359ed7703a4d3ebe51904fac6c125451001b5181d1d1038c46c3ac4940c378e08cd779e683aa76cd4553e078bfa7dfd5ea2301fa1dacb2a0a85ec38e'
            '6b48a483c052e8943e407036f45ef6eac94f7299e35396e7c740f99cf07d6ef37cdb948ff6bab6f6488f6181dd93defd8e80842d73d1193283da68b6de3b3ae7')

prepare() {
  cd mamba-$pkgver
  patch -p1 -i ../mamba-python-3.8.patch # Add missing argument for python 3.8
}

build() {
  cd "$srcdir"/mamba-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/mamba-$pkgver
  # Hack entry points by installing it

  cd "$srcdir"/mamba-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    export PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/${site-packages}:$PYTHONPATH"
    mamba --enable-coverage
  )
}

package() {
  cd mamba-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
