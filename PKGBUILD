# $Id: PKGBUILD 241658 2015-07-01 05:21:46Z bisson $
# Maintainer (Arch): Gaetan Bisson <bisson@archlinux.org>
# Contributor (Arch): Aaron Griffin <aaron@archlinux.org>
# Contributor (Arch): judd <jvinet@zeroflux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>

_pkgname=openssh
pkgname=openssh-knock
pkgver=6.9p1
pkgrel=1
pkgdesc='Free version of the SSH connectivity tools, with support for stealth TCP sockets'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
conflicts=(${_pkgname})
provides=(${_pkgname})
makedepends=('linux-libre-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
validpgpkeys=('59C2118ED206D927E667EBE3D3E5F56B6D920D30'
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        #"http://gnunet.org/sites/default/files/${_pkgname}-linux-knock-patch_0.diff"
        "https://repo.parabola.nu/other/knock/patches/openssh/${_pkgname}-${pkgver}-linux-knock-patch.diff"{,.sig}
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.conf'
        'sshd.pam')
sha1sums=('86ab57f00d0fd9bf302760f2f6deac1b6e9df265' 'SKIP'
          '149450fd40099e274a09b033cd2ff6e7439e64e8' 'SKIP'
          'cc1ceec606c98c7407e7ac21ade23aed81e31405'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'c9b2e4ce259cd62ddb00364d3ee6f00a8bf2d05f'
          'd93dca5ebda4610ff7647187f8928a3de28703f3')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	patch -Np1 -i "${srcdir}"/${_pkgname}-${pkgver}-linux-knock-patch.diff
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
