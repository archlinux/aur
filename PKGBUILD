##################################################################################################
# This package will be discontinued by the maintainer after Firefox 52 ESR's EOL.                #
# If you wish to continue maintainence of this package, please contact the maintainer.           #
# This release also marks the switchup to the ESR release branch.                                #
#                                                                                                #
# Any questions or feedback can be directed to the comments section of this package on the AUR.  #
#                                                                                                #
##################################################################################################


# Maintainer: Xavier <sapphirus@azorium.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# Contributor: Xavier <sapphirus@azorium.net>
# Upstream URL: https://www.mozilla.org/firefox/

pkgname=firefox-unbranded
_pkgname=firefox
pkgver=52.0.1
_suffix=esr
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Unbranded version"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
provides=('firefox=52')
conflicts=('firefox')
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'ffmpeg' 'libvpx' 'libevent' 'nss' 'hunspell'
         'sqlite' 'ttf-font' 'icu')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'libpulse' 'inetutils' 'xorg-server-xvfb' 'autoconf2.13' 'cargo')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
options=('!emptydirs' '!makeflags')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver$_suffix/source/firefox-$pkgver$_suffix.source.tar.xz
        mozconfig
        firefox.desktop
        firefox-install-dir.patch
        vendor.js)
sha256sums=('b0298f01a8afdc769ba2a5d285e44bbb843306d07bac5a53bfcb9fa85032327f'
	    '84efbf7d1495fd0c89f684d618abfe1eb190ee336c13aee51e9ab706c910127f'
            '9f39e9d891a48b49490df0823d67f01d8cf0b3e8c5910190739e94190f768e76'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '9015feb60a23af7a3ac06620dd5fa0fbc5d1f1eec6ed65c0e530a63b07f7a992')

prepare() {
  cd $_pkgname-$pkgver$_suffix
  echo ""
  echo "##################################################################################################"
  echo "# This package will be discontinued by the maintainer after Firefox 52 ESR's EOL.                #"
  echo "# If you wish to continue maintainence of this package, please contact the maintainer.           #"
  echo "# This release also marks the switchup to the ESR release branch.                                #"
  echo "#                                                                                                #"
  echo "# Any questions or feedback can be directed to the comments section of this package on the AUR.  #"
  echo "#                                                                                                #"
  echo "##################################################################################################"
  echo ""
  cp ../mozconfig .mozconfig
  patch -Np1 -i ../firefox-install-dir.patch

  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"
}

build() {
  cd $_pkgname-$pkgver$_suffix

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
  #  make -f client.mk build MOZ_PGO=1
  make -f client.mk build
}

package() {
  cd $_pkgname-$pkgver$_suffix
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
 
  install -Dm644 ../firefox.desktop \
    "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"
 
   # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
