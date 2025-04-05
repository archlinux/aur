# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_tb_displayname=ThunderbirdESR
_tb_theme=thunderbird

_pkgname=thunderbird-esr
pkgname=thunderbird-esr-globalmenu
pkgver=128.9.1
pkgrel=1
_tb_srcname="${_pkgname%%-*}-$pkgver"
pkgdesc="Standalone mail and news reader from mozilla.org (With appmenu patch)"
url="https://www.thunderbird.net/"
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
	'speech-dispatcher: Text-to-Speech'
	'libotr: OTR support for active one-to-one chats'
	'xdg-desktop-portal: Screensharing with Wayland')
options=(
	!emptydirs
	!lto
	!makeflags)
source=(
	"https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/source/thunderbird-${pkgver}esr.source.tar.xz"{,.asc}
	unity-menubar{,-comm}.patch
	org.mozilla.thunderbird.desktop)
validpgpkeys=(
	# Mozilla Software Releases <release@mozilla.com>
	# https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
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

	cd "$_tb_srcname"

	for patch in "${source[@]%%::*}"; do
		if [[ $patch == *.patch ]]; then
			msg2 "Applying $patch"
			patch --no-backup-if-mismatch -Np1 -i "$srcdir/$patch"
		fi
	done

	echo -n "$_google_api_key" >google-api-key

	cat >../mozconfig <<-END
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
		ac_add_options --with-branding=comm/mail/branding/$_tb_theme
		ac_add_options --enable-update-channel=esr
		ac_add_options --with-distribution-id=org.archlinux
		ac_add_options --with-app-name=$_pkgname
		export MOZILLA_OFFICIAL=1
		export MOZ_APP_REMOTINGNAME=$_pkgname
		export MOZ_APP_PROFILE="mozilla/${_pkgname}"

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

if [[ $_tb_theme == 'thunderbird' ]]; then
	echo 'ac_add_options --enable-official-branding' >> ../mozconfig
fi
}

build() {
	cd "$_tb_srcname"

	export RUSTUP_TOOLCHAIN=1.78
	export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=none
	export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
	export MOZ_NOSPAM=1
	MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
	export MOZ_BUILD_DATE

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
	local vendordir="$pkgdir/usr/lib/$_pkgname/defaults/pref/"
	local distdir="$pkgdir/usr/lib/$_pkgname/distribution/"
	local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"

	cd "$_tb_srcname"
	DESTDIR="$pkgdir" ./mach install

	# Distribution
	install -Dvm644 /dev/stdin "$vendordir/default-pref.js" <<-END
		// Use LANG environment variable to choose locale
		pref("intl.locale.matchOS", true);
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
		sed '/^<rect/d' comm/mail/branding/$_tb_theme/content/about-logo.svg # Make svg transparent
	) "$pkgdir/usr/share/icons/hicolor/scalable/apps/$desktopid.svg"
	install -Dvm644 <(
		sed '/^<rect/d' comm/mail/branding/$_tb_theme/TB-symbolic.svg # Make svg transparent
	) "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$desktopid-symbolic.svg"

	# Metainfo
	install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/$desktopid.metainfo.xml" < <(\
		RELEASE_NOTES_URL="https://www.${_pkgname%%-*}.net/en-US/${_pkgname%%-*}/${pkgver}esr/releasenotes/" \
		MANIFEST_URL="https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=$pkgname" \
		VERSION=$pkgver DATE=$(date +%Y-%m-%d) envsubst < <(\
			sed -e "s|org\.mozilla\.Thunderbird|$desktopid|g" \
				-e "s|<name>Thunderbird</name>|<name>$_tb_displayname</name>|" \
				comm/taskcluster/docker/tb-flatpak/org.mozilla.Thunderbird.appdata.xml.in)\
	)

	# Use system certificates
	if [[ -e $nssckbi ]]; then
		ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
	fi

	# Desktop
	install -Dvm755 /dev/stdin "$pkgdir/usr/share/applications/$desktopid.desktop" < <(\
		sed -e "/^Name.*=/s|Thunderbird|$_tb_displayname|g" \
			-e "s|Exec=thunderbird|Exec=/usr/bin/$_pkgname|g" \
			-e "s|Icon=.*\$|Icon=$desktopid|g" \
			-e "s|StartupWMClass=thunderbird|StartupWMClass=$_pkgname|" \
			"$srcdir/$desktopid.desktop"\
	)

	# Install a launcher for set necessary environment variable
	install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<-END
		#!/usr/bin/env sh
		export MOZ_APP_LAUNCHER="\$0" # For $_pkgname can correctly set itself as the default application
		export MOZ_DESKTOP_FILE_NAME=$desktopid # https://bugzilla.mozilla.org/show_bug.cgi?id=1438051
		exec /usr/lib/$_pkgname/$_pkgname --name $desktopid "\$@"

	END

	# Replace duplicate binary with link
	# https://bugzilla.mozilla.org/show_bug.cgi?id=658850
	ln -srfv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"
}

sha1sums=('128bbf84744f1b5e304110c2382725ab0231d190'
          'SKIP'
          '9788a6edefd4d34d25788f2914eb3b096690d2b7'
          '3fcb94ed04ece9c8cd511573a9db8fc2613f57bd'
          '4f9856b9882dd0e20ad15c2162352f8a685d71ba')

# vim:set sw=2 sts=-1 et:
