# Maintainer: Alex thetan1735 at protonmail dot com
# Contributor: ohfp/lsf <lsf at pfho dot net>

pkgname=librewolf-kde-appmenu
_pkgname=librewolf
pkgver=121.0
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom. KDE-appmenu applied"
url="https://librewolf.net/"
arch=(x86_64 aarch64)
provides=("librewolf=${pkgver}")
conflicts=('librewolf')
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus
  ffmpeg
  gtk3
  libpulse
  libxss
  libxt
  mime-types
  nss
  ttf-font
)
makedepends=(
  binutils
  cbindgen
  clang
  diffutils
  git
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  pciutils
  python
  rust
  unzip
  'wasi-compiler-rt>15'
  'wasi-libc++>15'
  'wasi-libc++abi>15'
  'wasi-libc>=1:0+314+a1c7c2c'
  xorg-server-xvfb
  yasm
  zip
) # pciutils: only to avoid some PGO warning
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
backup=('usr/lib/librewolf/librewolf.cfg'
        'usr/lib/librewolf/distribution/policies.json')
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
_arch_git=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/firefox/trunk
_arch_git_blob=https://raw.githubusercontent.com/archlinux/svntogit-packages

install='librewolf.install'
source=(
  https://gitlab.com/api/v4/projects/32320088/packages/generic/librewolf-source/${pkgver}-${pkgrel}/librewolf-${pkgver}-${pkgrel}.source.tar.gz # {,.sig} sig files are currently broken, it seems
  $_pkgname.desktop
  "default192x192.png"
  "0018-bmo-1516081-Disable-watchdog-during-PGO-builds.patch"
  "mozilla-kde.patch"
  "firefox-kde.patch"
  "unity-menubar.patch"
)

sha256sums=('8e630a8a78a9fb2febb14fcc0d5b3991b8f21aca401362f6105100e495540339'
            'ad86df1837a4b369a9e19f07a42af81178dc8d87166ba7d3b56fe8a8235fd5ae'
            '959c94c68cab8d5a8cff185ddf4dca92e84c18dccc6dc7c8fe11c78549cdc2f1'
            '1d713370fe5a8788aa1723ca291ae2f96635b92bc3cb80aea85d21847c59ed6d'
            'SKIP'
            'SKIP'
            'SKIP')

validpgpkeys=('034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3') # maltej(?)

# change this to false if you do not want to run a PGO build for aarch64 or x86_64
_build_profiled_aarch64=true
_build_profiled_x86_64=true

prepare() {
  mkdir -p mozbuild
  cd librewolf-$pkgver-$pkgrel

  mv mozconfig ../mozconfig

  cat >>../mozconfig <<END

# TODO: check things here one after another if (still) required
ac_add_options --enable-linker=lld

ac_add_options --prefix=/usr

ac_add_options --disable-bootstrap

export CC='clang'
export CXX='clang++'

# Branding
ac_add_options --with-app-name=${_pkgname}
# is this one required? upstream lw doesn't use it
ac_add_options --enable-update-channel=release
# unlear?
# ac_add_options --with-app-basename=${_pkgname}

# needed? yep.
export MOZ_APP_REMOTINGNAME=${_pkgname}

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
# keep alsa option in here until merged upstream
ac_add_options --enable-alsa
ac_add_options --enable-jack

# options for ci / weaker build systems
# mk_add_options MOZ_MAKE_FLAGS="-j4"
# ac_add_options --enable-linker=gold

# wasi
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
END

if [[ $CARCH == 'aarch64' ]]; then
  cat >>../mozconfig <<END
# taken from manjaro build:
ac_add_options --enable-optimize="-g0 -O2"
END

  export MOZ_DEBUG_FLAGS=" "
  export CFLAGS+=" -g0"
  export CXXFLAGS+=" -g0"
  export RUSTFLAGS="-Cdebuginfo=0"

  # we should have more than enough RAM on the CI spot instances.
  # ...or maybe not?
  export LDFLAGS+=" -Wl,--no-keep-memory"
else

  cat >>../mozconfig <<END
# Arch upstream has it in their PKGBUILD, ALARM does not for aarch64:
ac_add_options --disable-elf-hack

# might help with failing x86_64 builds?
export LDFLAGS+=" -Wl,--no-keep-memory"
END
fi

  # upstream Arch fixes

  # pgo improvements
  # TODO: test if still required
  # patch -Np1 -i ../0018-bmo-1516081-Disable-watchdog-during-PGO-builds.patch

  # KDE menu and unity menubar
  patch -Np1 -i ../firefox-kde.patch
  patch -Np1 -i ../mozilla-kde.patch
  patch -Np1 -i ../unity-menubar.patch
}


build() {
  cd librewolf-$pkgver-$pkgrel

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  # export PIP_NETWORK_INSTALL_RESTRICTED_VIRTUALENVS=mach # let us hope this is a working _new_ workaround for the pip env issues?

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."

  if [[ $CARCH == 'aarch64' && $_build_profiled_aarch64 == true ]]; then

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
END

  elif [[ $CARCH == 'x86_64' && $_build_profiled_x86_64 == true ]]; then

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END

  fi

  if [[ $CARCH == 'aarch64' && $_build_profiled_aarch64 == true || $CARCH == 'x86_64' && $_build_profiled_x86_64 == true ]]; then

    ./mach build

    echo "Profiling instrumented browser..."

    ./mach package

    export DISPLAY=:99

    LLVM_PROFDATA=llvm-profdata \
      JARLOG_FILE="$PWD/jarlog" \
      LIBGL_ALWAYS_SOFTWARE=true \
      xvfb-run -a -s "-screen 0 1920x1080x24" \
      ./mach python build/pgo/profileserver.py

    stat -c "Profile data found (%s bytes)" merged.profdata
    test -s merged.profdata

    stat -c "Jar log found (%s bytes)" jarlog
    test -s jarlog

    echo "Removing instrumented browser..."
    ./mach clobber

    echo "Building optimized browser..."

    if [[ $CARCH == 'aarch64' ]]; then

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
ac_add_options --enable-profile-use
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

    else

      cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

    fi
  fi

  if [[ $CARCH == 'aarch64' && $_build_profiled_aarch64 == false || $CARCH == 'x86_64' && $_build_profiled_x86_64 == false ]]; then
    cat >.mozconfig ../mozconfig
  fi

  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package() {
  cd librewolf-$pkgver-$pkgrel
  DESTDIR="$pkgdir" ./mach install

  # mv ${pkgdir}/usr/local/lib ${pkgdir}/usr/lib/
  # mv ${pkgdir}/usr/local/bin ${pkgdir}/usr/bin/
  # rm -r ${pkgdir}/usr/local

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in librewolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=io.gitlab.${_pkgname}-community
version=1.0
about=LibreWolf

[Preferences]
app.distributor="LibreWolf Community"
app.distributor.channel=$_pkgname
app.partner.librewolf=$_pkgname
END

  for i in 16 32 48 64 128; do
    install -Dvm644 browser/branding/${_pkgname}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  # install -Dvm644 browser/branding/librewolf/content/about-logo.png \
    # "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 browser/branding/${_pkgname}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.png"

  install -Dvm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/librewolf-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}
