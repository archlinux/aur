# Maintainer: robertfoster
pkgname=portage-git
pkgver=3.0.51.r5.6d90cf039
pkgrel=1
pkgdesc="Gentoo's package management system "
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'rsync' 'eselect-git')
source=("git+https://anongit.gentoo.org/git/proj/portage.git")
sha384sums=('SKIP')
makedepends=('git' 'meson')
checkdepends=('python-pytest')
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --match 'portage-*' | sed 's/^portage-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  arch-meson . build -Dipc=true -Drsync-verify=false
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  meson install -C build --destdir "$pkgdir"
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  meson test -C build --no-rebuild --verbose
}
