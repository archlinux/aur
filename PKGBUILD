# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.7.6
pkgrel=1
pkgdesc='Finds outdated running applications in your system'
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-psutil' 'python-lxml' 'python-dbus' 'python-six' 'pyalpm')
makedepends=("python-sphinx")
optdepends=("python-argcomplete: bash completion")
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz"
		"$pkgname-ignore-kernel.patch"
        'tracer.hook')
sha256sums=('3e91ada59f4e585c24191a983ed7ecd1047ae71a42b11a4d4ffa21c7e51260d7'
            '921267394c1048320ed3ea7c9f9e709c0a6b57ec82c30aba3597b028d382dd63'
            'cade46472c45fef3f8ec1eb762cd4469d37f2966f65f63ee89887941e7896452')

prepare() {
  cd tracer-tracer-$pkgver-1

  # patch to ignore kernel updates
  patch -Np1 < ../tracer-ignore-kernel.patch

  # convert man page
  make -C doc man
}

package() {
  cd tracer-tracer-$pkgver-1
  python setup.py install --root="$pkgdir/" --optimize=1

  # try to run as last/late hook
  install -Dm0644 ../tracer.hook "$pkgdir"/usr/share/libalpm/hooks/zzz-tracer.hook

  # install manual
  install -Dm0644 doc/build/man/tracer.8 -t "$pkgdir"/usr/share/man/man8
}
