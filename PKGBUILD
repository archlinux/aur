# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_ff_displayname=FirefoxESR
_ff_theme=official

_pkgname=firefox-esr
pkgname=firefox-esr-globalmenu
pkgver=115.8.0
pkgrel=2
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release. (With appmenu patch from Ubuntu)"
url="https://www.mozilla.org/en-US/firefox/enterprise/"
arch=(x86_64)
license=(MPL-2.0)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
	dbus-glib
	botan
	ffmpeg
	gtk3
	appmenu-gtk-module
	libpulse
	libxss
	libxt
	mime-types
	nss
	icu
	ttf-font)
makedepends=(
	cbindgen
	clang
	diffutils
	imake
	inetutils
	jack
	lld
	llvm
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
	zip)
optdepends=(
	'hunspell-en_US: Spell checking, American English'
	'libnotify: Notification integration'
	'networkmanager: Location detection via available WiFi networks'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'xdg-desktop-portal: Screensharing with Wayland')
options=(
	!emptydirs
	!lto
	!makeflags)
source=(
	"https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz"{,.asc}
	assert.patch
	D187418.patch
	D187749.patch
	unity-menubar.patch
	fix_csd_window_buttons.patch
	icu-74.patch)
validpgpkeys=(
	# Mozilla Software Releases <release@mozilla.com>
	# https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
	'14F26682D0916CDD81E37B6D61B7B526D98F0353')
sha1sums=(
		'd2bd2c47676c0c8575bcccbad4742dcdc23bc698'
		'SKIP'
		'bb4bbaddc549edd3506b5e955840fcebffcafb71'
		'b3ccca02959d94ef2a5db8f140ff96a2cd9724ef'
		'559ce09fee54c849ea4da2bf881da37f5fc0cac9'
		'076dc68b2ec6c454afe9b5a9b3fbb7908ce575b8'
		'4193d307cfc152ef2813973b0eae4385a4a2a968'
		'54a3b8938f64aa41b03581e48c660851d4676253')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
	if ! mkdir mozbuild; then
		error "Remove '$srcdir' before build!"
		exit 1
	fi
	
	cd firefox-$pkgver

	for patch in "${source[@]}"; do
		if [[ $patch == *.patch ]]; then
			msg2 "applying $patch"
			patch --no-backup-if-mismatch -Np1 < "$srcdir/$patch"
		fi
	done

	echo -n "$_google_api_key" >google-api-key
	echo -n "$_mozilla_api_key" >mozilla-api-key

	cat >../mozconfig <<-END
		ac_add_options --enable-application=browser
		mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

		ac_add_options --prefix=/usr
		ac_add_options --enable-release
		ac_add_options --enable-hardening
		ac_add_options --enable-optimize
		ac_add_options --enable-rust-simd
		ac_add_options --enable-linker=lld
		ac_add_options --disable-install-strip
		ac_add_options --disable-elf-hack
		ac_add_options --disable-bootstrap
		ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

		# Branding
		ac_add_options --with-branding=browser/branding/$_ff_theme
		ac_add_options --enable-update-channel=release
		ac_add_options --with-distribution-id=org.archlinux
		ac_add_options --with-app-name=$_pkgname
		export MOZILLA_OFFICIAL=1
		export MOZ_APP_REMOTINGNAME=$_pkgname
		export MOZ_APP_PROFILE="mozilla/$_pkgname"

		# Keys
		ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
		ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
		ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

		# System libraries
		ac_add_options --with-system-libvpx
		ac_add_options --with-system-webp
		ac_add_options --with-system-libevent
		ac_add_options --with-system-ffi
		ac_add_options --with-system-pixman
		ac_add_options --with-system-zlib
		ac_add_options --with-system-jpeg
		# does not have APNG support
		# ac_add_options --with-system-png
		ac_add_options --with-system-nspr
		ac_add_options --with-system-nss
		ac_add_options --with-system-icu

		# Features
		ac_add_options --enable-alsa
		ac_add_options --enable-jack
		ac_add_options --enable-crashreporter
		ac_add_options --disable-updater
		ac_add_options --disable-tests

		# System addons
		ac_add_options --with-unsigned-addon-scopes=app,system
		ac_add_options --allow-addon-sideload

	END

if [[ -n $_SCCACHE ]]; then
	echo 'ac_add_options --with-ccache=sccache' >> ../mozconfig
fi

if [[ $_ff_theme == 'official' ]]; then
	echo 'ac_add_options --enable-official-branding' >> ../mozconfig
fi
}

build() {
	cd firefox-$pkgver

	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MOZ_NOSPAM=1
	MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
	export MOZ_BUILD_DATE

	# malloc_usable_size is used in various parts of the codebase
	CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

	# LTO needs more open files
	ulimit -n 4096

	# Do 3-tier PGO
	echo "Building instrumented browser..."
	cat >.mozconfig ../mozconfig - <<-END
		ac_add_options --enable-profile-generate=cross
	END
	./mach build

	echo "Profiling instrumented browser..."

	./mach package
	LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
		xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
			./mach python build/pgo/profileserver.py

	stat -c "Profile data found (%s bytes)" merged.profdata
	test -s merged.profdata

	stat -c "Jar log found (%s bytes)" jarlog
	test -s jarlog

	echo "Removing instrumented browser..."
	./mach clobber

	echo "Building optimized browser..."
	cat >.mozconfig ../mozconfig - <<-END
		ac_add_options --enable-lto=cross
		ac_add_options --enable-profile-use=cross
		ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
		ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
	END
	./mach build # && echo "Building symbol archive..." & ./mach buildsymbols
}

package() {
	local desktopid=org.mozilla.$_pkgname
	local vendordir="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/"
	local distdir="$pkgdir/usr/lib/$_pkgname/distribution/"
	local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"

	cd firefox-$pkgver
	DESTDIR="$pkgdir" ./mach install

	# Distribution
	install -Dvm644 /dev/stdin "$vendordir/default-preferences.js" <<-END
		// Use LANG environment variable to choose locale
		pref("intl.locale.requested", "");

		// Don't disable extensions in the application directory
		pref("extensions.autoDisableScopes", 0);
		pref("extensions.enabledScopes", 15);

	END

	install -Dvm644 /dev/stdin "$distdir/distribution.ini" <<-END
		[Global]
		id=archlinux
		version=1.0
		about=Mozilla Firefox for Arch Linux [Global Menu]

		[Preferences]
		# Distribution
		mozilla.partner.id="archlinux"
		app.distributor=archlinux
		app.distributor.channel=$pkgname
		app.partner.archlinux=archlinux

		# Enable GNOME Shell search provider
		browser.gnome-search-provider.enabled=true

		# Enable backspace button backward
		browser.backspace_action=0

		# Default use system title bar
		browser.tabs.inTitlebar=0
		browser.theme.dark-private-windows=false

		# Use system-provided dictionaries
		spellchecker.dictionary_path="/usr/share/hunspell"

		# Restore Compact Mode
		browser.compactmode.show=true

	END

	# Icons
	for i in 22 24 256; do
		install -Dvm644 browser/branding/$_ff_theme/default$i.png \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
	done
	for i in 16 32 48 64 128; do
		install -dvm755 "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
		ln -svf "/usr/lib/$_pkgname/browser/chrome/icons/default/default$i.png" \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
	done

	install -Dvm644 browser/branding/$_ff_theme/content/about-logo.png \
		"$pkgdir/usr/share/icons/hicolor/192x192/apps/$desktopid.png"
	install -Dvm644 browser/branding/$_ff_theme/content/about-logo@2x.png \
		"$pkgdir/usr/share/icons/hicolor/384x384/apps/$desktopid.png"

	install -Dvm644 browser/branding/$_ff_theme/content/about-logo.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$desktopid.svg"
	install -Dvm644 browser/branding/$_ff_theme/content/about-logo.svg \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$desktopid-symbolic.svg"

	# Use system certificates
	if [[ -e $nssckbi ]]; then
		ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
	fi

	# Search Providers
	install -Dvm644 /dev/stdin \
	"$pkgdir/usr/share/gnome-shell/search-providers/$desktopid.search-provider.ini" < <(\
		sed "s|firefox.desktop|$desktopid.desktop|" \
			browser/components/shell/search-provider-files/firefox-search-provider.ini\
	)

	# Metainfo
	install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/$desktopid.metainfo.xml" < <(\
		VERSION=$pkgver DATE=$(date +%Y-%m-%d) envsubst < <(\
			sed "s|org.mozilla.firefox|$desktopid|g" \
				taskcluster/docker/firefox-flatpak/org.mozilla.firefox.appdata.xml.in)\
	)

	# Install a launcher for set necessary environment variable
	install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<-END
		#!/usr/bin/env sh
		export MOZ_APP_LAUNCHER="\$0" # Used for determine whether firefox is default browser
		export MOZ_DESKTOP_FILE_NAME=$desktopid # https://bugzilla.mozilla.org/show_bug.cgi?id=1438051
		exec /usr/lib/$_pkgname/$_pkgname "\$@"

	END

	# Desktop
	install -Dvm755 /dev/stdin "$pkgdir/usr/share/applications/$desktopid.desktop" < <(\
		sed -e "/^Name.*=/s|Firefox|$_ff_displayname|g" \
			-e "s|Exec=firefox|Exec=/usr/bin/$_pkgname|g" \
			-e "s|Icon=org.mozilla.firefox|Icon=$desktopid|g" \
			-e "s|StartupWMClass=firefox|StartupWMClass=$_pkgname|" \
			taskcluster/docker/firefox-flatpak/org.mozilla.firefox.desktop\
	)

	# Replace duplicate binary with link
	# https://bugzilla.mozilla.org/show_bug.cgi?id=658850
	ln -srfv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"
}

# vim:set sw=2 sts=-1 et:
