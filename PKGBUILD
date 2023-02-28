# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.11.0
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"zfs-pivy.hook"
	"zfs-pivy.install"
	"https://github.com/arekinath/pivy/releases/download/v$pkgver/pivy-$pkgver.tar.gz"
	"https://github.com/arekinath/mini-pcsc/archive/v0.2.0.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)'
            'pam: PAM plugin (pam_pivy.so)')
makedepends=(pkgconf cryptsetup zfs-utils json-c pam)
sha256sums=('7925467b71227ae835cc5bf5ebf0b74ea6d740738af5d13be05e0416a78f8acc'
            '8da0bc793ba9b7fb1cb784af1ed066aea478b93715f484e7fb7921184d675b84'
            '00b17c44ed8f9c3662f903110c9345d0ec2915d5c9863e9001465fe12584ac7f'
            'a2c23b7b9e3dc976b54627a08da68b76fd6194ba45d211959dedf4700879379e')

# Don't use --as-needed when linking, will break pam_pivy
LDFLAGS+=" -Wl,--no-as-needed"

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr USE_ZFS=yes USE_LUKS=yes USE_PAM=yes USE_JSONC=yes
	cd "../mini-pcsc-0.2.0"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" USE_ZFS=yes USE_LUKS=yes USE_PAM=yes USE_JSONC=yes install

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
