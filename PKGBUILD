# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="davutils"
pkgver=1.3.0
pkgrel=1
pkgdesc="Powerful webdav client and sync tools with client-side AES encryption"
arch=('x86_64' 'i686')
url="https://${pkgname}.sourceforge.net"
license=('BSD-2-Clause')
depends=('curl>=7.18' 'glibc' 'libxml2' 'openssl')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.tar.gz")
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/${pkgname}/dav-${pkgver}.tar.gz")
b2sums=('e8546c7be59c9e7d54949018eb8d14bd21c329c4c0cafc6c287aa76a1d550abbce2dc419688b1c783fcb88f09df55f03ac5760c73ae5909d4f59e7deba65dd68')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}"

  cd "${_pkgsrc}"
  sed -i "s/CFLAGS  =/CFLAGS = ${CFLAGS}/" gcc.mk
  sed -i "s/LDFLAGS =/LDFLAGS = ${LDFLAGS}/" gcc.mk
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CONF=gcc
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make install DESTDIR="${pkgdir}"

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "CHANGELOG" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  #install -Dm644 "scripts/dav-bash-completion.bash" \
  #  "${pkgdir}/usr/share/bash-completion/completions/dav"

  cd "docs/man"
  install -Dm644 "dav.1.man"      "${pkgdir}/usr/share/man/man1/dav.1"
  install -Dm644 "dav-sync.1.man" "${pkgdir}/usr/share/man/man1/dav-sync.1"
}
