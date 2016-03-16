# Maintainer: superlex

# Based on Parabola GNU/Linux-libre iceweasel-libre PKGBUILD :

# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor (ConnochaetOS): Henry Jensen <hjensen@connochaetos.org>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Contributor: vando <facundo@esdebian.org>
# Contributor (Arch): Jakub Schmidtke <sjakub@gmail.com>
# Contributor: Figue <ffigue at gmail>
# Contributor: taro-k <taro-k@movasense_com>
# Contributor: Michał Masłowski <mtjm@mtjm.eu>
# Thank you very much to the older contributors:
# Contributor: evr <evanroman at gmail>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>

# Firefox PKGBUILD (Arch Linux) :

# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_pgo=false

# We're getting this from Debian Sid
_debname=firefox
_debver=45.0
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/f
_parabolarepo=https://repo.parabola.nu/other/iceweasel
_brandingrel=1

pkgname=iceweasel
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Debian Browser based on Mozilla Firefox, with Parabola GNU/Linux-libre branding"
arch=('i686' 'x86_64')
license=('GPL' 'MPL' 'LGPL')
depends=(alsa-lib dbus-glib desktop-file-utils ffmpeg gtk2 gtk3 hicolor-icon-theme hunspell icu libevent libvpx libxt mime-types mozilla-common nss sqlite startup-notification ttf-font)
makedepends=(autoconf2.13 diffutils gconf imake inetutils libidl2 libpulse librsvg libxslt mesa pkg-config python2 quilt unzip yasm zip nss imagemagick)
options=(!emptydirs !makeflags debug)
if $_pgo; then
  makedepends+=(xorg-server-xvfb)
  options+=(!ccache)
fi
optdepends=('networkmanager: Location detection via available WiFi networks'
			'upower: Battery API'
			'ffmpeg: H264/AAC/MP3 decoding'
            'iceweasel-extension-archsearch: Iceweasel Arch search engines')
url="https://packages.debian.org/source/sid/iceweasel"
install=iceweasel.install
provides=("$_debname"="$_debver")
source=("${_debrepo}/${_debname}/${_debname}_${_debver}.orig.tar.xz"
		"${_debrepo}/${_debname}/${_debname}_${_debver}-${_debrel}.debian.tar.xz"
		"$_parabolarepo/${pkgname}_$_debver-$_brandingrel.branding.tar.xz"
        mozconfig
        iceweasel.desktop
        iceweasel-install-dir.patch
        vendor.js
		iceweasel-fixed-loading-icon.png)
md5sums=('f5e07751e3df66044a1dc9b3c6e21b6b'
         'f94e8c63d20f08830a550a67931859cd'
         'aa8cee1d3731faf031a522dec8e1471d'
         '9f8cd36718fa474ce593c90979d14b38'
         '7b9e5996dd9fe0b186a43a297db1c6b5'
         '1c42509891cf6843660a5f3c69896e80'
         '35adf69c840aadeb138d1b0be3af63b5'
         '6e335a517c68488941340ee1c23f97b0')

prepare() {
  cd "$srcdir/$_debname-$_debver"
  mv "$srcdir/debian" .
  mv "$srcdir/$pkgname-$_debver/branding" debian
  mv "$srcdir/$pkgname-$_debver/patches/iceweasel-branding" debian/patches
  cat "$srcdir/$pkgname-$_debver/patches/series" >> debian/patches/series
  
  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'
  
  # We wont save user profile in .mozilla/iceweasel
  sed -i 's/MOZ_APP_PROFILE=mozilla\/firefox/MOZ_APP_PROFILE=mozilla\/iceweasel/g' "debian/branding/configure.sh"

  quilt push -av

  # Install to /usr/lib/$pkgname
  patch -Np1 -i "$srcdir/iceweasel-install-dir.patch"

  # Load our build config
  cp "$srcdir/mozconfig" .mozconfig
  
  # Building optimization suggestions by Cyberpunk
  #echo 'ac_add_options --enable-optimize' >> .mozconfig
  #echo 'mk_add_options MOZ_MAKE_FLAGS="-j2"' >> .mozconfig

  mkdir "$srcdir/python2-path"

  # WebRTC build tries to execute "python" and expects Python 2
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # Fix tab loading icon (flickers with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  cp "$srcdir/iceweasel-fixed-loading-icon.png" browser/themes/linux/tabbrowser/loading.png

}

build() {
  cd "$srcdir/$_debname-$_debver"

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  if $_pgo; then
    # Do PGO
    xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
      make -f client.mk build MOZ_PGO=1
  else
    make -f client.mk build
  fi
}

package() {
  cd "$srcdir/$_debname-$_debver"
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

  _brandingdir=debian/branding
  brandingdir=moz-objdir/$_brandingdir
  icondir="$pkgdir/usr/share/icons/hicolor"
  for i in 16 22 24 32 48 64 128 192 256 384; do
    rsvg-convert -w $i -h $i "$_brandingdir/${pkgname}_icon.svg" -o "$brandingdir/default$i.png"
    install -Dm644 "$brandingdir/default$i.png" "$icondir/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 "$_brandingdir/${pkgname}_icon.svg" "$icondir/scalable/apps/$pkgname.svg"
 
  install -d "$pkgdir/usr/share/applications"
  install -m644  "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications"
  
  
  # Use system-provided dictionaries
  rm -rf "$pkgdir/usr/lib/$pkgname/"{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell            "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -sf /usr/share/hyphen              "$pkgdir/usr/lib/$pkgname/hyphenation"
    
  
  # We don't want the development stuff
  rm -rf "$pkgdir"/usr/{include,lib/$pkgname-devel,share/idl}

  # Workaround for now: https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf $pkgname "$pkgdir/usr/lib/$pkgname/$pkgname-bin"
  
    
  # Searchplugins section
  
  # According to debian choices, we prefer to use /etc/icewasel/searchplugins
  install -d "$pkgdir/etc/${pkgname}/searchplugins/common"
  
  # Add common web searchplugins
  install -Dm644 "$srcdir/$_debname-$_debver/debian/debsearch.xml" "$pkgdir/etc/${pkgname}/searchplugins/common/debsearch.xml" 
}

