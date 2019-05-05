##################################################################################################
# This package has been revived, for the time being..                                            #
#                                                                                                #
# This release is brought to you by: https://i.redd.it/gpsxmphnp3w21.jpg                         #
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
pkgver_major=66
pkgver_minor=0.3
pkgver=$pkgver_major.$pkgver_minor
_suffix=
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Unbranded version"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
provides=('firefox')
conflicts=('firefox')
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust mercurial clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=('!emptydirs' '!makeflags')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver$_suffix/source/firefox-$pkgver$_suffix.source.tar.xz
        mozconfig
        firefox.desktop
        vendor.js)
sha256sums=('1fe4cfe4f4afce8d5532da8f36a48c333750c90a6ee67167309357edf514c22a'
	    '5fa429a6592f20cfbf9286018d527bce138a7181994708c6d2d54169475b3bdb'
            '9f39e9d891a48b49490df0823d67f01d8cf0b3e8c5910190739e94190f768e76'
            '9015feb60a23af7a3ac06620dd5fa0fbc5d1f1eec6ed65c0e530a63b07f7a992')

prepare() {
  cd $_pkgname-$pkgver$_suffix
  echo ""
  echo "##################################################################################################"
  echo "# This package has been revived, for the time being.                                             #"
  echo "#                                                                                                #"
  echo "# This release is brought to you by: https://i.redd.it/gpsxmphnp3w21.jpg                         #"
  echo "#                                                                                                #"
  echo "# Any questions or feedback can be directed to the comments section of this package on the AUR.  #"
  echo "#                                                                                                #"
  echo "##################################################################################################"
  echo ""
  cp ../mozconfig .mozconfig
  curl -o 0001-bz-1468911.patch https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-bz-1468911.patch?h=packages/firefox
  patch -Np1 -i 0001-bz-1468911.patch
  rm -vf third_party/rust/boxfnonce/.travis/id_rsa.enc
  mkdir "$srcdir/path"
}

build() {
  cd $_pkgname-$pkgver$_suffix

  export MOZ_NOSPAM=1
  ulimit -n 4096

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  ./mach build
  ./mach buildsymbols
}

package() {
  cd $_pkgname-$pkgver$_suffix
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +  

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
 
  install -Dm644 ../firefox.desktop \
    "$pkgdir/usr/share/applications/firefox.desktop"
  
  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
