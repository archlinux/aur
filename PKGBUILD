# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=openssh-selinux
pkgver=8.6p1
pkgrel=1
pkgdesc='Premier connectivity tool for remote login with the SSH protocol, with SELinux support'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=('x86_64')
depends=('glibc' 'krb5' 'openssl' 'libedit' 'ldns' 'libxcrypt' 'libcrypt.so' 'zlib' 'pam' 'libselinux')
makedepends=('linux-headers' 'libfido2')
checkdepends=('inetutils')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')
#source=("git://anongit.mindrot.org/openssh.git?signed#tag=V_8_2_P1"
source=("https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname/-selinux}-${pkgver}.tar.gz"{,.asc}
        'sshdgenkeys.service'
        'sshd.service'
        'sshd.conf'
        'sshd.pam'
        'glibc-2.31.patch')
sha256sums=('c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae'
            'SKIP'
            '4031577db6416fcbaacf8a26a024ecd3939e5c10fe6a86ee3f0eea5093d533b7'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846'
            '25b4a4d9e2d9d3289ef30636a30e85fa1c71dd930d5efd712cca1a01a5019f93')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

prepare() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	patch -p1 -i ../glibc-2.31.patch

	autoreconf
}

build() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

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
		--with-selinux

	make
}

check() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	# Tests require openssh to be already installed system-wide,
	# also connectivity tests will fail under makechrootpkg since
        # it runs as nobody which has /bin/false as login shell.

	if [[ -e /usr/bin/scp && ! -e /.arch-chroot ]]; then
		# Running tests in parallel is broken in 8.1p1-4, so force -j1:
		#
		# openssh-selinux/src/openssh-8.1p1/regress/ssh-rsa already exists.
		# Overwrite (y/n)? ssh-keygen for ssh-rsa failed
		# putty interop tests not enabled
		# run test putty-ciphers.sh ...
		# ssh connect with failed
		# failed simple connect
		# make[1]: *** [Makefile:211: t-exec] Error 1
		# make[1]: Leaving directory 'openssh-selinux/src/openssh-8.1p1/regress'
		# make: *** [Makefile:610: t-exec] Error 2
		make tests -j1
	fi
}

package() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

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
