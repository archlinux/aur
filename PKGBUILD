# Maintainer: Crstian <me@crstian.me>
#
# El paquete no compila nada: instala el `.deb` de la Release tal cual, que es
# el mismo fichero que pasa `packaging/verify-packages.sh` y que firma
# `release.yml` (ADR-0015). Lo que cambia en cada version es `pkgver` y los
# resúmenes, y los escribe `packaging/aur/update.sh` desde la Release firmada.

pkgname=rfirma-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='Firma y cofirma de PDFs en PAdES con firma visible'
arch=('x86_64')
url='https://rfirma.sgomez.me'
license=('EUPL-1.2')
# Cada soname que enlazan `usr/bin/rfirma` y `librfirma_crypto.so`, a su paquete,
# y `hicolor-icon-theme` por las cuatro tallas del icono. `glibc` y `libgcc` no
# estan: son `base`.
depends=(
    'at-spi2-core'
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'pcsclite'
    'webkit2gtk-4.1'
    'zlib'
)
optdepends=(
    'ccid: lectores de tarjetas USB, que pcscd no trae de serie'
    'nautilus-python: «Firmar con rFirma» en el menú contextual de Nautilus'
    'opensc: módulo PKCS#11 del DNIe y de otras tarjetas'
)
provides=('rfirma')
conflicts=('rfirma' 'rfirma-git')
makedepends=('libarchive')
options=('!strip' '!debug')

_url='https://github.com/sgomez/rfirma'
source=("rfirma_${pkgver}_amd64.deb::${_url}/releases/download/v${pkgver}/rfirma_${pkgver}_amd64.deb"
        "LICENSE.md::https://raw.githubusercontent.com/sgomez/rfirma/v${pkgver}/LICENSE.md")
sha256sums=('054883b43fe2914e098548bc8366ac4f4db637d9877b525e2408c9c8611f8309'
            '2ffd0c9fce8949ae80445aac3b3a24975c053607cb9149f477fc6e4f6a4a2843')

package() {
    # makepkg ya ha desarmado el `.deb`: lo que se instala es su `data.tar.*` entero.
    bsdtar -xf data.tar.gz -C "$pkgdir"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/EUPL-1.2.txt"
}
