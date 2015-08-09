# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgbase=gnome-manpages-git
pkgname=('man-pages-clutter-git' 'man-pages-gdk3-git' 'man-pages-gio2-git' 'man-pages-glib2-git' 'man-pages-gobject2-git' 'man-pages-gtk3-git')
pkgver=20130101.15.e660878
pkgrel=1
pkgdesc="Various man pages for GNOME related libraries"
url="https://github.com/chergert/gnome-manpages/"
arch=('any')
makedepends=('git')
depends=('man-db')
conflicts=('gnome-manpages')
license=('GPL2')
install="${pkgbase}.install"
source=("git+https://github.com/chergert/gnome-manpages.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase%-*}"
  printf $(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count HEAD).$(git describe --always)
}

_package() {
  _ARCHIVE="$1-manpages.tar.gz"
  cd "${pkgbase%-*}"
  # Remove previous extracted manuals
  [ -d "${_ARCHIVE%.tar.gz}" ] && rm -rf "${srcdir}/${pkgbase%-*}/${_ARCHIVE%.tar.gz}"
  # Extract man pages
  mkdir "${_ARCHIVE%.tar.gz}"
  tar xzf "${_ARCHIVE}" -C ${_ARCHIVE%.tar.gz}
  # Install man pages
  if [ $(ls -1 "${_ARCHIVE%.tar.gz}"/*.1 2> /dev/null | wc -l) -gt 0 ]; then
    install -m 755 -d "${pkgdir}/usr/share/man/man1"
    install -m 644 -t "${pkgdir}/usr/share/man/man1" "${_ARCHIVE%.tar.gz}"/*.1
    gzip -r "${pkgdir}/usr/share/man/man1/"
  fi
  install -m 755 -d "${pkgdir}/usr/share/man/man3"
  install -m 644 -t "${pkgdir}/usr/share/man/man3" "${_ARCHIVE%.tar.gz}"/*.3
  gzip -r "${pkgdir}/usr/share/man/man3/"
}

package_man-pages-clutter-git() {
  _package "clutter"
}

package_man-pages-gdk3-git() {
  _package "gdk3"
}

package_man-pages-gio2-git() {
  _package "gio2"
}

package_man-pages-glib2-git() {
  _package "glib2"
}

package_man-pages-gobject2-git() {
  _package "gobject2"
}

package_man-pages-gtk3-git() {
  _package "gtk3"
}
