# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-dotconfig
pkgver=9.4p1
pkgrel=1
pkgdesc='Premier connectivity tool for remote login with the SSH protocol - but moved $HOME/.ssh to $HOME/.config/ssh'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=('x86_64')
depends=(
  glibc
  krb5 libkrb5.so libgssapi_krb5.so
  ldns
  libedit
  libxcrypt libcrypt.so
  openssl
  pam libpam.so
  zlib
)
makedepends=(
  libfido2
  linux-headers
)
optdepends=(
  'libfido2: FIDO/U2F support'
  'sh: for ssh-copy-id and findssl.sh'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  etc/pam.d/sshd
  etc/ssh/ssh_config
  etc/ssh/sshd_config
)

source=("https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname%-*}-${pkgver}.tar.gz"
		"${pkgname%-*}-9.0p1-sshd_config.patch"
        '00-archlinux.conf'
        'sshdgenkeys.service'
        'sshd.service'
        'sshd.conf'
        'sshd.pam')
sha256sums=('3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85'
			'27e43dfd1506c8a821ec8186bae65f2dc43ca038616d6de59f322bd14aa9d07f'
            '78b806c38bc1e246daaa941bfe7880e6eb6f53f093bea5d5868525ae6d223d30'
            'e5305767b2d317183ad1c5022a5f6705bd9014a8b22495a000fd482713738611'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '76635a91526ce44571485e292e3a777ded6a439af78cb93514b999f91fb9b327'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')
b2sums=('d13d758129cce947d3f12edb6e88406aad10de6887b19ffa3ebd8e382b742a05f2a692a8824aec99939f6c7e13fbccc3bb14e5ee112f9a9255d4882eb87dcf53'
        '29e1a1c2744e0234830c6f93a46338ea8dc943370e20a24883d207d611025e54643da678f2826050c073a36be48dfdc7329d4cfb144c2ff90607a5f10f73dc59'
        '1ff8cd4ae22efed2b4260f1e518de919c4b290be4e0b5edbc8e2225ffe63788678d1961e6f863b85974c4697428ee827bcbabad371cfc91cc8b36eae9402eb97'
		'09fad3648f48f13ee80195b90913feeba21240d121b1178e0ce62f4a17b1f7e58e8edc22c04403e377ab300f5022a804c848f5be132765d5ca26a38aab262e50'
        '07ad5c7fb557411a6646ff6830bc9d564c07cbddc4ce819641d31c05dbdf677bfd8a99907cf529a7ee383b8c250936a6423f4b4b97ba0f1c14f627bbd629bd4e'
        'a3fd8f00430168f03dcbc4a5768ed788dd43140e365a882b601510f53f69704da04f24660157bb8a43125f5389528993732d99569d77d5f3358074e7ae36d4ca'
        '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930')
provides=('openssh')
conflicts=('openssh')

prepare() {
    patch -Np1 -d "${pkgname%-*}-$pkgver" -i ../"${pkgname%-*}"-9.0p1-sshd_config.patch

	cd "$srcdir/${pkgname%-*}-$pkgver"
    grep -rl "\.ssh" * | xargs sed -i 's/\.ssh/.config\/ssh/g'

    # remove variable (but useless) first line in config (related to upstream VCS)
    sed '/^#.*\$.*\$$/d' -i ssh{,d}_config

    # prepend configuration option to include drop-in configuration files for sshd_config
    printf "# Include drop-in configurations\nInclude /etc/ssh/sshd_config.d/*.conf\n" | cat - sshd_config > sshd_config.tmp
    mv -v sshd_config.tmp sshd_config
    # prepend configuration option to include drop-in configuration files for ssh_config
    printf "# Include drop-in configurations\nInclude /etc/ssh/ssh_config.d/*.conf\n" | cat - ssh_config > ssh_config.tmp
    mv -v ssh_config.tmp ssh_config

}

build() {
    local configure_options=(
		--prefix=/usr
		--sbindir=/usr/bin
		--libexecdir=/usr/lib/ssh
		--sysconfdir=/etc/ssh
		--disable-strip
		--with-ldns
		--with-libedit
		--with-security-key-builtin
		--with-ssl-engine
		--with-pam
		--with-privsep-user=nobody
		--with-kerberos5=/usr
		--with-xauth=/usr/bin/xauth
		--with-pid-dir=/run
		--with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    )

	cd "$srcdir/${pkgname%-*}-$pkgver"
	./configure "${configure_options[@]}"
    make
}

check() {
  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit -C "${pkgname%-*}-$pkgver"
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
