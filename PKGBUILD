# $Id: PKGBUILD 244503 2015-08-23 08:42:41Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-gssapi
_pkgname=openssh
pkgver=7.1p2
pkgrel=1
pkgdesc='Free version of the SSH connectivity tools'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-headers')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
validpgpkeys=('59C2118ED206D927E667EBE3D3E5F56B6D920D30')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.conf'
        'sshd.pam'
        'gssapi-p0.patch'
        'gssapi-p1.patch'
        'gssapi-p2.patch')
sha1sums=('9202f5a2a50c8a55ecfb830609df1e1fde97f758'
          'cc1ceec606c98c7407e7ac21ade23aed81e31405'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'c9b2e4ce259cd62ddb00364d3ee6f00a8bf2d05f'
          'd93dca5ebda4610ff7647187f8928a3de28703f3'
          '1c2686eca191892a41a899219e1083bc7526967a'
          'b11a223eccd8832e75dc69ba5e5b3c5d8606565c'
          '4ef9b3550107750637d2306777e472167e60653c')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i ../gssapi-p0.patch
    patch -p1 -i ../gssapi-p1.patch
    patch -p1 -i ../gssapi-p2.patch
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
        --with-gssapi \

	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make tests || true
	# hard to suitably test connectivity:
	# - fails with /bin/false as login shell
	# - fails with firewall activated, etc.
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
