# Maintainer: Sébastien Luttringer

pkgname=libnftnl-fullcone
_pkgname=libnftnl
pkgver=1.2.6
pkgrel=2
pkgdesc='Netfilter library providing interface to the nf_tables subsystem (with fullcone patch)'
arch=('x86_64')
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('libmnl')
provides=('libnftnl')
conflicts=('libnftnl')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.xz"{,.sig}
'https://github.com/wongsyrone/lede-1/raw/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch')
sha256sums=('ceeaea2cd92147da19f13a35a7f1a4bc2767ff897e838e4b479cf54b59c777f4'
            'SKIP'
            '8a5d134b9d5e41fcd47d4e8bcc6f669ae159befe54a5117460f636d6396c3501')

prepare() {
  cd $_pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $_pkgname-$pkgver
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
