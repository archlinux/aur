# Maintainer: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>
# Contributor: Marcin Nowak <marcin.j.nowak [at] gmail [dot] com>

pkgname=lwks-openssl
pkgver=12.5.0
pkgrel=1
pkgdesc="Lightworks with OpenSSL 1.0.1-l and CURL 7.38 workarounds"

arch=('x86_64')
url="http://www.lwks.com/"
license=('custom')
depends=('gtk3' 'portaudio' 'libgl' 'glu' 'ffmpeg-compat' 'libedit' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
provides=('lightworks')
conflicts=('lightworks', 'lwks')
source=(
    "http://www.lwks.com/dmpub/lwks-$pkgver-amd64.deb"
    "http://seblu.net/a/archive/packages/c/curl/curl-7.38.0-1-x86_64.pkg.tar.xz"
    "http://seblu.net/a/archive/packages/o/openssl/openssl-1.0.1.l-1-x86_64.pkg.tar.xz"
    )
sha256sums=(
    'd3e65af7b905267c0efe2091a8838df85e6f6611341effff974636ee1834a7b8'
    'a7332c682afcf93da0d738e363a35c43e5d0a43e6a6ad80604857be0abac95b5'
    'd1666485a04301894c7ddb2130aaa6237b6d971cd5955271bba74596ce178a16'
    )

package() {
	msg2 "Extracting data.tar.gz"
	bsdtar -zxf data.tar.gz -C "$pkgdir"

	msg2 "Extracting compatible curl 7.38"
    mkdir "$pkgdir/curl"
	bsdtar -zxf curl-7.38.0-1-x86_64.pkg.tar.xz -C "$pkgdir/curl"

	msg2 "Extracting openssl 1.0.1-l"
    mkdir "$pkgdir/openssl"
	bsdtar -zxf openssl-1.0.1.l-1-x86_64.pkg.tar.xz -C "$pkgdir/openssl"

	msg2 "Moving udev folder from /lib to /usr/lib"
	mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib
	rmdir "$pkgdir"/lib

	msg2 "Copying copyright file and creating a license dir"
	install -Dm644 "$pkgdir"/usr/share/doc/lightworks/copyright \
	"$pkgdir"/usr/share/licenses/lightworks/copyright
	ln -sr "$pkgdir"/usr/share/licenses/lightworks "$pkgdir"/usr/share/licenses/$pkgname

	msg2 "Changing some needed permissions"
	chmod a+rw "$pkgdir"/usr/share/lightworks/Preferences
	chmod a+rw "$pkgdir"/usr/share/lightworks/"Audio Mixes"

    msg2 "Copying curl files"
    cp "$pkgdir"/curl/usr/lib/libcurl.so* "$pkgdir"/usr/lib/lightworks/

    msg2 "Copying openssl files"
    cp "$pkgdir"/openssl/usr/lib/libcrypto.so* "$pkgdir"/usr/lib/lightworks/
    cp "$pkgdir"/openssl/usr/lib/libssl* "$pkgdir"/usr/lib/lightworks/
    cp "$pkgdir"/openssl/usr/bin/openssl "$pkgdir"/usr/lib/lightworks/

    msg2 "Cleaning up curl files"
    rm -rf "$pkgdir/curl"

    msg2 "Cleaning up openssl files"
    rm -rf "$pkgdir/openssl"

}
