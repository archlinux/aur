# $Id$
# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Contributor: Alex Talker
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-developer-hg
pkgver=247837.446133410f9b
pkgrel=1
pkgdesc="Lastest developer edition of firefox browser built from the trunk code"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
conflicts=('firefox')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake'
             'xorg-server-xvfb' 'libpulse' 'gst-plugins-base-libs'
             'inetutils' 'mercurial')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video')
install=firefox.install
#options=('!emptydirs' '!makeflags')
ccache=false
if $ccache; then
    options=('ccache')
fi
source=('hg+https://hg.mozilla.org/releases/mozilla-aurora/'
        'mozconfig'
        'firefox.desktop'
        'firefox-install-dir.patch'
        'rhbz-966424.patch')
sha256sums=('SKIP'
        '2120f3420990cf718d69ab757d7a5eea5992fa6dbd870c1d8f81033d7d673f5f'
        'd2a7610393ba259c35e3227b92e02ec91095a95189f56ac93ccdf6732772719c'
        'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
        '4f0046b39a8d98f6e4fc3360ec490cb2416e38c7b3e92699f7e511c206c2c961')
_pgo=1 # set to 0 to disable

pkgver() {
  cd mozilla-aurora
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd mozilla-aurora

  cp ../mozconfig .mozconfig
  patch -Np1 -i ../firefox-install-dir.patch

  # https://bugs.archlinux.org/task/41689
  patch -Np2 -i ../rhbz-966424.patch

#  [[ -d "$srcdir/path" ]] || mkdir "$srcdir/path"

  # WebRTC build tries to execute "python" and expects Python 2
#  [[ -L "$srcdir/path/python" ]] || ln -s /usr/bin/python2 "$srcdir/path/python"

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
#  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure


}

build() {
  cd mozilla-aurora

  export PATH="$srcdir/path:$PATH"
  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/firefox"
  export PYTHON="/usr/bin/python2"
  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  unset CPPFLAGS

# PGO will result in double compilation
# http://en.wikipedia.org/wiki/Profile-guided_optimization
# https://developer.mozilla.org/en/docs/Building_with_Profile-Guided_Optimization
  # Do PGO
#  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
#    make -f client.mk build MOZ_PGO=1
#  make -f client.mk build
  if [[ $CARCH = x86_64 ]] && [[ $_pgo = 1 ]]; then
    msg2 'PGO build is selected'
    xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
    make -f client.mk profiledbuild
  else
    msg2 'Non-PGO build is selected or your architecture is not x86_64'
    make -f client.mk build
  fi

}

package() {
  cd mozilla-aurora
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

#  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 32 48; do
      install -Dm644 browser/branding/unofficial/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dm644 browser/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 ../firefox.desktop \
    "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
