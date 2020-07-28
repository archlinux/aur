# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.6.1
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"zfs-pivy.hook"
	"zfs-pivy.install"
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.1.0.tar.gz"
	"https://github.com/arekinath/mini-pcsc/archive/v0.2.0.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)'
            'pam: PAM plugin (pam_pivy.so)')
makedepends=(pkgconf cryptsetup zfs-utils json-c pam)
sha256sums=('c78b9420751cd70c4b6cf2d437110c71452cbd6c8c44c5338c29ed7d80cba26c'
            '44b5a004a06ffe214df2810bb2d58a3ecb2bdcf1c892411a8d574afac935f678'
            '3282befc2d49b26383dc4e62f8ba9bb48a5514ca2d11af06b1b1a27fed4dad09'
            'f91aad0c8fb9cbc67c910ad6dcffb401a819b4fd122007ea7f978638db044cf6'
            'a2c23b7b9e3dc976b54627a08da68b76fd6194ba45d211959dedf4700879379e')

# Don't use --as-needed when linking, will break pam_pivy
LDFLAGS+=" -Wl,--no-as-needed"

prepare() {
	mv "libressl-3.1.0" "$pkgname-$pkgver/libressl"
}

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr USE_ZFS=yes USE_LUKS=yes USE_PAM=yes
	cd "../mini-pcsc-0.2.0"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" USE_ZFS=yes USE_LUKS=yes USE_PAM=yes install

	cd "../mini-pcsc-0.2.0"
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
