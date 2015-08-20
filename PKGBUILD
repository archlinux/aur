# Maintainer : André Silva <emulatorman@parabola.nu>
# Contributor : Márcio Silva <coadde@parabola.nu>

# For AUR package
# Maintainer : taro-k

# We're getting this from Debian Sid
_debname=icedove
_debver=38.1.0
_debrel=deb1
_debrepo=http://ftp.debian.org/debian/pool/main/
debfile() { echo $@|sed -r 's@(.).*@\1/&/&@'; }

pkgname=${_debname}
epoch=1
pkgver=${_debver}.${_debrel}
pkgrel=2
pkgdesc="A libre version of Debian Icedove, the standalone mail/news reader based on Mozilla Thunderbird. This is ported from Parabola GNU/Linux."
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://packages.debian.org/sid/${pkgname}"
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'mozilla-searchplugins')
makedepends=('unzip' 'zip' 'python2' 'wireless_tools' 'yasm' 'mesa' 'libpulse'
             'pkg-config' 'autoconf2.13' 'quilt' 'jquery-ui')
optdepends=('libcanberra: for sound support')
replaces=('thunderbird' "${pkgname}-libre")
conflicts=('thunderbird' "${pkgname}-libre")
provides=('thunderbird')
install=${pkgname}.install
source=("${_debrepo}/`debfile ${_debname}`_${_debver}.orig.tar.xz"
        "${_debrepo}/`debfile ${_debname}`_${_debver}-${_debrel#deb}.debian.tar.xz"
        mozconfig
        ${pkgname}.desktop
        changing-the-default-search-engine.patch
        vendor.js)
options=(!emptydirs !makeflags)
sha256sums=('b59c74f67d2f9684d9cf0db62b5c60d3ef155807e17a91ebf0899dd55670f6a0'
            '29de44253624814ae3ce3e0a6a786ba229c62e78d8c97e36257f730d38d542f7'
            'e3d0f5f78fede687dfc38a2787c2c8f33c8213be286abeb9176e3dcebabb0b74'
            '0b0d25067c64c6b829c84e5259ffca978e3971f85acc8483f47bdbed5b0b5b6a'
            '9765d9bbcae82d0006766741c813840db46c56ee16f79d39b8d7d96d716ee2d7'
            '798d5bff1e6025e9a803b67f629afac740f16e537b714ee7c7e829b2345fb6a2')

prepare() {
  export DEBIAN_BUILD=comm-esr${pkgver%%.*}

  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  mv debian ${srcdir}/${DEBIAN_BUILD}
  cd ${srcdir}/${DEBIAN_BUILD}

  # Prepare branding for the Icedove packages
  mkdir -v mail/branding/${pkgname}

  # Copy needed icons
  cp -va debian/${pkgname}-branding/* mail/branding/${pkgname}
  for i in 16 22 24 32 48 256; do
    install -vDm 644 debian/app-icons/${pkgname}${i}.png mail/branding/${pkgname}/mailicon${i}.png
  done
  for i in 48 64; do
    install -vDm 644 debian/app-icons/${pkgname}${i}.png mail/branding/${pkgname}/content/icon${i}.png
  done
  cp -va debian/preview.png mail/themes/linux/mail/preview.png

  # Useless since we are doing it ourselves
  rm -v debian/patches/debian-hacks/changing-the-default-search-engine.patch || true

  quilt push -av

  # Remove url-classifier from package-manifest.in to build and disable Phishing Protection
  sed -i '\|Phishing Protection|d
          \|UrlClassifier|d
          \|URLClassifier|d
          \|url-classifier|d
         ' mail/installer/package-manifest.in

  # Fix branding
  sed -i 's|Icedove Mail/News|Icedove|' mail/branding/icedove/locales/en-US/brand.{dtd,properties}

  # Replace common URLs
  sed -i '\|extensions[.]getAddons[.]get[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]browseURL| s|https://addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]webservice[.]discoverURL| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
         ' mail/app/profile/all-thunderbird.js

  cp -v ${srcdir}/mozconfig .mozconfig

  # Configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure

  # Change the default search engine using our system-provided searchplugins
  patch -Np1 -i ${srcdir}/changing-the-default-search-engine.patch

  # Add symlinks to use jquery files built by us
  ln -vs /usr/share/javascript/jquery/jquery.min.js mail/jquery
  ln -vs /usr/share/javascript/jquery-ui/jquery-ui.min.js mail/jquery
}

build() {
  export DEBIAN_BUILD=comm-esr${pkgver%%.*}

  cd ${srcdir}/${DEBIAN_BUILD}

  export PYTHON=/usr/bin/python2

  make -f client.mk build
}

package() {
  export DEBIAN_BUILD=comm-esr${pkgver%%.*}

  cd ${srcdir}/${DEBIAN_BUILD}

  make -f client.mk DESTDIR=${pkgdir} install

  install -vDm 644 ${srcdir}/vendor.js ${pkgdir}/usr/lib/${pkgname}/defaults/preferences/vendor.js

  # Install Icedove menu icon
  install -vDm 644 debian/${pkgname}.xpm ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm

  # Install Icedove icons
  for i in 16 22 24 32 48 64 128 256; do
    install -vDm 644 debian/app-icons/${pkgname}${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png
  done
  install -vDm 644 debian/app-icons/${pkgname}big.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg

  # Install Icedove desktop
  install -vDm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Use system-provided dictionaries
  rm -vrf ${pkgdir}/usr/lib/${pkgname}/{dictionaries,hyphenation,searchplugins}
  ln -vsf /usr/share/hunspell ${pkgdir}/usr/lib/${pkgname}/dictionaries
  ln -vsf /usr/share/hyphen ${pkgdir}/usr/lib/${pkgname}/hyphenation

  # Use system-provided searchplugins
  ln -vsf /usr/lib/mozilla/searchplugins ${pkgdir}/usr/lib/${pkgname}/searchplugins

  # Remove development stuff
  rm -vr ${pkgdir}/usr/{include,lib/${pkgname}-devel,share/idl}
}
