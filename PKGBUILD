# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_gitname=cryptsetup
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=cryptsetup
pkgver=v2.3.3.r349.gcd3cb945
pkgrel=1
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt'
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL')
url="https://gitlab.com/${_gitauthor}/${_gitname}"
depends=('device-mapper' 'libdevmapper.so' 'openssl' 'popt' 'libutil-linux'
         'libuuid.so' 'json-c' 'libjson-c.so' 'argon2' 'libargon2.so')
makedepends=('util-linux' 'git')
provides=('libcryptsetup.so')
conflicts=('cryptsetup')
provides=('cryptsetup')
options=('!emptydirs')
source=("git+https://gitlab.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}"
        "hooks-encrypt"
        "install-encrypt"
        "install-sd-encrypt")
sha256sums=('SKIP'
            '10461d20fe3bc357864ace3b408a2e93b4b03b5cff023def3ab126ae9857720d'
            'd325dc239ecc9a5324407b0782da6df2573e8491251836d6c4e65fa61339ce57'
            '46af2f1353db1909fc483f20e3fa1e13f1e7c0d14f44c0d6163ce0862916c613')

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
