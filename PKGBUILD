# Maintainer: Vedran Hrabar <vedran.hrabar@outlook.com>

pkgname=secure-eye
pkgver=0.2.0
pkgrel=1
pkgdesc="Face authentication for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/vhrabar/SecureEye"
license=('GPL-2.0-only' 'MIT')
depends=(
	'pam'
	'libevdev'
	'libinih'
	'gcc-libs'
	'glibc'
	'python'
	'python-numpy'
	'python-opencv'
	'python-matplotlib'
	'python-cffi'
	'python-dlib'
	'v4l-utils'
	'systemd'
)
depends_x86_64=('python-mediapipe')

makedepends=(
	'meson>=0.64'
	'ninja'
	'pkgconf'
)
optdepends=(
	'python-sounddevice: audio device enumeration for the mediapipe backend'
	'ffmpeg: ffmpeg camera capture backend'
	'python-ffmpeg-python: ffmpeg camera capture backend'
	'python-keyboard: hotkey rubberstamp'
)
provides=('libpam-secureeye' 'secureeye-authd')
conflicts=('libpam-secureeye' 'secureeye-authd')
replaces=('libpam-secureeye' 'secureeye-authd')
backup=('etc/secureEye/config.ini')
install=secure-eye.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        'secure-eye.install')
sha256sums=('5334f42ebc451296d9f6d22a16955b4c67b1ab6795e12c8c40a79b9fb143397f'
            'f07bfc5fd27d2e649eebafbccaaefe1be5cce3606363df9a74c7700098476d8f')

_srcname="SecureEye-$pkgver"

build() {
	meson setup "$_srcname" build \
		--wrap-mode=nodownload \
		--buildtype=plain \
		--prefix=/usr \
		--libdir=lib \
		--sysconfdir=/etc \
		--localstatedir=/var \
		-Dinstall_pam_config=false \
		-Dpython_path=/usr/bin/python3 \
		-Dconfig_dir=/etc/secureEye \
		-Duser_models_dir=/etc/secureEye/models
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir" \
		--tags pam_module,bin,py_sources,config,systemd,bash_completion,meta,man

	install -dm755 "$pkgdir/etc/secureEye/models"
	install -Dm644 "$_srcname/secureEye/rpm/secure-eye.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/secure-eye.conf"

	install -Dm644 "$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_srcname/licenses/MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
	install -Dm644 "$_srcname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
	install -Dm644 "$_srcname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
