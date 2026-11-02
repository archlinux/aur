# Maintainer: Vedran Hrabar <vedran.hrabar@outlook.com>

pkgbase=secure-eye
pkgname=('secure-eye' 'secure-eye-gui')
pkgver=0.3.3
pkgrel=1
pkgdesc="Face authentication for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/vhrabar/SecureEye"
license=('GPL-2.0-only' 'MIT')
makedepends=(
	'meson>=1.7'
	'ninja'
	'pkgconf'
	'python'
	'pam'
	'libevdev'
	'libinih'
	'qt6-base'
	'qt6-declarative'
)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        'secure-eye.install')
sha256sums=('c85c127d857119068e8a94d50220419fdb4ce7aa8cc733ecb1c33762d1ac83b8'
            '0fd67104baa53d214df7ef54a03485a7dfc83a86dc52050a23e8cc697b3d4e18')

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
		-Duser_models_dir=/etc/secureEye/models \
		-Dwith_polkit=true \
		-Dinstall_gui=true
	meson compile -C build
}

package_secure-eye() {
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
	optdepends=(
		'secure-eye-gui: app to enroll face models, test recognition and edit the configuration'
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

	meson install -C build --destdir "$pkgdir" \
		--tags pam_module,bin,py_sources,config,systemd,bash_completion,polkit,meta,man

	install -dm700 "$pkgdir/etc/secureEye/models"
	install -Dm644 "$_srcname/secureEye/rpm/secure-eye.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/secure-eye.conf"

	install -Dm644 "$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_srcname/licenses/MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
	install -Dm644 "$_srcname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
	install -Dm644 "$_srcname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_secure-eye-gui() {
	pkgdesc="Face authentication for Linux - management app"
	license=('GPL-2.0-only')
	depends=(
		"secure-eye=$pkgver"
		'gcc-libs'
		'glibc'
		'qt6-base'
		'qt6-declarative'
		'kirigami'
	)
	optdepends=(
		'qqc2-desktop-style: native KDE look'
		'breeze-icons: icons'
		'polkit: saving the configuration and switching face login'
	)

	meson install -C build --destdir "$pkgdir" --tags gui

	install -Dm644 "$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
