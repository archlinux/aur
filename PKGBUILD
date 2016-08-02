# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: François Steinmetz <francois.steinmetz@gmail.com>
# Contributor: Zdenek Janecek <jan.zdenek@gmail.com>
# Based on Fedora authconfig.spec

pkgname=(authconfig authconfig-gtk)
pkgver=6.2.10
pkgrel=1
pkgdesc='Command line tool for setting up authentication from network services'
arch=('i686' 'x86_64')
url='https://fedorahosted.org/authconfig/'
license=('GPL')
depends=('libnewt' 'libpwquality' 'openssl' 'pam>=0.99.10.0' 'sssd>=1.13.0')
makedepends=('desktop-file-utils'
             'intltool'
             'perl-xml-parser'
             'python2')
conflicts=('freeipa-client<2.2.0' 'nss_ldap<254' 'pam-krb5<1.49' 'samba<3.0')
backup=(etc/conf.d/authconfig
        etc/pam.d/system-auth-ac
        etc/pam.d/system-login-ac)
source=("https://fedorahosted.org/releases/a/u/authconfig/${pkgname}-${pkgver}.tar.bz2"
        0001-Adapt-to-Arch-Linux.patch)
sha256sums=('b9897f526825107287687084bd414c565a42b23e1669df0bf1a82cc460d3b78f'
            'bbecf678693b96489239b37236846ba1a8058285fdf68f47d674b534137ee119')

prepare() {
    cd "${pkgbase}-${pkgver}"

    rm -f man/en/system-login-ac.5

    patch -p1 <"$srcdir"/0001-Adapt-to-Arch-Linux.patch

    autoreconf -fi
}

build() {
    cd "${pkgbase}-${pkgver}"

    PYTHONREV=2 ./configure --prefix=/usr \
                            --sysconfdir=/etc \
                            --localstatedir=/var \
                            --sbindir=/usr/bin
    make sysconfigdir=/etc/conf.d

    mkdir -p _install
    make install sysconfigdir=/etc/conf.d DESTDIR="$PWD"/_install

    find _install/usr/share -name '*.mo' | xargs ./utf8ify-mo

    rm -f  _install/usr/lib/python*/site-packages/acutil.a
    rm -f  _install/usr/lib/python*/site-packages/acutil.la
    rm -f  _install/usr/share/"$pkgbase"/authconfig-tui.py
    ln -s authconfig.py _install/usr/share/"$pkgbase"/authconfig-tui.py

    sed -ri '1s/python/python2/' _install/usr/share/"$pkgbase"/*.py
}

package_authconfig() {
    cd "${pkgbase}-${pkgver}"

    local _file
    for _file in _install/etc/conf.d/authconfig \
                 _install/etc/pam.d/system-auth-ac \
                 _install/etc/pam.d/system-login-ac \
                 _install/usr/bin/authconfig \
                 _install/usr/bin/authconfig-tui \
                 _install/usr/bin/cacertdir_rehash \
                 _install/usr/lib/python2.*/site-packages/acutil.so \
                 _install/usr/share/"$pkgbase"/authconfig.py* \
                 _install/usr/share/"$pkgbase"/authconfig-tui.py* \
                 _install/usr/share/"$pkgbase"/authinfo.py* \
                 _install/usr/share/"$pkgbase"/dnsclient.py* \
                 _install/usr/share/"$pkgbase"/msgarea.py* \
                 _install/usr/share/"$pkgbase"/shvfile.py* \
                 _install/usr/share/locale/*/*/authconfig.mo \
                 _install/usr/share/man/man5/* \
                 _install/usr/share/man/man8/authconfig.* \
                 _install/usr/share/man/man8/authconfig-tui.* \
                 _install/usr/share/man/man8/cacertdir_rehash.* \
                 _install/var/lib/authconfig
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done

    chmod 700 "$pkgdir"/var/lib/authconfig

    install -D -m644 -t"$pkgdir"/usr/share/doc/"$pkgname" COPYING \
                                                          NOTES \
                                                          README.samba3 \
                                                          TODO
}

package_authconfig-gtk() {
    pkgdesc='Graphical tool for setting up authentication from network services'
    depends=("${pkgbase}=${pkgver}-${pkgrel}"
             'hicolor-icon-theme'
             'pygtk>=2.14.0'
             'python2-dbus'
             'usermode')
    backup=(etc/pam.d/authconfig
            etc/pam.d/authconfig-gtk
            etc/pam.d/authconfig-tui
            etc/pam.d/system-config-authentication
            etc/security/console.apps/authconfig
            etc/security/console.apps/authconfig-gtk
            etc/security/console.apps/authconfig-tui
            etc/security/console.apps/system-config-authentication)

    cd "${pkgbase}-${pkgver}"

    local _file
    for _file in _install/etc/pam.d/authconfig \
                 _install/etc/pam.d/authconfig-gtk \
                 _install/etc/pam.d/authconfig-tui \
                 _install/etc/pam.d/system-config-authentication \
                 _install/etc/security/console.apps/authconfig \
                 _install/etc/security/console.apps/authconfig-gtk \
                 _install/etc/security/console.apps/authconfig-tui \
                 _install/etc/security/console.apps/system-config-authentication \
                 _install/usr/bin/authconfig-gtk \
                 _install/usr/bin/system-config-authentication \
                 _install/usr/share/"$pkgbase"/authconfig.glade \
                 _install/usr/share/"$pkgbase"/authconfig-gtk.py* \
                 _install/usr/share/applications/* \
                 _install/usr/share/icons/hicolor/*/apps/system-config-authentication.* \
                 _install/usr/share/man/man8/authconfig-gtk.* \
                 _install/usr/share/man/man8/system-config-authentication.*
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}
