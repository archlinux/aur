# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_SCCACHE=${_SCCACHE:-}

_ff_dev=${_ff_dev:-}
_ff_displayname=FirefoxESR
_ff_theme=official

_pkgname=firefox-esr
pkgname=firefox-esr-globalmenu
pkgver=140.0
pkgrel=1
_ff_srcname="firefox-$pkgver"
pkgdesc="Fast, Private & Safe Web Browser, Extended Support Release. (with appmenu patch)"
url="https://www.mozilla.org/en-US/firefox/enterprise/"
arch=(x86_64)
license=(MPL-2.0)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
	dbus-glib
	ffmpeg
	gtk3
	appmenu-gtk-module
	libpulse
	libxss
	libxt
	mime-types
	nspr
	nss
	ttf-font)
makedepends=(
	cbindgen
	clang
	diffutils
	imake
	jack
	lld
	llvm
	mesa
	nasm
	nodejs
	python
	rustup
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
	'speech-dispatcher: Text-to-Speech'
	'xdg-desktop-portal: Screensharing with Wayland')
options=(
	!emptydirs
	!lto
	!makeflags)
source=(
	"https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz"{,.asc}
	"firefox.desktop::https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/140.0-1/firefox.desktop?ref_type=tags"
	"org.mozilla.firefox.metainfo.xml::https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/140.0-1/org.mozilla.firefox.metainfo.xml?ref_type=tags"
	"0001-Install-under-remoting-name.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/140.0-1/0001-Install-under-remoting-name.patch" # Make different channels installable in parallel
	"unity-menubar.patch")
validpgpkeys=(
	# Mozilla Software Releases <release@mozilla.com>
	# https://blog.mozilla.org/security/2025/04/01/updated-gpg-key-for-signing-firefox-releases-2/
	'14F26682D0916CDD81E37B6D61B7B526D98F0353')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
	if ! mkdir mozbuild; then
		error "Remove '$srcdir' before build!"
		exit 1
	fi
	
	cd "$_ff_srcname"

	for patch in "${source[@]%%::*}"; do
		if [[ $patch == *.patch ]]; then
			msg2 "Applying $patch"
			patch --no-backup-if-mismatch -Np1 -i "$srcdir/$patch"
		fi
	done

	echo -n "$_google_api_key" >google-api-key

	cat >browser/branding/$_ff_theme/configure.sh <<-END
		MOZ_APP_DISPLAYNAME=$_ff_displayname
		#MOZ_APP_PROFILE="mozilla/$_pkgname"
		MOZ_APP_REMOTINGNAME=$_pkgname
	END

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
		ac_add_options --disable-bootstrap
		ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

		# Branding
		ac_add_options --with-branding=browser/branding/$_ff_theme
		ac_add_options --enable-update-channel=esr
		ac_add_options --with-distribution-id=org.archlinux
		ac_add_options --with-app-name=$_pkgname

		# Keys
		ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
		ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key

		# System libraries
		ac_add_options --with-system-nspr
		ac_add_options --with-system-nss

		# Features
		ac_add_options --enable-alsa
		ac_add_options --enable-jack
		ac_add_options --disable-crashreporter
		ac_add_options --disable-updater
		ac_add_options --disable-tests

		# System addons
		ac_add_options --with-unsigned-addon-scopes=app,system
		ac_add_options --allow-addon-sideload

	END

if [[ -n $_SCCACHE ]]; then
	echo 'ac_add_options --with-ccache=sccache' >> ../mozconfig
fi

if [[ -n $_ff_dev ]]; then
	echo 'export MOZ_DEV_EDITION=1' >> ../mozconfig
	echo 'MOZ_DEV_EDITION=1' >> browser/branding/$_ff_theme/configure.sh
fi

if [[ $_ff_theme == 'official' ]]; then
	echo 'ac_add_options --enable-official-branding' >> ../mozconfig
fi
}

build() {
	cd "$_ff_srcname"

	export RUSTUP_TOOLCHAIN=1.82
	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MOZ_NOSPAM=1
	MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
	export MOZ_BUILD_DATE

	# Work around https://bugzilla.mozilla.org/show_bug.cgi?id=1969383
	export RUST_MIN_STACK=16777216

	# malloc_usable_size is used in various parts of the codebase
	CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

	# Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
	CFLAGS="${CFLAGS/-fexceptions/}"
	CXXFLAGS="${CXXFLAGS/-fexceptions/}"

	# LTO needs more open files
	ulimit -n 4096

	cat >.mozconfig ../mozconfig - <<-END
		ac_add_options --enable-lto=cross,thin
	END
	./mach build --priority normal
}

package() {
	local desktopid=org.mozilla.$_pkgname
	local vendordir="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/"
	local distdir="$pkgdir/usr/lib/$_pkgname/distribution/"
	local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"

	cd "$_ff_srcname"
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
	install -Dvm644 devtools/client/themes/images/browsers/firefox.svg \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$desktopid-symbolic.svg"

	# Search Providers
	install -Dvm644 /dev/stdin \
	"$pkgdir/usr/share/dbus-1/services/org.mozilla.${_pkgname//-/_}.SearchProvider.service" < <(\
		sed -e "s|org\.mozilla\.firefox|org\.mozilla\.${_pkgname//-/_}|" \
			-e "s|/usr/bin/firefox|/usr/bin/$_pkgname|" \
			browser/components/shell/search-provider-files/org.mozilla.firefox.SearchProvider.service\
	)
	install -Dvm644 /dev/stdin \
	"$pkgdir/usr/share/gnome-shell/search-providers/$desktopid.search-provider.ini" < <(\
		sed -e "s|firefox|${_pkgname//-/_}|g" \
			-e "s|${_pkgname//-/_}.desktop|$desktopid.desktop|" \
			browser/components/shell/search-provider-files/org.mozilla.firefox.search-provider.ini\
	)

	# Metainfo
	install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/$desktopid.metainfo.xml" < <(\
		sed -e "s|org.mozilla.firefox|$desktopid|g" \
			-e "s|firefox.desktop|$desktopid.desktop|" \
			-e "s|<name>Firefox</name>|<name>$_ff_displayname</name>|" \
			-e "s|<binary>firefox</binary>|<binary>$_pkgname</binary>|" \
			"${srcdir}/org.mozilla.firefox.metainfo.xml"\
	)

	# Install a launcher for set necessary environment variable
	install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<-END
		#!/usr/bin/env sh
		export MOZ_APP_LAUNCHER="\$0" # Used for determine whether firefox is default browser
		export MOZ_DESKTOP_FILE_NAME=$desktopid # https://bugzilla.mozilla.org/show_bug.cgi?id=1438051
		exec /usr/lib/$_pkgname/$_pkgname --name $desktopid "\$@"

	END

	# Desktop
	install -Dvm755 /dev/stdin "$pkgdir/usr/share/applications/$desktopid.desktop" < <(\
		sed -e "/^Name.*=/s|Firefox.*|$_ff_displayname|g" \
			-e "/^Exec=/s|=[^ ]* |=/usr/bin/$_pkgname |g" \
			-e "s|Icon=.*\$|Icon=$desktopid|" \
			-e "s|StartupWMClass=.*\$|StartupWMClass=$_pkgname|" \
			"${srcdir}/firefox.desktop"\
	)

	# Replace duplicate binary with link
	# https://bugzilla.mozilla.org/show_bug.cgi?id=658850
	ln -srfv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"
}

sha1sums=('59b0a8ddaca40e5fa833948ee4c05a93991a0b40'
          'SKIP'
          'fd476d7629735558091bf95aa75df967f5182bee'
          '7e6e0e586eca89591ab2f32f4d76cb6ccd59f57c'
          '6f25eb98ee8905d88a7e480018b2d80bd27bad76'
          '52d2c2d3b48c1daf6cbd3d50bd525d3c959df359')

# vim:set sw=2 sts=-1 et:
