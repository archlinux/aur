# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

# bubblewrap-suid is a copy of [extra].bubblewrap, but with the main binary being SUID.
# This allows bubblewrap to work on "linux-hardened", "linux-zen" and custom
# builds of Linux where "user namespaces" are not allowed.

pkgname=bubblewrap-suid
pkgver=0.3.3
pkgrel=2
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git)
_commit=bc13e228d172cc2385aa445b512c6bf8ca2f3376  # tags/v0.3.3^0
source=(git+$url#commit=$_commit)
conflicts=(bubblewrap bubblewrap-git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
    --with-priv-mode=setuid
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
