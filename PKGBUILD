# Maintainer: “0xReki” <mail@0xreki.de>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-large-rsa
_pkgname=gnupg
pkgver=2.2.4
pkgrel=1
pkgdesc='Complete and free implementation of the OpenPGP standard - with fixes to make large RSA keys really work (and even bigger keys)'
url='http://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon')
makedepends=('libldap' 'libusb-compat')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline' 'gnutls' 'sqlite')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
              '46CC730865BB5C78EBABADCF04376F3EE0856959'
              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
              'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9')
source=("https://www.gnupg.org/ftp/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig} 
        "${pkgname}.patch"
       )
sha256sums=('401a3e64780fdfa6d7670de0880aa5c9d589b3db7a7098979d7606cec546f2ec'
            'SKIP'
            '2fb51506b247d047986596cce6c93d0a031830ea225b71b65d8f2b09234e348c')

install=install

conflicts=('dirmngr' 'gnupg2' 'gnupg')
provides=('dirmngr' "gnupg2=${pkgver}" "gnupg=${pkgver}" )
replaces=('dirmngr' 'gnupg2' 'gnupg')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i ${srcdir}/${pkgname}.patch 
    sed '/noinst_SCRIPTS = gpg-zip/c bin_SCRIPTS += gpg-zip' -i tools/Makefile.in
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

    cd doc/examples/systemd-user
    for i in *.*; do
        install -Dm644 "$i" "${pkgdir}/usr/lib/systemd/user/$i"
    done
}
