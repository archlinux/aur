# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore
pkgver=4.1.0
pkgrel=2
pkgdesc="An easy to use web platform for writing scalable, concurrent APIs in C or Python."
arch=($CARCH)
url=https://$pkgname.io
license=(custom:ISC)

# optdepends=(bash-bats)
makedepends=(minisign)
depends=(
  "openssl>=1.1.0"
  bash-bats # kore W: Referenced library 'bats' is an uninstalled dependency # /usr/share/kore/examples
  curl
  postgresql-libs
  python3
  yajl # JSONRPC
)

source=(
  https://kore.io/releases/$pkgname-$pkgver.tar.gz
  https://kore.io/releases/$pkgname-$pkgver.tar.gz.minisig
)
sha256sums=(
  b7d73b005fde0ea01c356a54e4bbd8a209a4dff9cf315802a127ce7267efbe61
  d5d85cd1819f0c35db4bbf3fde30ad52fe31f021715eec437e7c2cf44c153760
)

prepare() {
  # https://docs.kore.io/4.1.0/install.html
  minisign -V -P "RWSxkEDc2y+whfKTmvhqs/YaFmEwblmvar7l6RXMjnu6o9tZW3LC0Hc9" -m $pkgname-$pkgver.tar.gz
  minisign -V -x $pkgname-$pkgver.tar.gz.minisig -p "$srcdir"/$pkgname-$pkgver/minisign.pub -m $pkgname-$pkgver.tar.gz
}

build() {

  cd $pkgname-$pkgver

  # /usr/include/features.h:*:*: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  # NOOPT=1 \
  # NOHTTP=1 \

  # https://stackoverflow.com/q/26025708/warning-visibility-attribute-ignored-symbol-visibility-c-gcc
  # src/python.c:62:1: warning: ‘visibility’ attribute ignored [-Wattributes]
  #    62 | static PyMODINIT_FUNC   python_module_init(void);
  #       | ^~~~~~
  # src/python.c:1555:1: warning: ‘visibility’ attribute ignored [-Wattributes]
  #  1555 | {
  #       | ^
  export CFLAGS="$CFLAGS -Wno-error=attributes"

  make \
    "$MAKEFLAGS" \
    PREFIX=/usr \
    CURL=1  \
    ACME=1 \
    TASKS=1 \
    PGSQL=1 \
    DEBUG=1 \
    JSONRPC=1 \
    PYTHON=1

}

package() {

  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" PREFIX=/usr install

  # kore W: ELF file ('usr/bin/kodev') lacks FULL RELRO, check LDFLAGS.
  # kore W: ELF file ('usr/bin/kodev') is unstripped.
  # kore W: ELF file ('usr/bin/kore') is unstripped.

  # Remove duplicate
  # pkgdir=/home/darren/.cache/yay/kore/pkg/kore
  diff -r --no-dereference "$pkgdir"/usr/include "$pkgdir"/usr/share/$pkgname/include
  rm -r "$pkgdir"/usr/include

  # More resources
  install -m644 README.md conf/kore.conf.example "$pkgdir"/usr/share/$pkgname
  # umask
  cp --no-preserve=mode -r examples "$pkgdir"/usr/share/$pkgname/ # Stupid .gitignore with o+x
  install -Dm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}LICENSE

}
