# Maintainer : André Silva <emulatorman@parabola.nu>
# Contributor : Márcio Silva <coadde@parabola.nu>

# For AUR package
# Maintainer : taro-k

# We're getting this from Debian Sid
_debname=icedove
_debver=31.7.0
_debrel=deb1
_debrepo=http://ftp.debian.org/debian/pool/main/
debfile() { echo $@|sed -r 's@(.).*@\1/&/&@'; }

pkgname=${_debname}
epoch=1
pkgver=${_debver}.${_debrel}
pkgrel=1
pkgdesc="A libre version of Debian Icedove, the standalone mail/news reader based on Mozilla Thunderbird. This is ported from Parabola GNU/Linux."
arch=('i686' 'x86_64' 'mips64el')
license=('MPL' 'GPL' 'LGPL')
url="http://packages.debian.org/sid/${pkgname}"
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libvpx=1.4.0' 'libxt' 'mime-types' 'mozilla-common' 'mozilla-searchplugins' 'nss' 'sqlite' 'startup-notification')
makedepends=('unzip' 'zip' 'pkg-config' 'python2' 'wireless_tools' 'yasm' 'mesa' 'libpulse' 'autoconf2.13' 'quilt' 'jquery-ui')
optdepends=('libcanberra: for sound support')
replaces=('thunderbird' "${pkgname}-libre")
conflicts=('thunderbird' "${pkgname}-libre")
provides=('thunderbird')
install=${pkgname}.install
source=("${_debrepo}/`debfile ${_debname}`_${_debver}.orig.tar.xz"
        "${_debrepo}/`debfile ${_debname}`_${_debver}-${_debrel#deb}.debian.tar.xz"
        mozconfig
        ${pkgname}.desktop
        ${pkgname}-install-dir.patch
        vendor.js)
options=(!emptydirs)
sha256sums=('00ce17575690400e22e7ce21dc5b3b4f71092b7708ee9aad74448d1401da8794'
            '04c30b4e72819b764bc463d36c39f55741d3e47ae994ba89fd14e63fe32c6561'
            '09a0041f7f12498d933284b3d3a44e19002515accaff767d145a8f404b79e86a'
            '0b0d25067c64c6b829c84e5259ffca978e3971f85acc8483f47bdbed5b0b5b6a'
            '24599eab8862476744fe1619a9a53a5b8cdcab30b3fc5767512f31d3529bd05d'
            'b44f0eb82dce8a02aa71f0eab4b0d820e5383f613becc62cc995aac8638b54ec')

prepare() {
  export DEBIAN_BUILD="comm-esr31"

  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  mv debian "${srcdir}/${DEBIAN_BUILD}"
  cd "${srcdir}/${DEBIAN_BUILD}"

  mv debian/${pkgname}-branding "${srcdir}/${DEBIAN_BUILD}/mail/branding/${pkgname}"

  cp -a debian/app-icons/${pkgname}big.svg debian/app-icons/${pkgname}_icon.svg
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 "debian/app-icons/${pkgname}${i/x*/}.png" "${srcdir}/${DEBIAN_BUILD}/mail/branding/${pkgname}/mailicon${i/x*/}.png"
  done
  for i in 48x48 64x64; do
      install -Dm644 "debian/app-icons/${pkgname}${i/x*/}.png" "${srcdir}/${DEBIAN_BUILD}/mail/branding/${pkgname}/content/icon${i/x*/}.png"
  done

  # We are doing it from sed commands
  rm -v debian/patches/fixes/vp8_impl.cc-backporting-naming-for-constants.patch || true

  quilt push -av

  # Fix paths on makefile
  sed -i 's|topsrcdir = [.][.]/[.][.]/[.][.]/|topsrcdir = @top_srcdir@|;
          s|include $(topsrcdir)/config/autoconf.mk|include $(DEPTH)/config/autoconf.mk|;
          s|include $(DEPTH)/config/rules.mk|include $(topsrcdir)/config/rules.mk|;
         ' mail/branding/icedove/Makefile.in

  sed -i 's|topsrcdir      = [.][.]/[.][.]/[.][.]/[.][.]|topsrcdir      = @top_srcdir@|;
          s|include $(topsrcdir)/config/autoconf.mk|include $(DEPTH)/config/autoconf.mk|;
          s|include $(DEPTH)/config/rules.mk|include $(topsrcdir)/config/rules.mk|;
         ' mail/branding/icedove/locales/Makefile.in

  # Fix package-manifest.in
  sed -i '\|; Phishing Protection| s|$|\n#ifdef MOZ_SAFE_BROWSING|;
          \|@BINPATH@/components/url-classifier[.]xpt| s|$|\n#endif|
         ' mail/installer/package-manifest.in

  # Fix branding
  sed -i 's|Icedove Mail/News|Icedove|' mail/branding/icedove/locales/en-US/brand.{dtd,properties}

  # Replace common URLs
  sed -i '\|extensions[.]getAddons[.]get[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]browseURL| s|https://addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]webservice[.]discoverURL| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
         ' mail/app/profile/all-thunderbird.js

  cp "${srcdir}/mozconfig" .mozconfig

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure

  # Install to /usr/lib/$pkgname
  patch -Np1 -i "$srcdir/${pkgname}-install-dir.patch"

  # Add symlinks to use jquery files built for us
  ln -s /usr/share/javascript/jquery/jquery.min.js mail/jquery
  ln -s /usr/share/javascript/jquery-ui/jquery-ui.min.js mail/jquery

  # Fixing for libvpx >= 1.4.0
  sed -i 's|IMG_FMT_I420|VPX_IMG_FMT_I420|;
          s|PLANE_U|VPX_PLANE_U|;
          s|PLANE_V|VPX_PLANE_V|;
          s|PLANE_Y|VPX_PLANE_Y|;
          s|VPX_VPX_PLANE_|VPX_PLANE_|;
         ' mozilla/content/media/encoder/VP8TrackEncoder.cpp \
           mozilla/media/webrtc/trunk/webrtc/modules/video_coding/codecs/vp8/vp8_impl.cc
}

build() {
  export DEBIAN_BUILD="comm-esr31"

  cd "${srcdir}/${DEBIAN_BUILD}"

  export LDFLAGS="${LDFLAGS} -Wl,-rpath,/usr/lib/${pkgname}"
  export PYTHON="/usr/bin/python2"

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="${MAKEFLAGS}"
}

package() {
  export DEBIAN_BUILD="comm-esr31"

  cd "${srcdir}/${DEBIAN_BUILD}"

  make -j1 -f client.mk DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/usr/lib/${pkgname}/defaults/preferences/vendor.js"

  for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
      install -Dm644 "debian/app-icons/${pkgname}${i/x*/}.png" "${pkgdir}/usr/share/icons/hicolor/$i/apps/${pkgname}.png"
  done
  install -Dm644 "debian/app-icons/${pkgname}_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  rm -rf "${pkgdir}"/usr/lib/${pkgname}/{dictionaries,hyphenation,searchplugins}
  ln -sf /usr/share/hunspell "${pkgdir}/usr/lib/${pkgname}/dictionaries"
  ln -sf /usr/share/hyphen "${pkgdir}/usr/lib/${pkgname}/hyphenation"
  ln -sf /usr/lib/mozilla/searchplugins "${pkgdir}/usr/lib/${pkgname}/searchplugins"

  # We don't want the development stuff
  rm -r "${pkgdir}"/usr/{include,lib/${pkgname}-devel,share/idl}
}
