# Maintainer: Aetf <7437103@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@googlemail.com>
pkgname=kmscon-patched-git
_gitname=kmscon
pkgver=9.0.0.r0.g3292791
pkgrel=1
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS) (forked and patched version)'
arch=('x86_64' 'armv7h')
url='https://github.com/Aetf/kmscon'
license=('MIT')
depends=(systemd libdrm mesa libgl pango libxkbcommon xkeyboard-config libtsm-patched)
makedepends=(libxslt docbook-xsl linux-api-headers git)
options=(!libtool)
provides=(kmscon)
conflicts=(kmscon)
source=("git+https://github.com/Aetf/kmscon.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  git describe --long | sed -r "s/^$_gitname-//;s/^v//;s/([^-]*-g)/r\\1/;s/-/./g"
}

prepare() {
  cd $srcdir/$_gitname

  meson builddir/ -Dprefix=/usr -Dlibexecdir=lib
}

build() {
  cd $srcdir/$_gitname

  meson compile -C builddir/
}

package() {
  cd $srcdir/$_gitname

  meson install -C builddir/ --destdir "$pkgdir/"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
