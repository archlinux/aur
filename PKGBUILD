# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=freeipa
pkgname=(python-ipalib
         python-ipaclient
         python2-ipalib
         python2-ipaclient
         freeipa-common
         freeipa-client-common
         freeipa-client)
pkgver=4.4.1
pkgrel=1
pkgdesc='The Identity, Policy and Audit system'
arch=('i686' 'x86_64')
url='http://www.freeipa.org/'
license=('GPL3')
makedepends=('nspr'
             'nss'
             'openssl'
             'openldap'
             'krb5>=1.13'
             'libutil-linux'
             'curl>7.21.7'
             'xmlrpc-c>=1.27.4'
             'popt'
             'python'
             'python2'
             'python2-ldap'
             'python2-setuptools'
             'python2-nss'
             'python2-cryptography>=0.9'
             'python2-netaddr'
             'python2-gssapi>=1.1.2'
             'python2-memcached'
             'sssd>=1.14.0'
             'python2-lxml'
             'python2-pyasn1>=0.0.9a'
             'python2-qrcode'
             'python2-dnspython>=1.11.1'
             'systemd'
             'libunistring'
             'python2-yubico>=1.2.3'
             'python2-six'
             'ding-libs>=0.5.0'
             'python2-dbus'
             'python2-netifaces')
source=("http://freeipa.org/downloads/src/freeipa-$pkgver.tar.gz"
        0001-platform-add-Arch-Linux-platform.patch
        0002-dogtag-vault-do-not-import-pki-in-makeapi.patch
        0003-client-install-do-not-assume-etc-krb5.conf.d-exists.patch)
sha256sums=('f5d7fbc47b6800be6edff1b62135f22dbd240fbfd3d2f72dd9bfbf2aa02be3ee'
            'f83ce0074fcaad1cb038a1b41e29c355752aab24d97b6eae1778826c5986b109'
            '9b294f4dd1172c5356b7526ca12657fc90c11154a32c2032e20a678fa9fcedc5'
            '3939187f198ac317a9dfc1723037d1ae30aed4e174f3dd1fe5efbe21da07ceec')

prepare() {
    cd "${pkgbase}-${pkgver}"

    rm -rf ipaplatform/archlinux

    patch -p1 <"$srcdir"/0001-platform-add-Arch-Linux-platform.patch
    patch -p1 <"$srcdir"/0002-dogtag-vault-do-not-import-pki-in-makeapi.patch
    patch -p1 <"$srcdir"/0003-client-install-do-not-assume-etc-krb5.conf.d-exists.patch
}

build() {
    cd "${pkgbase}-${pkgver}"

    # Arch specific
    export PYTHON=/usr/bin/python2
    mkdir -p _install

    export SUPPORTED_PLATFORM=archlinux

    # Force re-generate of platform support
    export IPA_VENDOR_VERSION_SUFFIX=-$pkgrel
    rm -f ipapython/version.py
    rm -f ipaplatform/services.py
    rm -f ipaplatform/tasks.py
    rm -f ipaplatform/paths.py
    rm -f ipaplatform/constants.py
    make version-update
    cd client; ../autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin; cd ..

    make IPA_VERSION_IS_GIT_SNAPSHOT=no client

    make client-install DESTDIR="$PWD"/_install

    (cd ipalib && make PYTHON=/usr/bin/python3 IPA_VERSION_IS_GIT_SNAPSHOT=no DESTDIR=../_install install)
    (cd ipapython && make PYTHON=/usr/bin/python3 IPA_VERSION_IS_GIT_SNAPSHOT=no DESTDIR=../_install install)
    (cd ipaplatform && /usr/bin/python3 setup.py install --root ../_install)
    (cd ipaclient && /usr/bin/python3 setup.py install --root ../_install)

    # Switch shebang of /usr/bin/ipa
    # XXX: ipa cli is not stable enough for enabling py3 support, keep it in py2
    # in any case
    sed -i -e'1s/python\(3\|$\)/python2/' _install/usr/bin/ipa

    mkdir -p _install/usr/share/ipa

    mkdir -p _install/etc/ipa/
    mkdir -p _install/etc/ipa/nssdb
    mkdir -p _install/var/lib/ipa-client/sysrestore
    mkdir -p _install/etc/bash_completion.d
    install -pm 644 contrib/completion/ipa.bash_completion _install/etc/bash_completion.d/ipa
}

package_python-ipalib() {
    pkgdesc='Python libraries used by IPA'
    arch=('any')
    depends=("freeipa-common=$pkgver-$pkgrel"
             'python-gssapi>=1.1.2'
             'gnupg'
             'keyutils'
             'python-nss>=0.16'
             'python-cryptography>=0.9'
             'python-lxml'
             'python-netaddr'
             'sssd'
             'python-qrcode>=5.0.0'
             'python-pyasn1'
             'python-dateutil'
             'python-yubico>=1.2.3'
             'python-dbus'
             'python-setuptools'
             'python-six'
             'python-pyldap>=2.4.15'
             'python-dnspython>=1.11.1'
             'python-netifaces>=0.10.4'
             'python-pyusb')
    provides=("python-ipapython=$pkgver-$pkgrel"
              "python-ipaplatform=$pkgver-$pkgrel")

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/lib/python3.*/site-packages/ipapython \
                 _install/usr/lib/python3.*/site-packages/ipalib \
                 _install/usr/lib/python3.*/site-packages/ipaplatform \
                 _install/usr/lib/python3.*/site-packages/ipapython-*.egg-info \
                 _install/usr/lib/python3.*/site-packages/ipalib-*.egg-info \
                 _install/usr/lib/python3.*/site-packages/ipaplatform-*.egg-info
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}

package_python-ipaclient() {
    pkgdesc='Python libraries used by IPA client'
    arch=('any')
    depends=("freeipa-client-common=$pkgver-$pkgrel"
             "freeipa-common=$pkgver-$pkgrel"
             "python-ipalib=$pkgver-$pkgrel"
             'python-dnspython>=1.11.1')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/lib/python3.*/site-packages/ipaclient \
                 _install/usr/lib/python3.*/site-packages/ipaclient-*.egg-info
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}

package_python2-ipalib() {
    pkgdesc='Python libraries used by IPA'
    arch=('any')
    depends=("freeipa-common=$pkgver-$pkgrel"
             'python2-gssapi>=1.1.2'
             'gnupg'
             'keyutils'
             'python2-nss>=0.16'
             'python2-cryptography>=0.9'
             'python2-lxml'
             'python2-netaddr'
             'sssd'
             'python2-qrcode>=5.0.0'
             'python2-pyasn1'
             'python2-dateutil'
             'python2-yubico>=1.2.3'
             'python2-dbus'
             'python2-setuptools'
             'python2-six'
             'python2-ldap>=2.4.15'
             'python2-dnspython>=1.11.1'
             'python2-netifaces>=0.10.4'
             'python2-pyusb')
    provides=("python2-ipapython=$pkgver-$pkgrel"
              "python2-ipaplatform=$pkgver-$pkgrel")
    conflicts=('freeipa-python')
    replaces=('freeipa-python')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/lib/python2.*/site-packages/ipapython \
                 _install/usr/lib/python2.*/site-packages/ipalib \
                 _install/usr/lib/python2.*/site-packages/ipaplatform \
                 _install/usr/lib/python2.*/site-packages/ipapython-*.egg-info \
                 _install/usr/lib/python2.*/site-packages/ipalib-*.egg-info \
                 _install/usr/lib/python2.*/site-packages/ipaplatform-*.egg-info
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}

package_python2-ipaclient() {
    pkgdesc='Python libraries used by IPA client'
    arch=('any')
    depends=("freeipa-client-common=$pkgver-$pkgrel"
             "freeipa-common=$pkgver-$pkgrel"
             "python2-ipalib=$pkgver-$pkgrel"
             'python2-dnspython>=1.11.1')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/lib/python2.*/site-packages/ipaclient \
                 _install/usr/lib/python2.*/site-packages/ipaclient-*.egg-info
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}

package_freeipa-common() {
    pkgdesc='Common files used by IPA'
    arch=('any')
    conflicts=('freeipa-python')
    replaces=('freeipa-python')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/share/locale/*/*/ipa.mo
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}

package_freeipa-client-common() {
    pkgdesc='Common files used by IPA client'
    arch=('any')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/etc/ipa/nssdb \
                 _install/usr/share/ipa \
                 _install/var/lib/ipa-client/sysrestore \
                 _install/usr/share/man/man5/default.conf.5.gz
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done

}

package_freeipa-client() {
    pkgdesc='IPA authentication for use on clients'
    depends=("freeipa-client-common=$pkgver-$pkgrel"
             "freeipa-common=$pkgver-$pkgrel"
             "python2-ipaclient=$pkgver-$pkgrel"
             'python2-ldap'
             'cyrus-sasl-gssapi'
             'ntp'
             'krb5'
             'authconfig'
             'pam-krb5'
             'curl>=7.21.7'
             'yp-tools'
             'xmlrpc-c>=1.27.4'
             'sssd>=1.14.0'
             'certmonger>=0.78'
             'nss'
             'bind-tools'
             'oddjob'
             'python2-gssapi>=1.1.2'
             'autofs'
             'nfsidmap'
             'nfs-utils')
    conflicts=('freeipa-admintools')
    replaces=('freeipa-admintools')
    install=freeipa-client.install

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/etc/bash_completion.d \
                 _install/usr/bin/ipa \
                 _install/usr/bin/ipa-client-install \
                 _install/usr/bin/ipa-client-automount \
                 _install/usr/bin/ipa-certupdate \
                 _install/usr/bin/ipa-getkeytab \
                 _install/usr/bin/ipa-rmkeytab \
                 _install/usr/bin/ipa-join \
                 _install/usr/share/man/man1/ipa.1 \
                 _install/usr/share/man/man1/ipa-getkeytab.1.gz \
                 _install/usr/share/man/man1/ipa-rmkeytab.1.gz \
                 _install/usr/share/man/man1/ipa-client-install.1.gz \
                 _install/usr/share/man/man1/ipa-client-automount.1.gz \
                 _install/usr/share/man/man1/ipa-certupdate.1.gz \
                 _install/usr/share/man/man1/ipa-join.1.gz
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}
