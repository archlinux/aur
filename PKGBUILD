# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: boyska <piuttosto@logorroici.org>

_pkgname=mutt-kz
pkgname=mutt-kz-git
pkgver=mutt.1.6.rel.r236.g73ff2ad
pkgrel=1
pkgdesc='Small but powerful text-based mail client (experimental fork) (development version)'
url='https://github.com/karelzak/mutt-kz'
license=('GPL')
source=('git+https://github.com/karelzak/mutt-kz.git')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('libidn' 'krb5' 'notmuch-runtime')
makedepends=('git' 'gnupg' 'libxslt')
conflicts=('mutt')
provides=('mutt')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Configure the build.
 ./prepare \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-debug \
    --enable-pgp \
    --enable-gpgme \
    --enable-notmuch \
    --enable-pop \
    --enable-imap \
    --enable-smtp \
    --enable-hcache \
    --with-gss=/usr \
    --with-ssl=/usr \
    --with-sasl \
    --with-curses=/usr \
    --with-regex \
    --with-idn

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install

  # Cruft we don't want.
  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  rm "${pkgdir}"/etc/mime.types{,.dist}
}

# vim: ft=sh ts=2 sw=2 et
