# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=openssh-gssapi
_pkgname=openssh
pkgver=7.5p1
pkgrel=3
pkgdesc='Free version of the SSH connectivity tools'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-headers')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
validpgpkeys=('59C2118ED206D927E667EBE3D3E5F56B6D920D30')
source=("https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.conf'
        'sshd.pam'
        'openssl-1.1.0.patch'
        'get_canonical_hostname.patch'
        'gssapi.patch'
        'gssapi-openssl-1.1.0.patch')
sha1sums=('5e8f185d00afb4f4f89801e9b0f8b9cee9d87ebd'
          'SKIP'
          'cc1ceec606c98c7407e7ac21ade23aed81e31405'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'c9b2e4ce259cd62ddb00364d3ee6f00a8bf2d05f'
          'd93dca5ebda4610ff7647187f8928a3de28703f3'
          '6d9ea19bb4fa2e4b5f14cad331f36bfbdaafd067'
          '16a3dc0ddcffbcfb7b166dc5839cee6536597c8e'
          '1f835864ef2a64d919e57c8337f711a1b9442af4'
          '445edf93cd3f66294d6465a95ee32437ac1d4c56')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # OpenSSL 1.1.0 patch from http://vega.pgw.jp/~kabe/vsd/patch/openssh-7.4p1-openssl-1.1.0c.patch.html
    patch -Np1 -i ../openssl-1.1.0.patch

    # GSSAPI patches
    patch -Np1 -i ../get_canonical_hostname.patch
    patch -Np1 -i ../gssapi.patch
    patch -Np1 -i ../gssapi-openssl-1.1.0.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/ssh \
        --sysconfdir=/etc/ssh \
        --with-ldns \
        --with-libedit \
        --with-ssl-engine \
        --with-pam \
        --with-privsep-user=nobody \
        --with-kerberos5=/usr \
        --with-xauth=/usr/bin/xauth \
        --with-mantype=man \
        --with-md5-passwords \
        --with-pid-dir=/run \
        --with-gssapi

    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Tests require openssh to be already installed system-wide,
    # also connectivity tests will fail under makechrootpkg since
    # it runs as nobody which has /bin/false as login shell.

    if [[ -e /usr/bin/scp && ! -e /.arch-chroot ]]; then
        make tests
    fi
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE"

    install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
    install -Dm644 ../sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
    install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
    install -Dm644 ../sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
    install -Dm644 ../sshd.conf "${pkgdir}"/usr/lib/tmpfiles.d/sshd.conf
    install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

    install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
    install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
    install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

    sed \
        -e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
        -e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
        -e '/^#UsePAM no$/c UsePAM yes' \
        -i "${pkgdir}"/etc/ssh/sshd_config
}
