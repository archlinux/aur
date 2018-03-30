# Maintainer: Aetf <7437103@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@googlemail.com>
pkgname=kmscon-patched-git
_gitname=kmscon
pkgver=0.0.0
pkgrel=2
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS), with patches to add underline support and fix margin background color (forked and patched version)'
arch=('x86_64' 'armv7h')
url='http://www.freedesktop.org/wiki/Software/kmscon/'
license=('MIT')
depends=(systemd libdrm mesa libgl pango libxkbcommon xkeyboard-config libtsm-patched)
makedepends=(libxslt docbook-xsl linux-api-headers)
options=(!libtool)
provides=(kmscon)
conflicts=(kmscon)
source=("git+https://github.com/Aetf/kmscon.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  git describe --long | sed -r "s/^$_gitname-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

prepare() {
  cd $srcdir/$_gitname

  ./autogen.sh --prefix=/usr \
                --disable-wlterm
}

build() {
  cd $srcdir/$_gitname
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/systemd/system"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  cp docs/kmscon{,vt@}.service "$pkgdir/usr/lib/systemd/system/"
}
