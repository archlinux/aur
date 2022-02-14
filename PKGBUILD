# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=libb64-git
pkgver=r49.ce864b1
pkgrel=1
pkgdesc='Base64 Encoding/Decoding Routines (github fork)'
url='https://github.com/libb64/libb64'
depends=('glibc')
makedepends=('git')
arch=('x86_64' 'armv7h' 'aarch64')
license=('custom:Public Domain')
source=("libb64-git::git+https://github.com/libb64/libb64.git")
provides=("libb64")
conflicts=("libb64")
sha256sums=(SKIP)

pkgver() {
        cd "$srcdir/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}/src
  export CFLAGS="${CFLAGS} -fPIC"
  make

  export CFLAGS="${CFLAGS} -shared -Wl,-soname,libb64.so.0"
  gcc ${LDFLAGS} ${CFLAGS} *.o -o libb64.so.0
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/usr/lib"
  install src/libb64.so.0 "${pkgdir}/usr/lib"
  ln -sf /usr/lib/libb64.so.0 "${pkgdir}/usr/lib/libb64.so"

  cp -r include "${pkgdir}/usr"

  install -Dm644 LICENSE.md \
      "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
