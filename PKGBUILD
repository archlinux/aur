# Maintainer: <random-nick at email dot com>
# Based on the official firefox package by:
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=waterfox
pkgver=G3.2.3
pkgrel=1
pkgdesc="Fork of Mozilla Firefox featuring some legacy extensions, removed telemetry and no Pocket integration. This is the Current branch."
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.waterfox.net/"
depends=(gtk3 gtk2 libxt mime-types dbus-glib nss ttf-font)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm lld jack
             python nodejs python2-psutil cbindgen nasm libpulse)
optdepends=('libnotify: Notification integration'
	    'libpulse: Audio support via Pulseaudio'
	    'jack: Audio support via JACK'
	    'ffmpeg: Multimedia playback'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags !strip)
_archivename=G3.2.3 # patch releases don't follow the same format so we can't use $pkgver
source=(Waterfox-$_archivename.tar.gz::https://github.com/MrAlex94/Waterfox/archive/$_archivename.tar.gz
        $pkgname.desktop
        0001-Use-remoting-name-for-GDK-application-names.patch)
sha256sums=('661b25e4fc386242280156d21e8d41e032a9a7daadec206ade69f84ac83529cb'
            '3c8a3e73ffcb4670ca25fc7087b9c5d93ebbef2f3be8a33cf81ae424c3f27fa3'
            '1dba448eb1605c9dc73c22861a5394b50055909399f056baee4887b29af1b51e')
#_disable_pgo=y # uncomment this to disable building the profiled browser and using PGO

prepare() {
  mkdir -p mozbuild
  cd Waterfox-$_archivename

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

  cat >../mozconfig <<END
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib
export LLVM_PROFDATA=llvm-profdata

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Branding
ac_add_options --with-app-name=waterfox
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/waterfox

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd Waterfox-$_archivename

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_USE_SYSTEM_PYTHON=1

  # LTO needs more open files
  ulimit -n 4096

  # prevents references to $srcdir being included in error messages
  # some references still remain in libxul.so and omni.ja
  CFLAGS+=" -ffile-prefix-map=$srcdir=."
  CXXFLAGS+=" -ffile-prefix-map=$srcdir=."

  # suppress warnings
  CFLAGS+=" -w"
  CXXFLAGS+=" -w"

  if [[ -z $_disable_pgo ]]; then
	# Do 3-tier PGO
	echo "Building instrumented browser..."
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
	./mach build
	./mach package

	echo "Profiling instrumented browser..."
	LLVM_PROFDATA=llvm-profdata \
				 JARLOG_FILE="$PWD/jarlog" \
				 xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
				 ./mach python build/pgo/profileserver.py
	echo "Merging profile data..."
	for i in *.profraw; do
          stat -c "Raw profile data file $i found (%s bytes)" $i
	done
	llvm-profdata merge -o merged.profdata *.profraw

	if [[ ! -s merged.profdata ]]; then
      echo "No profile data produced."
      return 1
	fi
        stat -c "Profile data found (%s bytes)" merged.profdata

	if [[ ! -s jarlog ]]; then
      echo "No jarlog produced."
      return 1
	fi
        stat -c "Profile jarlog found (%s bytes)" jarlog

	echo "Removing instrumented browser..."
	./mach clobber

	echo "Building optimized browser..."
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  else
	echo "Building browser without PGO..."
	cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
END
  fi
  ./mach build
}

package() {
  cd Waterfox-$_archivename
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Waterfox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
END

  local i theme=waterfox
  for i in 16 32 48 64 128; do
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
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/waterfox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/waterfox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}

# vim:set ts=2 sw=2 et:
