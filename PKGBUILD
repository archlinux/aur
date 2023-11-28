# Maintainer: Aetf <7437103@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@googlemail.com>
pkgname=kmscon-patched-git
_gitname=kmscon
pkgver=9.0.0.r3.g1bf602f
pkgrel=2
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS) (forked and patched version)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Aetf/kmscon'
license=('MIT')
depends=(systemd libdrm mesa libgl pango libxkbcommon xkeyboard-config libtsm-patched)
makedepends=(libxslt docbook-xsl linux-api-headers git meson)
options=(!libtool)
provides=(kmscon)
conflicts=(kmscon)
source=("git+https://github.com/Aetf/kmscon.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  git describe --long | sed -r "s/^$_gitname-//;s/^v//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
  arch-meson "$srcdir/$_gitname" builddir/ -Dtests=false
  meson compile -C builddir/
}

package() {
  meson install -C builddir/ --destdir "$pkgdir"

  cd $srcdir/$_gitname
  install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
