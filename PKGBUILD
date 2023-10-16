# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_gitname=cryptsetup
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=cryptsetup
pkgver=v2.6.1.r162.g20bfec91
pkgrel=1
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt'
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL')
url="https://gitlab.com/${_gitauthor}/${_gitname}"
depends=('device-mapper' 'libdevmapper.so' 'openssl' 'popt' 'libutil-linux'
         'libuuid.so' 'json-c' 'libjson-c.so' 'argon2' 'libargon2.so' 'libssh'
         'libssh.so')
makedepends=('util-linux' 'git' 'asciidoctor')
provides=('libcryptsetup.so' 'cryptsetup')
conflicts=('cryptsetup')
options=('!emptydirs')
source=("git+https://gitlab.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}"
        "hooks-encrypt"
        "install-encrypt"
        "install-sd-encrypt")
sha256sums=('SKIP'
            '839e961e053512293052250b424f38c347cb46c14cbd51d7e2705b3f5378ec02'
            '2b71c6c56ef81e5bf4f49dcc08dbd1651b46bda51a8f75a0a342b344b2d0eccd'
            'ec983a55b09dd512ab5b2f329fe611cb10478e4cc1cd3bb65848cf234dcfebd8')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static --enable-libargon2
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  # install hook
  install -D -m644 "${srcdir}"/hooks-encrypt "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m644 "${srcdir}"/install-encrypt "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m644 "${srcdir}"/install-sd-encrypt "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
  install -D -m644 "${srcdir}"/"${_gitname}"/scripts/cryptsetup.conf "${pkgdir}"/usr/lib/tmpfiles.d/cryptsetup.conf
}

# vim:set et sw=2 sts=2 tw=80:
