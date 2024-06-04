# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_pkgname=thunderbird
pkgname=thunderbird-globalmenu
pkgver=115.11.1
pkgrel=1
pkgdesc="Standalone mail and news reader from mozilla.org (With appmenu patch from Ubuntu)"
install="$_pkgname.install"
url="https://www.thunderbird.net/"
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
	rustup
	unzip
	wasi-compiler-rt
	wasi-libc
	wasi-libc++
	wasi-libc++abi
	yasm
	zip)
optdepends=(
	'hunspell-en_US: Spell checking, American English'
	'libnotify: Notification integration'
	'networkmanager: Location detection via available WiFi networks'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'libotr: OTR support for active one-to-one chats'
	'xdg-desktop-portal: Screensharing with Wayland')
options=(
	!emptydirs
	!lto
	!makeflags)
source=(
	"https://archive.mozilla.org/pub/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz"{,.asc}
	"D187418.patch::https://phabricator.services.mozilla.com/D187418?download=true"
	"D187749.patch::https://phabricator.services.mozilla.com/D187749?download=true"
	"feature-unity-menubar-m-c.patch::https://github.com/Betterbird/thunderbird-patches/raw/83819e9a1df8e8e4221c3e5bce5d35492611d5ca/115/features/feature-unity-menubar-m-c.patch"
	"feature-unity-menubar-comm.patch::https://github.com/Betterbird/thunderbird-patches/raw/83819e9a1df8e8e4221c3e5bce5d35492611d5ca/115/features/feature-unity-menubar.patch"
	org.mozilla.thunderbird.desktop)
validpgpkeys=(
	# Mozilla Software Releases <release@mozilla.com>
	# https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
	'14F26682D0916CDD81E37B6D61B7B526D98F0353')
sha1sums=('7f53f00de4e71912cb210c9f8c3a42076e0e1e1f'
          'SKIP'
          'b3ccca02959d94ef2a5db8f140ff96a2cd9724ef'
          '559ce09fee54c849ea4da2bf881da37f5fc0cac9'
          '0b5cb49417c6666fe9c1ff8ea6b5f0bfacac24d0'
          '84a41fe516ce8c79e6f026029b7bda67ad4d9bf8'
          '59206e9c42055ebcd15fb5fc27ff8f12d64b1f38')

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
	cd $_pkgname-$pkgver

	for patch in "${source[@]%%::*}"; do
		if [[ $patch == *.patch ]]; then
			msg2 "Applying $patch"
			if [[ $patch == *-comm.patch ]]; then
				patch --no-backup-if-mismatch -Np1 -d "comm" -i "$srcdir/$patch"
			else
				patch --no-backup-if-mismatch -Np1 -i "$srcdir/$patch"
			fi
		fi
	done

	echo -n "$_google_api_key" >google-api-key
	echo -n "$_mozilla_api_key" >mozilla-api-key

	cat >./mozconfig <<-END
		ac_add_options --enable-application=comm/mail
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
		export MOZ_APP_PROFILE="mozilla/${_pkgname}"

		# Keys
		ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
		ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
		ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

		# System libraries
		ac_add_options --with-system-nspr
		ac_add_options --with-system-nss

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
}

build() {
	cd $_pkgname-$pkgver

	# The correct Rust version for thunderbird 115 is 1.70.0
	export RUSTUP_TOOLCHAIN=1.77

	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MOZ_NOSPAM=1
	MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
	export MOZ_BUILD_DATE

	# malloc_usable_size is used in various parts of the codebase
	CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
	CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

	./mach configure
	./mach build
	#./mach buildsymbols
}

package() {
	local desktopid=org.mozilla.$_pkgname
	local vendordir="$pkgdir/usr/lib/$_pkgname/defaults/pref/"
	local distdir="$pkgdir/usr/lib/$_pkgname/distribution/"
	local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
	local i theme=$_pkgname

	cd $_pkgname-$pkgver
	DESTDIR="$pkgdir" ./mach install

	# Distribution
	install -Dvm644 /dev/stdin "$vendordir/default-pref.js" <<-END
		// Use LANG environment variable to choose locale
		pref("intl.locale.requested", "");

		// Don't disable extensions in the application directory
		pref("extensions.autoDisableScopes", 0);
		pref("extensions.enabledScopes", 15);
		pref("extensions.shownSelectionUI", true);

		// Use system-provided dictionaries
		pref("spellchecker.dictionary_path", "/usr/share/hunspell");

		// Disable telemetry
		pref("datareporting.healthreport.uploadEnabled", false);
		pref("datareporting.policy.dataSubmissionEnabled", false);
		pref("toolkit.telemetry.archive.enabled", false);

	END

	install -Dvm644 /dev/stdin "$distdir/distribution.ini" <<-END
		[Global]
		id=archlinux
		version=1.0
		about=Mozilla Thunderbird for Arch Linux [Global Menu]

		[Preferences]
		app.distributor=archlinux
		app.distributor.channel=$_pkgname

	END

	# Icons
	for i in 16 22 24 32 48 64 128 256; do
		install -dvm755 "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
		ln -svf "/usr/lib/$_pkgname/chrome/icons/default/default$i.png" \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$desktopid.png"
	done

	install -Dvm644 <(
		sed '/^<rect/d' comm/mail/branding/$theme/content/about-logo.svg # Make svg transparent
	) "$pkgdir/usr/share/icons/hicolor/scalable/apps/$desktopid.svg"
	install -Dvm644 <(
		sed '/^<rect/d' comm/mail/branding/$theme/TB-symbolic.svg # Make svg transparent
	) "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$desktopid-symbolic.svg"

	# Metainfo
	install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/$desktopid.metainfo.xml" < <(\
		RELEASE_NOTES_URL="https://www.${_pkgname}.net/en-US/${_pkgname}/${pkgver}/releasenotes/" \
		MANIFEST_URL="https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=$pkgname" \
		VERSION=$pkgver DATE=$(date +%Y-%m-%d) envsubst < <(\
			sed "s|org.mozilla.Thunderbird|$desktopid|g" \
				comm/taskcluster/docker/tb-flatpak/org.mozilla.Thunderbird.appdata.xml.in)\
	)

	# Use system certificates
	if [[ -e $nssckbi ]]; then
		ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
	fi

	# Desktop
	install -Dvm755 /dev/stdin "$pkgdir/usr/share/applications/$desktopid.desktop" < <(\
		sed -e "s|Exec=thunderbird|Exec=/usr/bin/$_pkgname|g" \
			-e "s|Icon=org.mozilla.Thunderbird|Icon=$desktopid|g" \
			-e "s|StartupWMClass=thunderbird|StartupWMClass=$_pkgname|" \
			"$srcdir/$desktopid.desktop"\
	)

	# Install a launcher for set necessary environment variable
	install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<-END
		#!/usr/bin/env sh
		export MOZ_APP_LAUNCHER="\$0" # For $_pkgname can correctly set itself as the default application
		export MOZ_DESKTOP_FILE_NAME=$desktopid # https://bugzilla.mozilla.org/show_bug.cgi?id=1438051
		exec /usr/lib/$_pkgname/$_pkgname "\$@"

	END

	# Replace duplicate binary with link
	# https://bugzilla.mozilla.org/show_bug.cgi?id=658850
	ln -srfv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"
}

# vim:set sw=2 sts=-1 et:
