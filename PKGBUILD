# Maintainer: Expresso <ernesto.soria.2912 @ gmail dot com>
# Contributor: xales <xales at naveria dot com>
# Contributor: Voxan <admin at hessfr dot fr>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Cyra Westmere <cyra@slowest.network>
# Contributor: random-nick <random-nick@email.com>
# Based on the official firefox package by:
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=waterfox
pkgver=6.6.9
pkgrel=1
pkgdesc='Fork of Mozilla Firefox featuring some privacy, usability, and speed enhancements.'
arch=(x86_64)
license=('MPL-2.0')
url='https://www.waterfox.net/'
depends=(
	gtk3
	libxt
	mime-types
	dbus-glib
	nss
	ttf-font
	libpulse
)
makedepends=(
	cbindgen
	clang21
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
	python-pip
	rust
	unzip
	wasi-compiler-rt21
	wasi-libc
	wasi-libc++
	wasi-libc++abi
	xorg-server-xvfb
	yasm
	zip
	sccache
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
	"$pkgname-$pkgver.tar.gz::https://github.com/WaterfoxCo/Waterfox/archive/refs/tags/$pkgver.tar.gz"
	"locales.tar.gz::https://github.com/BrowserWorks/l10n/archive/3f87384c38a77e2cf90ee565e71203e3552465fb.tar.gz"
	"$pkgname.desktop"
	"0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch"
	"0002-Fix-sandbox-to-build-with-glibc-2.43.patch"
)

prepare () {
	rm -rf "$pkgname-$pkgver/waterfox/browser/locales/"*
	mv "l10n-3f87384c38a77e2cf90ee565e71203e3552465fb/"* "$pkgname-$pkgver/waterfox/browser/locales/"

	mkdir -p mozbuild
	cd "waterfox-$pkgver"

	# Use the waterfox package version so that e.g. the change notes URLs work
	echo "$pkgver" > browser/config/version_display.txt

	# This doesn't appear needed on Waterfox's vendored libwebrtc
	# # Prevent WebRTC crash
	# # https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/issues/27
	# # https://bugzilla.mozilla.org/show_bug.cgi?id=2012006
	# patch -Np1 -i ../0003-Bug-2012006-WebRTC-backport-PipeWire-capture-clear-e.patch

	# Fix build with glibc 2.43
	# https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
	patch -Np1 -i ../0001-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
	# https://bugzilla.mozilla.org/show_bug.cgi?id=2016618
	patch -Np1 -i ../0002-Fix-sandbox-to-build-with-glibc-2.43.patch


	cat > ../mozconfig <<EOT
export CC=/usr/lib/llvm21/bin/clang
export CXX=/usr/lib/llvm21/bin/clang++
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
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
ac_add_options --enable-pulseaudio
ac_add_options --enable-jxl
ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
ac_add_options --disable-profiling
ac_add_options --disable-updater
ac_add_options --disable-tests

ac_add_options --target=x86_64-pc-linux-gnu

export MOZ_INCLUDE_SOURCE_INFO=1
export MOZ_REQUIRE_SIGNING=
export MOZ_TELEMETRY_REPORTING=
EOT
}

build () {
	cd waterfox-$pkgver


    export CFLAGS="${CFLAGS/-fexceptions/}"
    export CXXFLAGS="${CXXFLAGS/-fexceptions/}"

    # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
    CFLAGS+=" -fno-exceptions"
    CXXFLAGS+=" -fno-exceptions"

	 # malloc_usable_size is used in various parts of the codebase
	CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

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

	_disable_pgo=y #comment this to enable building the profiled browser and using PGO

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
	cp ../mozconfig .mozconfig
	./mach build

	echo "Building symbol archive..."
	./mach buildsymbols
fi
}

package () {
	cd waterfox-$pkgver
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
		install -Dvm644 waterfox/browser/branding/default$i.png \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
	install -Dvm644 waterfox/browser/branding/content/about-logo.png \
		"$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
	install -Dvm644 waterfox/browser/branding/content/about-logo@2x.png \
		"$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
	install -Dvm644 waterfox/browser/themes/lepton/icons/identity-icons-brand.svg \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

	install -Dvm644 ../$pkgname.desktop \
		"$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dvm755 "obj/dist/bin/waterfox" \
    "$pkgdir/usr/lib/$pkgname/waterfox"

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

#first browser package, second icon file
sha256sums=('fc1c4010cbc2c73cace825d27692c205348b3e3b869ee762263262ae0e93bd10'
            '3f7a9beb6305b92cb023206727a69151daa70db5c72bd4b1ba5d84d2de75933c'
            '9345cdf0e1a537d8ff23b5db0eadaaec5868f7588de86a260da27f5015c2d286'
            'c99234aaf9de77b963b21c63fa2ffece130ccf653556357361520d25f928b1a9'
            'fc5a0e323d784a64a4f7b03561bfc169e4b859c2b6f6b79940301c4d0fd11b4c')
