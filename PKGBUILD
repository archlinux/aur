# Maintainer: Peter Sagerson <psagers@ignorare.net>
# Contributor: GrayJack <gr41.j4ck@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>

_pkgname=janet
pkgname=janet-lang
pkgver=1.39.1
_jpm_commit=d93b7c2
pkgrel=2
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
        "default-config.janet")
sha256sums=('a43489328b88846e5cddbdad9274f25ee9854e337e52490a74bb7955de03c650'
            'SKIP'
            '7fb56585e6027ea800920a364acd73b49205298dcf887a4ee71fb65125c4539f')
options=('staticlibs')

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
  CFLAGS+=" -fPIC -ffat-lto-objects"
  LDFLAGS+=" -rdynamic"
  make PREFIX="/usr" all build/janet.pc docs
}

check() {
  make -k -C "$_pkgname-$pkgver" test
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

  install -Dm644 -t "${pkgdir}"/usr/lib/janet/jpm "${srcdir}"/default-config.janet
}
