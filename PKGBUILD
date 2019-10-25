# Maintainer: Figue <ffigue at gmail>
# Contributor: Figue <ffigue at gmail>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Thank you very much to the older contributors:
# Contributor: evr <evanroman at gmail>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com> 

pkgname=icecat
pkgver=68.2.0
a_pkgver=( ${pkgver//./ } )
_pkgver=6634ee332979f7a78b11cbf09a77364143a981ed
pkgrel=1
pkgdesc="GNU version of the Firefox browser."
arch=(x86_64)
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL' 'MPL' 'LGPL')
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm wget mercurial perl-rename)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags !strip)

source=(http://git.savannah.gnu.org/cgit/gnuzilla.git/snapshot/gnuzilla-${_pkgver}.tar.gz
        icecat.desktop icecat-safe.desktop patch_makeicecat_stuff.patch
        "0001-Use-remoting-name-for-GDK-application-names.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Use-remoting-name-for-GDK-application-names.patch?h=packages/firefox&id=3dac00b6aefd97b66f13af0ad8761a3765094368"
        settings.js)

sha256sums=('2655c3a8f656435e636fcc7774f3fa6e62bf1f98056a64b8b84fbec9a03f7b0c'
            'e00dbf01803cdd36fd9e1c0c018c19bb6f97e43016ea87062e6134bdc172bc7d'
            '33dd309eeb99ec730c97ba844bf6ce6c7840f7d27da19c82389cdefee8c20208'
            '228b553953df859aa03164352622c4f9d6514cff1e30756181a4cbe60d9324e5'
            'ab07ab26617ff76fce68e07c66b8aa9b96c2d3e5b5517e51a3c3eac2edd88894'
            'f56b75584f1baac86948cdebef71b767e37eee0e1c3677380ff9b2285514efea')

#validpgpkeys=(A57369A8BABC2542B5A0368C3C76EED7D7E04784) # Ruben Rodriguez (GNU IceCat releases key) <ruben@gnu.org>

prepare() {
  cd gnuzilla-${_pkgver}
  patch -Np1 -i ../patch_makeicecat_stuff.patch
  cp -vf ../settings.js data/
  sed -e "s/^FFMAJOR.*/FFMAJOR=${a_pkgver[0]}/g" -i makeicecat
  sed -e "s/^FFMINOR.*/FFMINOR=${a_pkgver[1]}/g" -i makeicecat
  sed -e "s/^FFSUB.*/FFSUB=${a_pkgver[2]}/g" -i makeicecat
#  sed -e "s/^FFSUB.*/FFSUB=/g" -i makeicecat
  sed -e "s/^GNUVERSION=.*/GNUVERSION=${pkgrel}/g" -i makeicecat
  sed -e 's/^FFVERSION.*/FFVERSION=$FFMAJOR.$FFMINOR.$FFSUB/g' -i makeicecat   # Only need this patch if release has 2 numbers
#  sed -e 's/^gpg2 --keyserver.*//g' -i makeicecat  ## WITH PROXY gpg doesn't work!!!!!!
  rm -rf output  # Clean output just in case is already an old build there
  bash makeicecat
  cd output/icecat-${pkgver}

  # Fix brand name variables
  echo -e "-brand-shorter-name = IceCat\n-brand-full-name = GNU IceCat\n-brand-product-name = IceCat\n-vendor-short-name = GNU" >> browser/branding/official/locales/en-US/brand.ftl

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i ../../../0001-Use-remoting-name-for-GDK-application-names.patch

  # Remove extra tag
  mv -f browser/base/content/aboutDialog.xul browser/base/content/aboutDialog.xul_bad
  cat browser/base/content/aboutDialog.xul_bad | uniq > browser/base/content/aboutDialog.xul
  rm -f browser/base/content/aboutDialog.xul_bad

  # Patch to move files directly to /usr/lib/icecat. No more symlinks.
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME);g' -i config/baseconfig.mk
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME)-devel;g' -i config/baseconfig.mk

  # Update all IceCat extensions
  #git clone https://gitlab.com/sebaro/ViewTube.git data/extensions/viewtube@extension/
  #cd data/extensions/https-everywhere@eff.org
  #rm -rf * && wget -O - 'https://www.eff.org/files/https-everywhere-latest.xpi' | bsdtar -xvf-
  #cd ../../..

  printf '%b' "  \e[1;36m->\e[0m\033[1m Starting build...\n"
  
  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-lto
# Branding
ac_add_options --enable-official-branding
ac_add_options --with-distribution-id=org.gnu
ac_add_options --with-unsigned-addon-scopes=app,system

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-debug-symbols
ac_add_options --disable-tests
ac_add_options --disable-eme
ac_add_options --disable-gconf

ac_add_options --with-app-basename=icecat
ac_add_options --with-app-name=icecat
END
}

build() {
  cd gnuzilla-${_pkgver}/output/icecat-${pkgver}

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm
  export RANLIB=llvm-ranlib

  # LTO needs more open files
  ulimit -n 4096

  xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
  ./mach buildsymbols
}

package () {
  cd gnuzilla-${_pkgver}/output/icecat-${pkgver}
  DESTDIR="$pkgdir" ./mach install

  _vendorjs="$pkgdir/usr/lib/${pkgname}/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Opt all of us into e10s, instead of just 50%
pref("browser.tabs.remote.autostart", true);
END

  printf '%b' "  \e[1;36m->\e[0m\033[1m Finishing...\n"
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/pixmaps

  for i in 16 32 48; do
      install -Dm644 browser/branding/official/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/icecat.png"
  done
  install -Dm644 browser/branding/official/default48.png ${pkgdir}/usr/share/pixmaps/icecat.png
  install -Dm644 ${srcdir}/icecat.desktop ${pkgdir}/usr/share/applications/
  install -Dm644 ${srcdir}/icecat-safe.desktop ${pkgdir}/usr/share/applications/
}
