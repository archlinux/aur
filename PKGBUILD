# $Id: PKGBUILD 180812 2013-03-26 12:05:13Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-multiple-bindaddress
_pkgname=openssh
pkgver=6.7p1
pkgrel=1
pkgdesc='SSH connectivity tools with multiple BindAddress patch'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-headers')
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.pam'
        'openssh_multiple_bindaddress.patch')
sha512sums=('2469dfcd289948374843311dd9e5f7e144ce1cebd4bfce0d387d0b75cb59f3e1af1b9ebf96bd4ab6407dfa77a013c5d25742971053e61cae2541054aeaca559d'
            '95a72fae435d294a89a70a8017b8e625c9fdeea5569999056176a1b8b342f4616e8c6a85e77e02a90d99358dfa990f167507d98464c19c5beff895af75b7105d'
            'd63bfaa08225a4c467945b7b849747ce33f1c10e2e34ed4dbb8f02b31d392ba3a7f3c96377222ba25bfb9eec5beebfe9130358790bfd853c180c63015b4ec249'
            'fbf8ba29eefef98a0596d255e7dab24790d828d466f06f209c63280d31a25950c88cc354296c0da9a5bd085384fa59f296809cad1ab8db6712d8158ac74da343'
            'ea1d31d84ca30fffa60b6eb06d1f532c75ff5a8acec893479cbe0f3669c62e5da9ee81be8549bae75d63e4b6fe69a4ffe6dfd4e3008e731e320d6da4bc4beae9'
            '298e47a21c337101974fa5237b3110aa3c7638b5fa53bd07661413236c8ed3212b431abaeffd875af6c9a72b4f8e1c8512e1e1960cbfff15bfee62b32d305fc3'
            '9801d6db7f7bac0ccbccf12e24bf37f97304eba02e69298b2000bfbc30904f1eb2365687db43e40429ba53f39b8f9581babba292b8552a8ac2654452e5b92b44')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

conflicts=('openssh')
provides=('openssh')

build() {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i "${srcdir}/openssh_multiple_bindaddress.patch"

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
	cd "${_pkgname}-${pkgver}"

	make  || true
	# hard to suitably test connectivity:
	# - fails with /bin/false as login shell
	# - fails with firewall activated, etc.
}

package() {
	cd "${_pkgname}-${pkgver}"

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
