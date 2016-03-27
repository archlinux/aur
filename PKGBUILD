# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: argymeg <argymeg at gmail dot com>

pkgname=firefox-wayland
pkgver=45.0rc2
_realpkgver=45.0
_rcbuild=2
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta (build from source) with Wayland patches"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('gtk2' 'gtk3' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'ffmpeg2.8' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'rust')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
provides=("firefox=$pkgver")
conflicts=("firefox-wayland-bin")            
install=firefox-wayland.install
options=('!emptydirs' '!makeflags')
source=('git+https://github.com/stransky/gecko-dev.git'
        mozconfig
        firefox-wayland.desktop
        firefox-install-dir.patch
        vendor.js
        firefox-fixed-loading-icon.png)
sha512sums=('SKIP'
            'c72792b505031431282a3777bce6d3ee98fe68cc0faf8cadd84afe2b42921da52b9d8ad94e3324f0d0a09e8e298e3bcd2b527b08e92e2a0140434d7767efc422'
            'dd9a563d6ad772ba440a45bbd0ee27943b319edcb785951e62cd4aefe0d33ded2acf9b63a2b15cec89ee184687c68a8d3a1cc06ec98f9a9251602f063fbaef14'
            '266989b0c4a37254a40836a6193284a186230b48716907e4d249d73616f58382b258c41baa8c1ffc98d405f77bfafcd3438f749edcf391c7bd22185399adf4bd'
            'd927e5e882115c780aa0d45034cb1652eaa191d95c15013639f9172ae734245caae070018465d73fdf86a01601d08c9e65f28468621422d799fe8451e6175cb7'
            'd51119170cc8fb99c50610a8e5e94f38a31722c1c1a2260ca32d8e376732e30c8e1deac7d8c599348892e783fb4c75ce8c38bbd238282b0c9da21608d902ba28')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff


prepare() {
  cd gecko-dev

  cp ../mozconfig .mozconfig
  patch -Np1 -i ../firefox-install-dir.patch
  
  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-oauth-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  mkdir "$srcdir/path"

  # WebRTC build tries to execute "python" and expects Python 2
  ln -s /usr/bin/python2 "$srcdir/path/python"

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  # sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # Fix tab loading icon (doesn't work with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  cp "$srcdir/firefox-fixed-loading-icon.png" \
    browser/themes/linux/tabbrowser/loading.png
}

build() {
  cd gecko-dev

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  # Do PGO
  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
    make -f client.mk build MOZ_PGO=1
}

package() {
  cd gecko-dev
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install
  mkdir "$pkgdir"/opt/firefox-wayland
  mv "$pkgdir"/opt/firefox/* "$pkgdir"/opt/firefox-wayland/
  rm -r "$pkgdir"/opt/firefox

  install -Dm644 ../vendor.js "$pkgdir/opt/firefox-wayland/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox-wayland.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox-wayland.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox-wayland.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox-wayland.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox-wayland.png"

  install -Dm644 ../firefox-wayland.desktop \
    "$pkgdir/usr/share/applications/firefox-wayland.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/opt/firefox-wayland/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/opt/firefox-wayland/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/opt/firefox-wayland/hyphenation"

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf /opt/firefox-wayland/firefox "$pkgdir/opt/firefox-wayland/firefox-wayland-bin"

  # /usr/bin symlinks
  rm -f "$pkgdir"/usr/bin/firefox
  ln -s /opt/firefox-wayland/firefox "$pkgdir"/usr/bin/firefox-wayland
  ln -s /opt/firefox-wayland/firefox "$pkgdir"/usr/bin/firefox-wayland-bin
}
