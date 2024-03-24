# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Cyra Westmere <cyra@slowest.network>
# Contributor: random-nick <random-nick@email.com>
# Based on the official firefox package by:
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=waterfox
pkgver=G6.0.11
pkgrel=1
pkgdesc="Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements."
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.waterfox.net/"
depends=(
	gtk3
	libxt
	mime-types
	dbus-glib
	nss
	ttf-font
)
makedepends=(
	cbindgen
	clang
	diffutils
	dump_syms
	imake
	jack
	lld
	llvm
	mercurial
	mesa
	nasm
	nodejs
	python
	rust
	unzip
	wasi-compiler-rt
	wasi-libc
	wasi-libc++
	wasi-libc++abi
	xorg-server-xvfb
	yasm
	zip
)

optdepends=(
	'hunspell-en_US: Spell checking, American English'
	'libnotify: Notification integration'
	'networkmanager: Location detection via available WiFi networks'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'xdg-desktop-portal: Screensharing with Wayland'
)

options=(!emptydirs !makeflags !strip)
source=(
	$pkgname-$pkgver.tar.gz::https://github.com/WaterfoxCo/Waterfox/archive/refs/tags/$pkgver.tar.gz
	$pkgname.desktop
)
b2sums=(
	'861e981cd9a7a0a497e7f3a752a435d63825ae4227abfffbf8019387432b44eaf950360ff06968cf65f74d3f7396a3e168e9c8c97ba3be1f1bea14011746ba58'
	'b40c9d21c97f1b1ac9cae61593427c18f2262e39484874ad2077be7484f929ad7785406541f1b964041f6cd43f1fdd5c98e4942af3586de67d7b9c50a829a996'
)

prepare () {
	mkdir -p mozbuild
	cd "Waterfox-$pkgver"

	cat > ../mozconfig <<EOT
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Branding
ac_add_options --with-app-name=waterfox
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
EOT
}

build () {
	cd Waterfox-$pkgver

	export MOZ_NOSPAM=1
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none

	# LTO needs more open files
	ulimit -n 4096

	# prevents references to $srcdir being included in error messages
	# some references still remain in libxul.so and omni.ja
	CFLAGS+=" -ffile-prefix-map=$srcdir=."
	CXXFLAGS+=" -ffile-prefix-map=$srcdir=."

	# suppress warnings
	CFLAGS+=" -w"
	CXXFLAGS+=" -w"
#_disable_pgo=y # uncomment this to disable building the profiled browser and using PGO
	if [[ -z $_disable_pgo ]]; then
 # Do 3-tier PGO
	echo "Building instrumented browser..."
	cat >.mozconfig ../mozconfig - <<EOT
ac_add_options --enable-profile-generate=cross
EOT
	./mach build

	echo "Profiling instrumented browser..."
	./mach package
	LLVM_PROFDATA=llvm-profdata \
		JARLOG_FILE="$PWD/jarlog" \
		xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
		./mach python build/pgo/profileserver.py

	stat -c "Profile data found (%s bytes)" merged.profdata
	test -s merged.profdata

	stat -c "Jar log found (%s bytes)" jarlog
	test -s jarlog

	echo "Removing instrumented browser..."
	./mach clobber

	echo "Building optimized browser..."
	cat >.mozconfig ../mozconfig - <<EOT
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
EOT
else
	./mach build

	echo "Building symbol archive..."
	./mach buildsymbols
fi
}

package () {
	cd Waterfox-$pkgver
	DESTDIR="$pkgdir" ./mach install

	local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
	install -Dvm644 /dev/stdin "$vendorjs" <<EOT
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
EOT

	local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
	install -Dvm644 /dev/stdin "$distini" <<EOT
[Global]
id=archlinux
version=1.0
about=Waterfox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
EOT

	local i theme=waterfox
	for i in 16 22 24 32 48 64 128 256; do
		install -Dvm644 browser/branding/$theme/default$i.png \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
	install -Dvm644 browser/branding/$theme/content/about-logo.png \
		"$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
	install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
		"$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
	install -Dvm644 browser/branding/$theme/content/identity-icons-brand.svg \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

	install -Dvm644 ../$pkgname.desktop \
		"$pkgdir/usr/share/applications/$pkgname.desktop"

	# Install a wrapper to avoid confusion about binary path
	install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOT
#!/usr/bin/env sh
exec /usr/lib/$pkgname/waterfox "\$@"
EOT

	# Replace duplicate binary with wrapper
	# https://bugzilla.mozilla.org/show_bug.cgi?id=658850
	ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/waterfox-bin"

	# Use system certificates
	local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
	if [[ -e $nssckbi ]]; then
		ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
	fi
}
