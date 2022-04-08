# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Niccolò Maggioni <nicco.maggioni@gmail.com>

pkgname="pam_u2f-git"
_gitname='pam-u2f'
_gitbranch='master'
_gitauthor='Yubico'
pkgver=1.2.0.r56.gb729fe1
pkgrel=1
pkgdesc="Universal 2nd Factor (U2F) PAM authentication module from Yubico"
url='https://developers.yubico.com/pam-u2f/'
license=('BSD')
source=("git+https://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
depends=('pam' 'libfido2' 'openssl')
makedepends=('git' 'autoconf' 'automake' 'asciidoc' 'libxslt' 'libxml2'
'docbook-xml' 'docbook-xsl' 'gengetopt')
conflicts=('pam_u2f')
provides=('pam_u2f')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/pam_u2f-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  autoreconf --install
  ./configure \
    --prefix=/usr \
    --with-pam-dir=/usr/lib/security
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set et sw=2 sts=2 tw=80:
