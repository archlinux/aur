# Maintainer: Brad Ackerman <brad@facefault.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Cholasta <grubber at grubber cz>
# Contributor: François Steinmetz <francois.steinmetz@gmail.com>
# Contributor: Zdenek Janecek <jan.zdenek@gmail.com>

pkgname=authconfig
pkgver=7.0.1
pkgrel=2
pkgdesc='Command line tool for setting up authentication from network services'
arch=('i686' 'x86_64')
url='https://pagure.io/authconfig'
license=('GPL')
depends=('libpwquality' 'openssl' 'pam>=0.99.10.0' 'sssd>=1.13.0')
makedepends=('intltool' 'python')
conflicts=('freeipa-client<2.2.0' 'nss_ldap<254' 'pam-krb5<1.49' 'samba<3.0')
replaces=('authconfig-gtk')
backup=(etc/conf.d/authconfig
        etc/pam.d/system-auth-ac
        etc/pam.d/system-login-ac)
options=(emptydirs)
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        0001-Adapt-to-Arch-Linux.patch)
sha256sums=('60a3f58b6c43d5875cdeeeb75dfd5fb1cfa74c2576119d19bed6d2d03ed24456'
            '0d7e49586a4cf449230234c192ca2b1846a69c7b4ffba2d46d91bd1128f30777')

prepare() {
    cd "${pkgname}-${pkgver}"

    rm -f man/en/system-login-ac.5

    patch --verbose -p1 <"$srcdir"/0001-Adapt-to-Arch-Linux.patch

    autoreconf -fi
}

build() {
    cd "${pkgname}-${pkgver}"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --sbindir=/usr/bin \
                --with-python-rev=3
    make sysconfigdir=/etc/conf.d
}

package() {
    cd "${pkgname}-${pkgver}"

    make install sysconfigdir=/etc/conf.d DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/lib/python*/site-packages/acutil.a
    rm "$pkgdir"/usr/lib/python*/site-packages/acutil.la

    find "$pkgdir"/usr/share -name '*.mo' | xargs ./utf8ify-mo

    chmod 700 "$pkgdir"/var/lib/authconfig

    install -D -m644 -t"$pkgdir"/usr/share/doc/"$pkgname" HOWTO.AD-client \
                                                          NOTES \
                                                          TODO
}
