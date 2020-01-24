# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=gopherus
pkgver=1.2.1
pkgrel=1
pkgdesc="Gopher client"
arch=('i686' 'x86_64')
url="http://gopherus.sourceforge.net"
license=('BSD')
depends=('ncurses')
optdepends=('sdl2')
source=(http://downloads.sourceforge.net/project/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.xz
        gopherus-1.2-ncheader.patch
        gopherus.desktop)
sha256sums=('510f71591ae2f40c55bfff47f3c215c75d85acf45184e752a381df6a6c64787b'
            '9637df8df7dfa15232b5898170b1d1d0a485628d77c2a40150db914c4fb2b866'
            'b01f1fa220cb788edf5c743a35aeff169f62eefee19d5f6dee96274e8c8cfd21')

prepare()
{
  cd "${pkgname}-${pkgver}"
  
  # Fix curses header location
  patch -p1 -i ../gopherus-1.2-ncheader.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make -f Makefile.lin CFLAGS="${CFLAGS}" gopherus gopherus-sdl
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 gopherus gopherus-sdl "${pkgdir}/usr/bin"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 gopherus.txt history.txt \
   "${pkgdir}/usr/share/doc/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  (
    cd "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/gopherus.txt LICENSE
  )

  install -Dm644 icon.svg \
   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 "${srcdir}/gopherus.desktop" \
   "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
