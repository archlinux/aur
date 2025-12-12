# Maintainer: Mikhail Chikishev <ylont34@gmail.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=7
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/blackteahamburger/libtgvoip/tree/tdesktop"
license=(Unlicense)
makedepends=(alsa-lib libpulse)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="7563a96b8f8e86b7a5fd1ce783388adf29bf4cf9"
source=(
	"https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip"
	"https://github.com/telegramdesktop/libtgvoip/commit/11bc9089ad136b713190e0e8f5b484cba9ad495c.patch"
	"https://github.com/telegramdesktop/libtgvoip/commit/6e82b6e45664c1f80b9039256c99bebc76d34672.patch"
	"https://github.com/blackteahamburger/libtgvoip/commit/ddfb667ba17c31898949dcbf07c863e268e5c85a.patch"
)

sha512sums=('0a38c88cc7c26049e7764e7ce9e91cda9c7381f76afccbe051aac52cd330d8c01cfab3c092a1a8e9b7296d4f4630b7b95a881bd98bd603db245df4cb5c8195e0'
            '829b552aae4b94bdee34852759ee6cf3dfc4c11f6d5926c5edc8a2a4313070a6676986dd57e1236202368d621c3b4ce5fa5218355eeb98e962a850a07518e132'
            '9891e89adafb58c0bdf067150ab09b6a234e05524ee26f72da87a2e2862681ce62dc391545d43e432dc2be772e0493b0874f2011d77aca7751cab8988b498ac8'
            '7ba642a5db780b98ccd6aaa7585d2341240e956434136744e3eb03a7ac40e0f231b3c18ad1263d61fa2cd548c11ec1da0ba97a5580f30aec40e616dde400025c')

prepare() {
	cd "$srcdir/$pkgname-${_commit}"
	patch -p1 < "$srcdir/11bc9089ad136b713190e0e8f5b484cba9ad495c.patch"
	patch -R -p1 < "$srcdir/6e82b6e45664c1f80b9039256c99bebc76d34672.patch"
	patch -p1 < "$srcdir/ddfb667ba17c31898949dcbf07c863e268e5c85a.patch"
	sed -i '1i #include <cstdint>' webrtc_dsp/modules/audio_processing/aec/aec_core.h
	sed -i '22i #include <cstdint>' webrtc_dsp/modules/audio_processing/aec/echo_cancellation.h
}
build() {
	cd "$srcdir/$pkgname-${_commit}"
	autoreconf -i
	./configure --prefix=/usr
	make -j$(nproc)
}

package() {
	cd "$srcdir/$pkgname-${_commit}"
	make DESTDIR="$pkgdir" install -j$(nproc)
}
