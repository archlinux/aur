# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=freeipa
pkgname=(freeipa-python freeipa-client freeipa-admintools)
pkgver=4.2.3
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
             'python2'
             'python2-ldap'
             'python2-setuptools'
             'python2-krbv'
             'python2-nss'
             'python2-cryptography'
             'python2-netaddr'
             'python2-kerberos>=1.1'
             'sssd>=1.13.1'
             'python2-memcached'
             'python2-lxml'
             'python2-pyasn1>=0.0.9a'
             'python2-qrcode'
             'python2-dnspython>=1.11.1'
             'systemd'
             'libunistring'
             'python2-yubico>=1.2.3')
source=("http://freeipa.org/downloads/src/freeipa-$pkgver.tar.gz"
        sss-auth-setup.py
        archlinux.patch)
sha256sums=('7b0e5cb834c6ca36bfe464ec4c6a226e44ce1948edd74b7c4344f43e75d9a133'
            '012a11cdc42e0eb072eec3dd988fa910964f355ec2ae6b67ead373ad69e84e3e'
            '3e237f89fe2d806cdc2e4694233d0e01e01996aa41036dd520b99cb6dae71eed')

prepare() {
    cd "${pkgbase}-${pkgver}"

    rm -rf ipaplatform/archlinux

    patch -p1 <"$srcdir"/archlinux.patch
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
    cd ipa-client; ../autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin; cd ..

    make IPA_VERSION_IS_GIT_SNAPSHOT=no client

    make client-install DESTDIR="$PWD"/_install

    mkdir -p _install/usr/share/ipa

    mkdir -p _install/etc/ipa/
    mkdir -p _install/etc/ipa/nssdb
    mkdir -p _install/etc/ipa/dnssec
    mkdir -p _install/var/lib/ipa-client/sysrestore
    mkdir -p _install/etc/bash_completion.d
    install -pm 644 contrib/completion/ipa.bash_completion _install/etc/bash_completion.d/ipa
}

package_freeipa-python() {
    pkgdesc='Python libraries used by IPA'
    depends=('python2-kerberos>=1.1'
             'gnupg'
             'iproute2'
             'keyutils'
             'python2-nss>=0.16'
             'python2-cryptography'
             'python2-lxml'
             'python2-netaddr'
             'sssd'
             'python2-qrcode>=5.0.0'
             'python2-pyasn1'
             'python2-dateutil'
             'python2-yubico>=1.2.3'
             'wget'
             'python2-dbus'
             'python2-setuptools')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/share/locale/*/*/ipa.mo \
                 _install/usr/lib/python2.*/site-packages/ipapython \
                 _install/usr/lib/python2.*/site-packages/ipalib \
                 _install/usr/lib/python2.*/site-packages/ipaplatform \
                 _install/usr/lib/python2.*/site-packages/default_encoding_utf8.so \
                 _install/usr/lib/python2.*/site-packages/_ipap11helper.so \
                 _install/usr/lib/python2.*/site-packages/ipapython-*.egg-info \
                 _install/usr/lib/python2.*/site-packages/freeipa-*.egg-info \
                 _install/usr/lib/python2.*/site-packages/ipaplatform-*.egg-info \
                 _install/usr/lib/python2.*/site-packages/python_default_encoding-*.egg-info \
                 _install/usr/lib/python2.*/site-packages/_ipap11helper-*.egg-info \
                 _install/etc/ipa/nssdb \
                 _install/etc/ipa/dnssec
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}

package_freeipa-client() {
    pkgdesc='IPA authentication for use on clients'
    depends=("freeipa-python=$pkgver-$pkgrel"
             'python2-ldap'
             'cyrus-sasl-gssapi'
             'ntp'
             'krb5'
             'pam-krb5'
             'curl>=7.21.7'
             'xmlrpc-c>=1.27.4'
             'sssd>=1.13.1'
             'certmonger>=0.78'
             'nss'
             'bind-tools'
             'oddjob'
             'python2-krbv'
             'python2-dnspython>=1.11.1'
             'autofs'
             'nfsidmap'
             'nfs-utils')
    install=freeipa-client.install

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/bin/ipa-client-install \
                 _install/usr/bin/ipa-client-automount \
                 _install/usr/bin/ipa-certupdate \
                 _install/usr/bin/ipa-getkeytab \
                 _install/usr/bin/ipa-rmkeytab \
                 _install/usr/bin/ipa-join \
                 _install/usr/share/ipa \
                 _install/var/lib/ipa-client/sysrestore \
                 _install/usr/lib/python2.*/site-packages/ipaclient \
                 _install/usr/share/man/man1/ipa-getkeytab.1.gz \
                 _install/usr/share/man/man1/ipa-rmkeytab.1.gz \
                 _install/usr/share/man/man1/ipa-client-install.1.gz \
                 _install/usr/share/man/man1/ipa-client-automount.1.gz \
                 _install/usr/share/man/man1/ipa-certupdate.1.gz \
                 _install/usr/share/man/man1/ipa-join.1.gz \
                 _install/usr/share/man/man5/default.conf.5.gz
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done

    install -Dm755 "$srcdir"/sss-auth-setup.py "$pkgdir"/usr/bin/sss-auth-setup
}

package_freeipa-admintools() {
    pkgdesc="IPA administrative tools"
    depends=("freeipa-python=$pkgver-$pkgrel"
             "freeipa-client=$pkgver-$pkgrel"
             'python2-krbv'
             'python2-ldap')

    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t"$pkgdir"/usr/share/doc/$pkgname README \
                                                        Contributors.txt

    local _file
    for _file in _install/usr/bin/ipa \
                 _install/etc/bash_completion.d \
                 _install/usr/share/man/man1/ipa.1
    do
        _file="${_file#_install/}"
        mkdir -p "$pkgdir"/"${_file%/*}"
        mv _install/"$_file" "$pkgdir"/"$_file"
    done
}
