# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-gssapi
_pkgname=openssh
pkgver=9.0p1
_patch=1
pkgrel=2
pkgdesc='Premier connectivity tool for remote login with the SSH protocol'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
conflicts=(${_pkgname})
provides=(${_pkgname})
arch=('x86_64')
depends=('glibc' 'krb5' 'openssl' 'libedit' 'ldns' 'libxcrypt' 'libcrypt.so' 'zlib' 'pam')
makedepends=('linux-headers' 'libfido2' 'git')
checkdepends=('inetutils')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')

validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')
source=("https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "${pkgname}-${pkgver}-${_patch}-gssapi.patch::https://sources.debian.org/data/main/o/openssh/1:${pkgver}-${_patch}/debian/patches/gssapi.patch"
        'sshdgenkeys.service'
        'sshd.service'
        'sshd.conf'
        'sshd.pam')
sha256sums=('03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a'
            'SKIP'
            'd2f4c7bb1bc33540605a3bb0c9517d7b4ed2f5d77c24f7afcd64891be59f4ed2'
            '4031577db6416fcbaacf8a26a024ecd3939e5c10fe6a86ee3f0eea5093d533b7'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i ../${pkgname}-${pkgver}-${_patch}-gssapi.patch
    autoreconf
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/ssh \
        --sysconfdir=/etc/ssh \
        --disable-strip \
        --with-ldns \
        --with-libedit \
        --with-security-key-builtin \
        --with-ssl-engine \
        --with-pam \
        --with-privsep-user=nobody \
        --with-kerberos5=/usr \
        --with-xauth=/usr/bin/xauth \
        --with-md5-passwords \
        --with-pid-dir=/run \
        --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin' \
        --with-gssapi \

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
    install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
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
