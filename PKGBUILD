# Maintainer: GrayJack <gr41.j4ck@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>

_pkgname=janet
pkgname=janet-lang
pkgver=1.28.0
_jpm_commit=af002e6
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('janet' 'jpm')
conflicts=('janet-lang-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/janet-lang/janet/archive/v${pkgver}.tar.gz"
        "git+https://github.com/janet-lang/jpm#commit=${_jpm_commit}"
        "default_config.janet")
sha256sums=('d78a4c367f1b2c9f95897fa13fc788b36ce49cfcc18083b0810e86b2dd1285bb'
            'SKIP'
            '7fb56585e6027ea800920a364acd73b49205298dcf887a4ee71fb65125c4539f')
options=('staticlibs')

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
  CFLAGS+=" -fPIC"
  LDFLAGS+=" -rdynamic"
  make PREFIX="/usr" all build/janet.pc docs
}

package() {
  cd "${srcdir}"/$_pkgname-$pkgver
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -dm755 "${pkgdir}"/usr/share/janet
  cp -a examples "${pkgdir}"/usr/share/janet

  install -Dm644 build/doc.html "${pkgdir}"/usr/share/doc/janet/doc.html
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd "${srcdir}"/jpm

  install -Dm755 -t "${pkgdir}"/usr/bin jpm/jpm
  install -Dm644 -t "${pkgdir}"/usr/lib/janet/jpm jpm/*.janet
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 jpm.1
  install -Dm644 -t "${pkgdir}"/usr/share/janet/jpm/configs configs/*

  install -Dm644 -t "${pkgdir}"/usr/lib/janet/jpm "${srcdir}"/default_config.janet
}