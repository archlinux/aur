# Maintainer: Defined Networking, Inc. <support@defined.net>
pkgname=dnclient
pkgver=0.9.5
pkgrel=1
pkgdesc="Managed Nebula client for Defined Networking overlay networks"
arch=('x86_64' 'aarch64')
url="https://www.defined.net"
license=('LicenseRef-Proprietary')
backup=('etc/conf.d/dnclient')
install=dnclient.install
options=('!strip' '!debug')

source=('dnclient.service'
        'dnclient@.service'
        'dnclient.confd'
        'LICENSE')
source_x86_64=("https://dl.defined.net/stable/apt/dnclient/dnclient_${pkgver}_amd64.deb")
source_aarch64=("https://dl.defined.net/stable/apt/dnclient/dnclient_${pkgver}_arm64.deb")
noextract=("dnclient_${pkgver}_amd64.deb"
           "dnclient_${pkgver}_arm64.deb")
sha256sums=('ebc3679e59c50233f81be93de9232928adcd6c2b9a37d19ca8bb3614c3d55e3f'
            'dce83e9fdb6cf1b2e42b726f768afea556af42472b428a2da839cbc64b5abf37'
            'ecdce0108e62d88853513bc5ec0e95601293558bc16738f7e2cbcf174ffd0d74'
            '7f753320cbb045dd01674a227acb69368baa92dfb3da50bcd4a9c5598bcb8d7c')
sha256sums_x86_64=('754b7890f986c01bb8a3b40a6be59a0ed90846aeb22129a4ef26f0695e62874b')
sha256sums_aarch64=('788806311f96e044c8c63af1f9f5a9a6d2b634ade3cb040c3aa65c5e3573baf1')

case "$CARCH" in
	x86_64) _debarch=amd64 ;;
	aarch64) _debarch=arm64 ;;
esac

prepare() {
	mkdir -p deb
	bsdtar -xOf "dnclient_${pkgver}_${_debarch}.deb" 'data.tar.*' | bsdtar -xf - -C deb
	# The deb man page references Debian paths in its FILES section.
	gunzip -f deb/usr/share/man/man1/dnclient.1.gz
	sed -i \
		-e 's|/etc/default/dnclient|/etc/conf.d/dnclient|g' \
		-e 's|/lib/systemd/system/|/usr/lib/systemd/system/|g' \
		deb/usr/share/man/man1/dnclient.1
	grep -q '/etc/conf.d/dnclient' deb/usr/share/man/man1/dnclient.1
	grep -q '/usr/lib/systemd/system/' deb/usr/share/man/man1/dnclient.1
	# The unit-path sed matches a substring of the /usr form; if the deb man
	# page ever moves to /usr/lib itself, it would double the prefix.
	! grep -q '/usr/usr/' deb/usr/share/man/man1/dnclient.1
}

package() {
	install -Dm755 deb/usr/bin/dnclient "$pkgdir/usr/bin/dnclient"
	install -Dm644 deb/usr/share/man/man1/dnclient.1 "$pkgdir/usr/share/man/man1/dnclient.1"
	# -n keeps the gzip header free of filename/mtime for reproducible builds.
	gzip -9n "$pkgdir/usr/share/man/man1/dnclient.1"
	install -Dm644 dnclient.service "$pkgdir/usr/lib/systemd/system/dnclient.service"
	install -Dm644 dnclient@.service "$pkgdir/usr/lib/systemd/system/dnclient@.service"
	install -Dm644 dnclient.confd "$pkgdir/etc/conf.d/dnclient"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Persistent state directory, kept in the package so pacman creates it
	# with the right mode before the first service start.
	install -dm700 "$pkgdir/var/lib/defined"
}
