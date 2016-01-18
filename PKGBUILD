pkgname=openssh-pkcs11
pkgver=7.1p2
pkgrel=1
pkgdesc='Free version of the SSH connectivity tools with pkcs11 patch from Damien Miller, https://goo.gl/Kp3Hmi'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
conflicts=("${pkgname/-pkcs11}")
provides=("${pkgname/-pkcs11}=${pkgver}-${pkgrel}")
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname/-pkcs11}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.conf'
        'sshd.pam'
        'pkcs11.patch')
sha1sums=('9202f5a2a50c8a55ecfb830609df1e1fde97f758'
          'cc1ceec606c98c7407e7ac21ade23aed81e31405'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'c9b2e4ce259cd62ddb00364d3ee6f00a8bf2d05f'
          'd93dca5ebda4610ff7647187f8928a3de28703f3'
          '8214dedc930d74e412d70638e560700f8a08f34c')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

prepare() {
    cd "${srcdir}/${pkgname/-pkcs11}-${pkgver}"
    patch -p1 -i ../pkcs11.patch
}


build() {
    cd "${srcdir}/${pkgname/-pkcs11}-${pkgver}"

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

    make
}

check() {
    cd "${srcdir}/${pkgname/-pkcs11}-${pkgver}"

    #make tests || true
    # hard to suitably test connectivity:
    # - fails with /bin/false as login shell
    # - fails with firewall activated, etc.
}

package() {
    cd "${srcdir}/${pkgname/-pkcs11}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

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
