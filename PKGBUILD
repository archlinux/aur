# Maintainer: Andrew Bednoff <commandr at commandr.stream>
# Maintainer: Xyne <xyne at archlinux.ca>
pkgname=gnupg1
pkgname_=gnupg
pkgver=1.4.23
pkgrel=1
pkgdesc="GNU Privacy Guard - a complete and free implementation of the OpenPGP standard."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h' 'armv7l' 'armv8h' 'armv8l')
license=('GPL3')
depends=('zlib' 'bzip2' 'libldap>=2.4.18' 'libusb-compat' 'curl>=7.16.2' 'readline>=6.0.00' 'pinentry')
provides=("gnupg1=${pkgver}")
replaces=('gnupg1' 'gnupg1-extended')
conflicts=('gnupg1' 'gnupg1-extended')
source=("https://gnupg.org/ftp/gcrypt/gnupg/$pkgname_-$pkgver.tar.bz2"{,.sig})
install=gnupg.install
url="http://www.gnupg.org/"
sha1sums=('13747486ed5ff707f796f34f50f4c3085c3a6875'
          'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
              '46CC730865BB5C78EBABADCF04376F3EE0856959'
              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
              'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9')

build() {
    cd "${srcdir}/${pkgname_}-${pkgver}"

    # Fix multiple definitions issue
    env LDFLAGS="-z muldefs" \
    ./configure \
        --prefix=/usr/ \
        --exec-prefix=/usr/ \
        --libexecdir=/usr/lib/ \
        --enable-maintainer-mode \
        --enable-noexecstack
    make

# Further options to prevent DNS leaks when working with TOR
# https://trac.torproject.org/projects/tor/ticket/2846

#    --disable-dns-pka \
#    --disable-dns-srv \
#    --disable-dns-cert \
#    --disable-ldap \

}

check() {
    cd "${srcdir}/${pkgname_}-${pkgver}"
    # All 27 tests should be passed successfully
    make -k check
}

package () {
    cd "${srcdir}/${pkgname_}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Renaming to fix file name conflicts with gnupg (gnupg2) package

    cd "${pkgdir}"

    find ./usr/bin ./usr/share/man/man1/ -type f -regextype 'posix-extended' -regex '.*/gpg[^-./]*' -exec mv -v '{}' '{}1' \;

    find ./usr/bin ./usr/share/man/man1/ -type f -regextype 'posix-extended' -regex '.*/gpg[-.].*' -exec rename -v gpg gpg1 '{}' \;

    find ./usr/bin ./usr/share/man/man1/ -type f -regextype 'posix-extended' -regex '.*/gpgv[-.].*' -exec rename -v gpgv gpgv1 '{}' \;

    find ./ -type f -regextype 'posix-extended' -regex '.*/gnupg[^1/]*' -exec rename -v gnupg gnupg1 '{}' \;

    find ./ -type d -regextype 'posix-extended' -regex '.*/gnupg[^1/]*' -exec rename -v gnupg gnupg1 '{}' \+

}

