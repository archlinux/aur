# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.12.0
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"zfs-pivy.hook"
	"zfs-pivy.install"
	"https://github.com/arekinath/pivy/releases/download/v$pkgver/pivy-$pkgver.tar.gz"
	"https://github.com/arekinath/mini-pcsc/archive/v0.3.1.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)'
            'pam: PAM plugin (pam_pivy.so)')
makedepends=(pkgconf cryptsetup zfs-utils json-c pam ragel)
sha256sums=('7925467b71227ae835cc5bf5ebf0b74ea6d740738af5d13be05e0416a78f8acc'
            '8da0bc793ba9b7fb1cb784af1ed066aea478b93715f484e7fb7921184d675b84'
            'a26a4bfe9eef806aaac2821d6502451cdd070786c84a0f47b2c032b9f07aa4a5'
            '98bb03098ce847d009e1579b0e4ece48ad2e9e7984325e54c8b3edfc4c63fef6')

# Don't use --as-needed when linking, will break pam_pivy
LDFLAGS+=" -Wl,--no-as-needed"

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr USE_ZFS=yes USE_LUKS=yes USE_PAM=yes USE_JSONC=yes
	make prefix=/usr libpivy.so
	cd "../mini-pcsc-0.3.1"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" USE_ZFS=yes USE_LUKS=yes USE_PAM=yes USE_JSONC=yes install

	# install the experimental libpivy
	install -o root -g root -m 0755 -d "${pkgdir}/usr/lib"
	install -o root -g root -m 0755 libpivy.so.1 "${pkgdir}/usr/lib/libpivy.so.1"
	ln -s libpivy.so.1 "${pkgdir}/usr/lib/libpivy.so"
	install -o root -g root -m 0755 -d "${pkgdir}/usr/include/pivy"
	for x in *.h; do
		install -o root -g root -m 0644 ${x} "${pkgdir}/usr/include/pivy/${x}"
	done
	install -o root -g root -m 0755 -d "${pkgdir}/usr/include/pivy/openssh"
	for x in config.h digest.h sshkey.h sshbuf.h ssherr.h; do
		install -o root -g root -m 0644 openssh/${x} "${pkgdir}/usr/include/pivy/openssh/${x}"
	done
	install -o root -g root -m 0755 -d "${pkgdir}/usr/include/pivy/openssl"
	for x in asn1.h asn1t.h bio.h bn.h buffer.h cms.h conf.h crypto.h dh.h dsa.h ecdsa.h ec.h err.h evp.h lhash.h objects.h obj_mac.h opensslconf.h opensslfeatures.h opensslv.h ossl_typ.h pkcs7.h rsa.h safestack.h sha.h stack.h x509.h x509v3.h x509_vfy.h; do
		install -o root -g root -m 0644 libressl/include/openssl/${x} "${pkgdir}/usr/include/pivy/openssl/${x}"
	done

	cd "../mini-pcsc-0.3.1"
	install -o root -g root -m 0755 -d "${pkgdir}/usr/lib"
	install -o root -g root -m 0755 libminipcsc.so "${pkgdir}/usr/lib/libminipcsc.so"

	cd "$srcdir"
	hookdir="${pkgdir}/usr/lib/initcpio/hooks"
	hookinsdir="${pkgdir}/usr/lib/initcpio/install"
	install -o root -g root -m 0755 -d "$hookdir"
	install -o root -g root -m 0644 zfs-pivy.hook "${hookdir}/zfs-pivy"
	install -o root -g root -m 0755 -d "$hookinsdir"
	install -o root -g root -m 0644 zfs-pivy.install "${hookinsdir}/zfs-pivy"
}
