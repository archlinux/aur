# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

# bubblewrap-suid is a copy of [extra].bubblewrap, but with the main binary being SUID.
# This allows bubblewrap to work on "linux-hardened", "linux-zen" and custom
# builds of Linux where "user namespaces" are not allowed.

pkgname=bubblewrap-suid
pkgver=0.3.3
pkgrel=3
pkgdesc='Unprivileged sandboxing tool, SUID version for compatibility with linux-hardened, linux-zen and others'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git)
_commit=bc13e228d172cc2385aa445b512c6bf8ca2f3376  # tags/v0.3.3^0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

conflicts=(bubblewrap)
provides=(bubblewrap)

pkgver() {
  cd bubblewrap
  git describe | sed 's/^v//'
}

prepare() {
  cd bubblewrap
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd bubblewrap
  ./configure --prefix=/usr \
    --with-priv-mode=setuid
  make
}

package() {
  cd bubblewrap
  make DESTDIR="$pkgdir" install
}
