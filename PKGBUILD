# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=abook
pkgver=0.6.2+r8+gb5e4a4daec1c
_commit=b5e4a4daec1c7842e214b50a0f267e07d9792311
pkgrel=1
pkgdesc='Text-based addressbook designed for use with Mutt'
url='https://abook.sourceforge.net/'
arch=(x86_64 aarch64)
license=(GPL-3.0-only)
makedepends=(git)
depends=(glibc ncurses readline)
source=("$pkgname::git+https://git.code.sf.net/p/abook/git#commit=${_commit}" abook-gcc15.patch)
# validpgpkeys=(3552E46F58F5FEC69A2CD85A5B4E2D0DD7F62B21) # Raphaël Droz
b2sums=('6f2e844d5f506928155b031417ea34636e45efe71ecb6efbc51c56406ecbf939acaae050ff8e0da644a0dc19a71b515f7023e34972d25df92407d854bbadcf8a'
        '9558830644a9c0685a479f819b4e9752fdb88fab44b3292da12b699e5a29d7f6b58d384661f776dd185782b224f3f517625d2f23518b841dc2b1f78ef1fa643c')

pkgver() {
  cd "$pkgname"
  git describe --abbrev=12 --tags | sed 's/[^_]*_//;s/_/./g;s/[^-]*-/&r/;s/-/+/g'
}

prepare() {
  cd "$pkgname"
  # update gettext infrastructure
  cp -Rv /usr/share/gettext/po .
  autoreconf --install --force
  git apply ../abook-gcc15.patch
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
  cd po && make update-po
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
