# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=ldapvi
pkgver=1.7.r15.gf1d42ba
pkgrel=2
_commit=f1d42bad66cc4623d1ff21fbd5dddbf5009d3e40
pkgdesc="Interactive LDAP client for Unix terminals"
url="http://www.lichteblau.com/ldapvi/"
license=(GPL-2.0-only)
arch=(x86_64)
depends=('glib2'
         'libldap'
         'glibc'
         'libxcrypt'
         'ncurses'
         'openssl'
         'popt'
         'readline')
makedepends=('make'
             'git')
source=("git+http://www.lichteblau.com/git/$pkgname.git#commit=$_commit"
        "0001-fix-non-void-function-copy_sasl_output-should-return.patch")
b2sums=('SKIP'
        'a045f50d64d73ed21ad8213af9029f1209e3e368a0b10458e230ef2cca162d2ae89cf033fcb3cca0a23ddba1ce6a2b90eeb65a730247c9bc0696b50057cae124')

pkgver() {
    cd "$pkgname/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname/$pkgname"
    patch --forward --strip 2 --input ../../0001-fix-non-void-function-copy_sasl_output-should-return.patch || return 1
    ./autogen.sh
}

build() {
    cd "$pkgname/$pkgname"
    CFLAGS="-Wno-parentheses -Wno-implicit-function-declaration -Wno-int-conversion -Wl,-z,shstk"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname/$pkgname"
    install -Dm755 ldapvi "$pkgdir"/usr/bin/ldapvi
    install -Dm644 ldapvi.1 "$pkgdir"/usr/share/man/man1/ldapvi.1
}
