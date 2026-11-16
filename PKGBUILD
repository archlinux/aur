# Maintainer: Matteo Nista <m.nista@hotmail.it>
pkgname=xdg-desktop-portal-gtk4-printfix
pkgver=1.6.6
pkgrel=1
pkgdesc='GTK4 backend for xdg-desktop-portal with Print portal fixes (temporary until upstream)'
url='https://github.com/JohnRTitor/xdg-desktop-portal-gtk4'
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('xdg-desktop-portal' 'gtk4' 'glib2' 'gdk-pixbuf2' 'glibc' 'libgcc')
makedepends=('cargo' 'git' 'make' 'pkgconf')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-gtk4')
conflicts=('xdg-desktop-portal-gtk4' 'xdg-desktop-portal-gtk4-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        print-single-call.patch)
sha256sums=('687f5365d641143ab343b954ec0ae334089551109bd2b023ceba781a01e0248e'
            'da6bbdaaa09e80c59cfe523c9fa5aedbcb957dbdb5a200a76bf34f876b8f5454')

prepare() {
  cd "$srcdir/xdg-desktop-portal-gtk4-$pkgver"
  # Print: support the single-call flow (token=0, GtkPrintDialog::print_file),
  # hand GTK its own copy of the source fd, and answer only once the job is sent.
  patch -Np1 -i "$srcdir/print-single-call.patch"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/xdg-desktop-portal-gtk4-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/xdg-desktop-portal-gtk4-$pkgver"
  cargo test --release --frozen --lib || true
}

package() {
  cd "$srcdir/xdg-desktop-portal-gtk4-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
