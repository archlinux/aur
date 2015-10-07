# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_gitname=cryptsetup
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=cryptsetup
pkgver=v1.6.8.r2.ge97048d
pkgrel=1
pkgdesc="Userspace setup tool for transparent encryption of block devices using dm-crypt"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL')
url="https://gitlab.com/${_gitauthor}/${_gitname}"
groups=('base')
depends=('device-mapper' 'libgcrypt' 'popt' 'libutil-linux')
makedepends=('util-linux' 'git')
options=('!emptydirs')
source=("git://gitlab.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}"
        "encrypt_hook"
        "encrypt_install"
        "sd-encrypt")
sha256sums=('SKIP'
            '4406f8dc83f4f1b408e49d557515f721d91b358355c71fbe51f74ab27e5c84ff'
            'cfe465bdad3d958bb2332a05e04f2e1e884422a5714dfd1a0a3b9b74bf7dc6ae'
            'd442304e6a78b3513ebc53be3fe2f1276a7df470c8da701b3ece971d59979bdd')

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
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static --enable-cryptsetup-reencrypt
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  # install hook
  install -D -m644 "${srcdir}"/encrypt_hook "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m644 "${srcdir}"/encrypt_install "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m644 "${srcdir}"/sd-encrypt "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
}

# vim:set et sw=2 sts=2 tw=80: