# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-dotconfig
pkgver=8.8p1
pkgrel=1
pkgdesc='Premier connectivity tool for remote login with the SSH protocol'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=('x86_64')
depends=('glibc' 'krb5' 'openssl' 'libedit' 'ldns' 'libxcrypt' 'libcrypt.so' 'zlib' 'pam')
makedepends=('linux-headers' 'libfido2')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')
#source=("git://anongit.mindrot.org/openssh.git?signed#tag=V_8_2_P1"
source=("https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname%-*}-${pkgver}.tar.gz"
        'sshd.conf'
        'sshd.pam'
        'glibc-2.31.patch')
sha256sums=('4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            'cbe71695511d3a62419299f45d3ca4efa3afaeada53f6ee439ec14cfb718c775'
            '25b4a4d9e2d9d3289ef30636a30e85fa1c71dd930d5efd712cca1a01a5019f93')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')
provides=('openssh')
conflicts=('openssh')

prepare() {
	cd "${srcdir}/${pkgname%-*}-${pkgver}"

	patch -p1 -i ../glibc-2.31.patch
    grep -rl "\.ssh" * | xargs sed -i 's/\.ssh/.config\/ssh/g'

	autoreconf
}

build() {
	cd "${srcdir}/${pkgname%-*}-${pkgver}"

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

	make
}

#check() {
	#cd "${srcdir}/${pkgname%-*}-${pkgver}"
#
	## Tests require openssh to be already installed system-wide,
	## also connectivity tests will fail under makechrootpkg since
        ## it runs as nobody which has /bin/false as login shell.
#
	#if [[ -e /usr/bin/scp && ! -e /.arch-chroot ]]; then
		#make tests
	#fi
#}

package() {
	cd "${srcdir}/${pkgname%-*}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENCE"

	install -Dm644 ../sshd.conf "${pkgdir}"/usr/lib/tmpfiles.d/sshd.conf
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	sed \
		-e '/^#KbdInteractiveAuthentication yes$/c KbdInteractiveAuthentication no' \
		-e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		-i "${pkgdir}"/etc/ssh/sshd_config
}
