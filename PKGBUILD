# Maintainer: [Pablo Lezaeta] <prflr88@gmail.com>

pkgname=xapp-symbolic-icons-git
pkgver=0.r8.ab8fefc
pkgrel=2
pkgdesc="A set of symbolic icons for GTK applications and projects, replacing the GNOME-specific Adwaita set now removed by upstream"
arch=('any')
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=('LGPL-3.0-only' 'GPL-3.0-only')
provides=('xapp-symbolic-icons' 'xapp-symbolic-icons-git')
conflicts=('xapp-symbolic-icons')
depends=('hicolor-icon-theme' 'python')
makedepends=('git' 'meson' 'ninja' 'gtk-update-icon-cache')
source=("${pkgname}::git+https://github.com/xapp-project/xapp-symbolic-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # until a proper version is tagged, use this to lets no tag exist
  if git describe --tags --exact-match 2>/dev/null; then
    git describe --tags | sed 's/^v//;s/-/+/g'
  else
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"
  # Prevent build issues
  rm -rf build
}

check() {
  cd "$srcdir/$pkgname"
  meson test -C build --print-errorlogs
}

build() {
  cd "$srcdir/$pkgname"

  arch-meson build \
    --prefix=/usr \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/libexec \
    --sbindir=/usr/bin \
    --buildtype=plain

  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"

  # Install using DESTDIR
  DESTDIR="${pkgdir}" meson install -C build

  # Install licences (here in case they change or sometihng)
  #install -Dm644 COPYING        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  #install -Dm644 COPYING.LESSER -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Install README and AUTHORS
  install -Dm644 README.md      -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 AUTHORS        -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 ChangeLog      -t "${pkgdir}/usr/share/doc/${pkgname}/"
  
  # Prevent problems if directory isnt created... its should e but what if...
  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
}
