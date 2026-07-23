# Maintainer: Vedran Hrabar <vedran.hrabar@outlook.com>

pkgbase=secureeye
pkgname=('libpam-secureeye' 'secureeye-authd')
pkgver=0.1.2
pkgrel=1
pkgdesc="Face authentication for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/vhrabar/SecureEye"
license=('GPL-2.0-only' 'MIT')
makedepends=(
	'meson>=0.64'
	'ninja'
	'pkgconf'
	'pam'
	'libevdev'
	'libinih'
	'python'
	'systemd'
)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        'secureeye-authd.install')
sha256sums=('c848207d44068849a13150a8b47a3d45806a9a43b9c868d1f5915ed8c2cf2d18'
            'e68c31756e7196406ec24bd55cdab1af473a35c2abdd4c44a2ca9ace525beb73')

_srcname="SecureEye-$pkgver"

prepare() {
	cd "$_srcname"

	# The deb/rpm packages run the daemon from a wheel venv built at install
	sed -i 's|/usr/lib/secureeye-authd/venv/bin/python3|/usr/bin/python3|' \
		secureEye/src/systemd/secureeye-authd.service.in
}

build() {
	meson setup "$_srcname" build \
		--wrap-mode=nodownload \
		--buildtype=plain \
		--prefix=/usr \
		--libdir=lib \
		--sysconfdir=/etc \
		--localstatedir=/var \
		-Dinstall_pam_config=false \
		-Dconfig_dir=/etc/secureEye \
		-Duser_models_dir=/etc/secureEye/models
	meson compile -C build
}

package_libpam-secureeye() {
	pkgdesc="PAM module for SecureEye face authentication"
	depends=('pam' 'libevdev' 'libinih' 'gcc-libs' 'glibc')
	optdepends=('secureeye-authd: authentication daemon, without it the module always fails')

	# Install tags keep each split package to its own files.
	meson install -C build --destdir "$pkgdir" --tags pam_module

	install -Dm644 "$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_srcname/licenses/MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
	install -Dm644 "$_srcname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

package_secureeye-authd() {
	pkgdesc="SecureEye authentication daemon, CLI and Python runtime components"
	depends=(
		'python'
		'python-numpy'
		'python-opencv'
		'python-matplotlib'
		'python-cffi'
		'python-absl'
		'python-flatbuffers'
		'portaudio'
		'v4l-utils'
		'systemd'
	)
	# amd64 -> mediapipe (default backend)
	# aarch64 -> dlib
	depends_x86_64=('python-mediapipe' 'python-sounddevice')
	depends_aarch64=('python-dlib')
	optdepends=(
		'libpam-secureeye: PAM integration, required to actually log in with SecureEye'
		'python-dlib: dlib recognition backend'
		'python-mediapipe: mediapipe recognition backend'
		'ffmpeg: ffmpeg camera capture backend'
		'python-ffmpeg-python: ffmpeg camera capture backend'
		'python-keyboard: hotkey rubberstamp'
	)
	backup=('etc/secureEye/config.ini')
	install=secureeye-authd.install

	meson install -C build --destdir "$pkgdir" \
		--tags bin,py_sources,config,systemd,bash_completion,meta,man

	# user_models_dir, created by the CLI on first enrolment.
	install -dm755 "$pkgdir/etc/secureEye/models"

	# The systemd unit runs as the "secureeye" user; systemd's pacman hook
	# creates it from this fragment.
	install -Dm644 "$_srcname/secureEye/rpm/secureeye-authd.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/secureeye-authd.conf"

	if [[ $CARCH != x86_64 ]]; then
		sed -i 's/^detector_backend = mediapipe/detector_backend = dlib/' \
			"$pkgdir/etc/secureEye/config.ini"
	fi

	install -Dm644 "$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_srcname/licenses/MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
	install -Dm644 "$_srcname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
	install -Dm644 "$_srcname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
