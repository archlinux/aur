# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=inferno
pkgver=20150328
pkgrel=2
pkgdesc='A compact operating system designed for building distributed and networked systems. (Prebuilt)'
arch=('any')
url='http://www.vitanuova.com/inferno/'
license=('GPL2')
depends_i686=('gcc-libs' 'libx11' 'libext')
depends_x86_64=('lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext')
#makedepends_i686=('gcc' 'glibc' 'mercurial')
#makedepends_x86_64=('gcc-multilib' 'lib32-glibc' 'mercurial')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://www.vitanuova.com/dist/4e/${pkgname}-${pkgver}.tgz"
        "make-install-root.sh")
sha256sums=('3f648d01a5264e1e4fd773824581205cdf9efe0a2e505298d07db21e1828ef7f'
            'SKIP')
install=${pkgname}.install

build() {
  cat > "${pkgname}/inferno" << 'END'
#!/usr/bin/env bash
ROOT="/usr/local/inferno"
IBIN="$ROOT/Linux/386/bin"
export PATH="$IBIN:$PATH"
export EMU="-r$ROOT"
exec emu "$@"
END
}

package() {
  export IROOT="usr/local/inferno"
  ./make-install-root.sh "${pkgname}" "${pkgdir}/${IROOT}"
  find "${pkgdir}/${IROOT}" -path "${pkgdir}/${IROOT}/Linux" -prune -o -exec chmod g+w {} +
  mkdir -p "${pkgdir}/${IROOT}/Linux"
  cp -r "${pkgname}/Linux/386" "${pkgdir}/${IROOT}/Linux/"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${pkgname}/inferno" "${pkgdir}/usr/bin/inferno"
  install -D -m644 "${pkgname}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}