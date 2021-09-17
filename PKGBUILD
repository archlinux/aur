# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

_core_i18n=aefd745
_desktop_ftl=51320cd
_desktop_i18n=67b07d5

pkgname=anki
pkgver=2.1.35
pkgrel=3

pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="https://ankisrs.net/"
arch=('x86_64')
license=('AGPL3')

depends=(
	# anki and aqt
	'python-beautifulsoup4'
	'python-requests'
	'python-wheel'

	# anki
	'python-pysocks' # requests[socks]
	'python-decorator'
	'python-protobuf'
	'python-orjson'
	'python-distro'

	# aqt
	'python-send2trash'
	'python-markdown'
	'python-jsonschema'
	'python-pyaudio'
	'python-pyqtwebengine'
	'python-flask'
	'python-flask-cors'
	'python-waitress'
	'python-pyqt5'
)
makedepends=(
	'git'
	'rsync'

	'maturin'
	'rust'

	'python-pip'
	'python-mypy-protobuf'
	'npm'
	'typescript'
)
optdepends=(
	'lame: record sound'
	'mpv: play sound. prefered over mplayer'
	'mplayer: play sound'
)

source=(
	git+https://github.com/ankitects/anki.git#commit=84dcaa86380f9491c5f6240418235f87180831f7

	ankitects-anki-core-i18n-$_core_i18n.tar.gz::https://github.com/ankitects/anki-core-i18n/tarball/$_core_i18n
	ankitects-anki-desktop-ftl-$_desktop_ftl.tar.gz::https://github.com/ankitects/anki-desktop-ftl/tarball/$_desktop_ftl
	ankitects-anki-desktop-i18n-$_desktop_i18n.tar.gz::https://github.com/ankitects/anki-desktop-i18n/tarball/$_desktop_i18n

	0001-Move-aqt_data-to-sys.prefix-share.patch
	0002-Remove-bad-build-steps-from-makefiles.patch
	0003-Compile-.py-s-before-building-wheel.patch
	0004-Disable-auto-updates.patch
	0005-Make-pyenv-target-just-create-venv.patch
)
sha256sums=('SKIP'
            '36693fda3bb4515aa4832017155e6055e6063912bc7d62c918d1e0b3aaf8d424'
            '30a8739badea5e2d8be263c2595e25534863d8d2af23608689ebface6a64787b'
            '6500f5483d6121e9f07b64fac1bd00800107b01a353b8e15024ed30b773a26f1'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd anki
	patch -p1 <"$srcdir"/0001-Move-aqt_data-to-sys.prefix-share.patch
	patch -p1 <"$srcdir"/0002-Remove-bad-build-steps-from-makefiles.patch
	patch -p1 <"$srcdir"/0003-Compile-.py-s-before-building-wheel.patch
	patch -p1 <"$srcdir"/0004-Disable-auto-updates.patch
	patch -p1 <"$srcdir"/0005-Make-pyenv-target-just-create-venv.patch

	# Put translations in place.
	ln -sf "$srcdir"/ankitects-anki-core-i18n-*/ rslib/ftl/repo
	ln -sf "$srcdir"/ankitects-anki-desktop-ftl-*/ qt/ftl/repo
	ln -sf "$srcdir"/ankitects-anki-desktop-i18n-*/ qt/po/repo
}

build() {
	cd anki

	# Built into the shared libraries so that the Python component can check
	# that it has the same value.
	echo arch-linux-$pkgver-$pkgrel > meta/buildhash

	# Installs development modules in venv, which is required by scripts used
	# by various make targets.  The dependencies between targets are completely broken.
	make develop

	make build
}

package() {
	cd anki

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl

	install -Dm755 qt/runanki "$pkgdir"/usr/bin/anki
	install -Dm644 qt/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
	install -Dm644 qt/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
}
