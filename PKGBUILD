# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

# NOTE: Enable PGO on x86_64?: http://en.wikipedia.org/wiki/Profile-guided_optimization
_pgo=0  # "1" to enable

pkgname=thunderbird-beta
pkgver=38.1.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge version with optional PGO"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk-update-icon-cache' 'gtk2'
         'hicolor-icon-theme' 'hunspell' 'libjpeg' 'libnotify' 'libpng' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nspr' 'nss' 'pixman' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
makedepends=('autoconf2.13' 'mesa' 'python2' 'unzip' 'wireless_tools' 'yasm' 'zip')
[[ $_pgo = 1 ]] && makedepends+=('imake' 'xorg-server-xvfb')
provides=("thunderbird=$pkgver")
install=$pkgname.install
options=('!emptydirs' '!makeflags')
source=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.bz2"
        'mozconfig'
        'mozconfig-pgo'
        "$pkgname.desktop"
        "$pkgname-safe.desktop"
        'vendor.js')
md5sums=('dd161196c6bd444643d2de54d1222d31'
         '0c5dbb39b27bb72f837921b88a9e48c8'
         '7b0cf4656fa25e75187aac4a44376ab9'
         'fe18423c55d549722870573695b3bd60'
         '7f826c0d64cb62f9fed7e16221cb2f00'
         '5a53179d14ae9631b7afe5e4d0fc0b25')
# RC
if [[ $_build = ? ]]; then
  source[0]="https://ftp.mozilla.org/pub/mozilla.org/thunderbird/candidates/$_major-candidates/build$_build/source/thunderbird-$_major.source.tar.bz2"
fi

prepare() {
  cd comm-*

  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  # PGO?
  if [[ $CARCH = x86_64 ]] && [[ $_pgo = 1 ]]; then
    cp "$srcdir"/mozconfig-pgo .mozconfig
  else
    cp "$srcdir"/mozconfig .mozconfig
  fi

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure
}

build() {
  cd comm-*

  # Build flags
  export LDFLAGS="$LDFLAGS -Wl,-rpath,/opt/$pkgname-$pkgver"
  export PYTHON="/usr/bin/python2"

  if [[ $CARCH = x86_64 ]] && [[ $_pgo = 1 ]]; then
    # Set up PGO
    msg2 "Running Xvfb.."
    export DISPLAY=:99
    Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 $DISPLAY &

    # Build
    msg2 "Running make.."
    if ! make -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS" MOZ_PGO=1; then
      kill $!
      return 1
    fi

    # Kill leftovers
    kill $! || true
  else
    msg2 "Running make.."
    make -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
  fi
}

package() {
  cd comm-*/obj-*

  # Put together
  msg2 "Running make install.."
  make package

  # Install
  msg2 "Moving stuff in place..."
  cd dist
  tar -xf thunderbird-*.tar.bz2
  cp -r thunderbird/ "$pkgdir"/opt/$pkgname-$pkgver
  
  # /usr/bin symlink
  ln -sf /opt/$pkgname-$pkgver/thunderbird "$pkgdir"/usr/bin/$pkgname

  # vendor.js
  install -Dm644 "$srcdir"/vendor.js "$pkgdir"/opt/$pkgname-$pkgver/defaults/preferences/vendor.js

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -Dm644 "$srcdir"/comm-*/other-licenses/branding/thunderbird/mailicon${i/x*}.png \
                   "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done

  # Desktop
  install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

  # Dictionaries/hyphenation
  rm -rf "$pkgdir"/opt/$pkgname-$pkgver/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir"/opt/$pkgname-$pkgver/dictionaries
  ln -sf /usr/share/hyphen "$pkgdir"/opt/$pkgname-$pkgver/hyphenation
}
