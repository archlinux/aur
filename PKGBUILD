# $Id: PKGBUILD 223946 2014-10-07 02:36:53Z bisson $
# Maintainer (Arch): Gaetan Bisson <bisson@archlinux.org>
# Contributor (Arch): Aaron Griffin <aaron@archlinux.org>
# Contributor (Arch): judd <jvinet@zeroflux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>

_pkgname=openssh
pkgname=openssh-knock
pkgver=6.7p1
pkgrel=1
pkgdesc='Free version of the SSH connectivity tools, with support for stealth TCP sockets'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
conflicts=(${_pkgname})
provides=(${_pkgname})
makedepends=('linux-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "http://gnunet.org/sites/default/files/${_pkgname}-linux-knock-patch_0.diff"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.pam')
sha1sums=('14e5fbed710ade334d65925e080d1aaeb9c85bf6' 'SKIP'
          'f9ea1f6411548e5c29383664b5a57866bc2579f4'
          'cc1ceec606c98c7407e7ac21ade23aed81e31405'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'd93dca5ebda4610ff7647187f8928a3de28703f3')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	patch -Np1 -i "${srcdir}"/${_pkgname}-linux-knock-patch_0.diff
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	export CFLAGS="$CFLAGS -DTCP_STEALTH=25"

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
