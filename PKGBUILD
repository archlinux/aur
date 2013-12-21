# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=openssh-selinux
pkgver=6.4p1
pkgrel=1
pkgdesc='Free version of the SSH connectivity tools with SELinux support'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-selinux-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns' 'libselinux')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}" "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname/-selinux}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.pam')
sha1sums=('cf5fe0eb118d7e4f9296fbc5d6884965885fc55d'
          '6df5be396f8c593bb511a249a1453294d18a01a6'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'd93dca5ebda4610ff7647187f8928a3de28703f3')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

build() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

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
		--with-selinux

	make
}

check() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	make tests ||
	grep $USER /etc/passwd | grep -q /bin/false
	# connect.sh fails when run with stupid login shell
}

package() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

	install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
	install -Dm644 ../sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
	install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
	install -Dm644 ../sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
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
