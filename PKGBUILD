# Maintainer: “0xReki” <mail@0xreki.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-large-rsa
_pkgname=gnupg
pkgver=2.2.23
pkgrel=2
pkgdesc='Complete and free implementation of the OpenPGP standard - with fixes to make large RSA keys really work (and even bigger keys)'
url='http://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
optdepends=(
    'libldap: gpg2keys_ldap'
    'libusb-compat: scdaemon'
    'pcsclite'
)
makedepends=(
    'libldap'
    'libusb-compat'
    'pcsclite'
)
depends=(
    'npth'
    'libgpg-error'
    'libgcrypt'
    'libksba'
    'libassuan'
    'pinentry'
    'bzip2'
    'readline'
    'libreadline.so'
    'gnutls'
    'sqlite'
    'zlib'
    'glibc'
)
validpgpkeys=(
    'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
    '46CC730865BB5C78EBABADCF04376F3EE0856959'
    '031EC2536E580D8EA286A9F22071B08A33BD3F06'
    'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9'
)
source=(
    "https://www.gnupg.org/ftp/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig} 
    "${pkgname}.patch"
    'drop-import-clean.patch'
    'avoid-beta-warning.patch'
    'do-not-rebuild-defsincdate.patch'
)
sha256sums=('10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c'
            'SKIP'
            'b4570a8d828971f11e9ab6671aba6ba6c72b98833af583ebc25a826f64bbc956'
            '02d375f0045f56f7dd82bacdb5ce559afd52ded8b75f6b2673c39ec666e81abc'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d'
            'bb4dcba0328af6271ccfe992a64d8daa9f0a691ba52978491647f1dea05675ee')

install=install

conflicts=('dirmngr' 'gnupg2' 'gnupg')
provides=('dirmngr' "gnupg2=${pkgver}" "gnupg=${pkgver}" )
replaces=('dirmngr' 'gnupg2' 'gnupg')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # Upstream patches:
    # https://github.com/archlinux/svntogit-packages/tree/packages/gnupg/trunk
    patch -p1 -i ../avoid-beta-warning.patch
    patch -p1 -i ../drop-import-clean.patch
    patch -p1 -i ../do-not-rebuild-defsincdate.patch
    rm doc/gnupg.info*

    patch -p1 -i ../${pkgname}.patch 

    ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/gnupg \
        --enable-maintainer-mode \
        --enable-symcryptrun \
        --enable-large-secmem \

    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make check 
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    ln -s gpg "${pkgdir}"/usr/bin/gpg2
    ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

    install -Dm 644 doc/examples/systemd-user/*.* -t "${pkgdir}/usr/lib/systemd/user"
}
