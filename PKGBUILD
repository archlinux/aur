# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-dotconfig
pkgver=9.2p1
pkgrel=1
pkgdesc='Premier connectivity tool for remote login with the SSH protocol - but moved $HOME/.ssh to $HOME/.config/ssh'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=('x86_64')
depends=('glibc' 'krb5' 'openssl' 'libedit' 'ldns' 'libxcrypt' 'libcrypt.so' 'zlib' 'pam')
makedepends=('linux-headers' 'libfido2')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')
#source=("git://anongit.mindrot.org/openssh.git?signed#tag=V_8_2_P1"
source=("https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname%-*}-${pkgver}.tar.gz"
		"${pkgname%-*}-9.0p1-sshd_config.patch"
        'sshdgenkeys.service'
        'sshd.service'
        'sshd.conf'
        'sshd.pam')
sha256sums=('3f66dbf1655fb45f50e1c56da62ab01218c228807b21338d634ebcdf9d71cf46'
			'27e43dfd1506c8a821ec8186bae65f2dc43ca038616d6de59f322bd14aa9d07f'
            'e5305767b2d317183ad1c5022a5f6705bd9014a8b22495a000fd482713738611'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')
b2sums=('8d0b5e43cb42cba105a1fe303c447a2b85151cb33ec7ed47747d75c5a61d0f07f0ee4b1020b79c13eb8de4b451c5a844a8afc7ebbbea7ffeceafc3bf59cb8d21'
        '29e1a1c2744e0234830c6f93a46338ea8dc943370e20a24883d207d611025e54643da678f2826050c073a36be48dfdc7329d4cfb144c2ff90607a5f10f73dc59'
		'09fad3648f48f13ee80195b90913feeba21240d121b1178e0ce62f4a17b1f7e58e8edc22c04403e377ab300f5022a804c848f5be132765d5ca26a38aab262e50'
        '07ad5c7fb557411a6646ff6830bc9d564c07cbddc4ce819641d31c05dbdf677bfd8a99907cf529a7ee383b8c250936a6423f4b4b97ba0f1c14f627bbd629bd4e'
        '27571f728c3c10834a81652f3917188436474b588f8b047462e44b6c7a424f60d06ce8cb74839b691870177d7261592207d7f35d4ae6c79af87d6a7ea156d395'
        '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930')
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')
provides=('openssh')
conflicts=('openssh')

prepare() {
    patch -Np1 -d "${pkgname%-*}-$pkgver" -i ../"${pkgname%-*}"-9.0p1-sshd_config.patch

	cd "$srcdir/${pkgname%-*}-$pkgver"
    grep -rl "\.ssh" * | xargs sed -i 's/\.ssh/.config\/ssh/g'
	autoreconf
}

build() {
	cd "$srcdir/${pkgname%-*}-$pkgver"

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
		--with-pid-dir=/run \
		--with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin' \

	make
}

check() {
  cd "${pkgname%-*}-${pkgver}"

  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit
}

package() {
	cd "${srcdir}/${pkgname%-*}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
	install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname%-*}/"

    install -Dm644 ../sshdgenkeys.service -t "${pkgdir}"/usr/lib/systemd/system/
	install -Dm644 ../sshd.service -t "${pkgdir}"/usr/lib/systemd/system/
	install -Dm644 ../sshd.conf  -t "${pkgdir}"/usr/lib/tmpfiles.d/
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

	install -Dm755 contrib/findssl.sh -t "${pkgdir}"/usr/bin/
	install -Dm755 contrib/ssh-copy-id -t "${pkgdir}"/usr/bin/
	install -Dm644 contrib/ssh-copy-id.1 -t "${pkgdir}"/usr/share/man/man1/
}
