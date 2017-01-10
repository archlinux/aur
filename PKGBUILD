# Contributor: Loui Chang <base64: bG91aXBjLmlzdEBnbWFpbC5jb20=>

_pkgname=mutt
pkgname="${_pkgname}-hg"
pkgver=6901.7c0e7a0769e4
pkgrel=1
pkgdesc="A small but very powerful text-based mail client"
url="http://www.mutt.org/"
arch=(i686 x86_64)
license=('GPL')
depends=('gdbm' 'gpgme' 'libidn' 'mime-types' 'ncurses' 'zlib')

# Uncomment if enabling imap, pop, or smtp
#depends+=('krb5' 'libsasl' 'openssl')

makedepends=('mercurial' 'gnupg' 'libxslt')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("hg+https://dev.mutt.org/hg/mutt#branch=default")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd ${srcdir}/${_pkgname}

    # Mutt should be used with external MTAs
    # Uncomment relevant build parameters if you want to use the builtin MTA
    # Remember to adjust dependencies.
    ./prepare \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-debug \
        --enable-hcache \
        --enable-gpgme \
        --enable-pgp \
        --with-idn \
        --with-regex \
#       --enable-sidebar \
#       --enable-imap \
#       --enable-pop \
#       --enable-smtp \
#       --with-sasl \
#       --with-ssl=/usr \
#       --with-gss=/usr \

    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/etc/mime.types"*
    install -Dm644 contrib/gpg.rc "${pkgdir}/etc/Muttrc.gpg.dist"
}

