# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_pkgname=firefox-esr
pkgname=firefox-esr-globalmenu
pkgver=115.8.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release. (With appmenu patch from Ubuntu)"
url="https://www.mozilla.org/en-US/firefox/enterprise/"
arch=(x86_64)
license=(MPL-2.0)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
	dbus
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
	firefox-115.4.0-icu-74.patch)
validpgpkeys=(
	# Mozilla Software Releases <release@mozilla.com>
	# https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
	'14F26682D0916CDD81E37B6D61B7B526D98F0353')
sha256sums=('af8086f23efc8492d286671f6035b1a915de6f4ed5c7897e40be0e1cb6b895ea'
						'SKIP'
						'ed84a17fa4a17faa70a0528556dbafeeb6ee59697451325881cb064b0ee8afec'
						'23669d3a84f186d4c73c996abd3306d41a50cedf1d7bb0c897279b082e695d15'
						'4c3b59f7cdafcdf714510ed605c667e4c0d1f540edd31b02d03330ac1f4869bb'
						'74440d292e76426ac5cba9058a6f86763c37a9aa61b7afc47771140f1f53870b'
						'e08d0bc5b7e562f5de6998060e993eddada96d93105384960207f7bdf2e1ed6e'
						'b07223e5928a5a0d4cb53e5c1a80cd93289f2f69a622c08e76d41a2434277ecc')
b2sums=('37bb3d0ef990922baa81f0083ba91f079755c6cf45df238d7ccfa4f9bc0cb597f59c7d08bc0b976dae422df0b3897d1cd153ae12970ac4e3e9fad892781c3b45'
				'SKIP'
				'bbc69752492649f288e0ceef6ce4a1703030cc98abd2442b7ebfba2be786eea643f594af5dc237a6e3c04fd0c8b147f529fd9e790f04c64b9f10abb3c826827f'
				'078aa4873c178335d66b33b6ac24cb0e5fcce632fb1ef03d13359b2b930ee9cc44b78e2ae55ec224153bcd88ecb2616feb6d446cf75b7bea4ae2394699456c46'
				'4dd2b8ac07b8c3be61ef8016562c2166e1915819fb2530f34d7619e9bf9860dfd74bb307a2911caa956809e098ae687a4446f851748a4f43fc3c8c29801a8d16'
				'4b3837b398c5391ac036a59c8df51f9ad170b2d8c3d5d2011a63bacd9e24a81de4505ddf7ef722a0a6920b02bb8dbc2bb7b6f151e2aa7843baccec0572cc56c0'
				'd5ec87260288d18718a3751c3cd9593cf00f64eabb0fc1285291bfca53fd7f2280d17607558ed4364667aef053f8d4917deec7a8dffab0f040634c8a27fa2754'
				'94992ee197bbb5ce73a8187981aa1a6a2951219c08a7f5940dec7a7c2fcc053751843785f3edcbac97cec7977262ad8b31631a16357aac84215f90650cbc40cf')

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
	mkdir mozbuild
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
		ac_add_options --enable-official-branding
		ac_add_options --enable-update-channel=release
		ac_add_options --with-distribution-id=org.archlinux
		ac_add_options --with-unsigned-addon-scopes=app,system
		ac_add_options --allow-addon-sideload
		export MOZILLA_OFFICIAL=1
		export MOZ_APP_REMOTINGNAME=${_pkgname}
		export MOZ_REMOTE_SETTINGS_DEVTOOLS=1
		# ESR
		ac_add_options --with-app-name=$_pkgname
		export MOZ_APP_PROFILE="mozilla/${_pkgname}"

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
		ac_add_options --with-system-icu
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

	END

if [[ -n $_SCCACHE ]]; then
	echo 'ac_add_options --with-ccache=sccache' >> ../mozconfig
fi
}

build() {
	cd firefox-$pkgver

	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
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
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
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
	local i theme=official

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
		install -Dvm644 browser/branding/$theme/default$i.png \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
	done
	for i in 16 32 48 64 128; do
		install -dvm755 "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
		ln -svf "/usr/lib/$_pkgname/browser/chrome/icons/default/default$i.png" \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
	done

	install -Dvm644 browser/branding/$theme/content/about-logo.png \
		"$pkgdir/usr/share/icons/hicolor/192x192/apps/$desktopid.png"
	install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
		"$pkgdir/usr/share/icons/hicolor/384x384/apps/$desktopid.png"

	install -Dvm644 browser/branding/$theme/content/about-logo.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$desktopid.svg"
	install -Dvm644 browser/branding/$theme/content/about-logo.svg \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$desktopid-symbolic.svg"

	# Replace duplicate binary with link
	# https://bugzilla.mozilla.org/show_bug.cgi?id=658850
	ln -srfv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

	# Metainfo
	install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/$desktopid.appdata.xml" < <(\
		VERSION=$pkgver DATE=$(date +%Y-%m-%d) envsubst < <(\
			sed "s|org.mozilla.firefox|$desktopid|g" \
				taskcluster/docker/firefox-flatpak/org.mozilla.firefox.appdata.xml.in)\
	)

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

	# Desktop
	install -Dvm755 /dev/stdin "$pkgdir/usr/share/applications/$desktopid.desktop" < <(\
		sed -e "s|Exec=firefox |Exec=/usr/lib/$_pkgname/$_pkgname --name $desktopid |g" \
				-e "s|Icon=org.mozilla.firefox|Icon=$desktopid|g" \
			taskcluster/docker/firefox-flatpak/org.mozilla.firefox.desktop\
	)

	# Install a wrapper to avoid confusion about binary path
	install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" < <(\
		sed "s|/app/lib/firefox/firefox |/usr/lib/$_pkgname/$_pkgname --name $desktopid |" \
			taskcluster/docker/firefox-flatpak/launch-script.sh\
	)
}

# vim:set sw=2 sts=-1 et:
