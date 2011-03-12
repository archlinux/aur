# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=10.0.648.133
pkgrel=1
pkgdesc='The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser.'
arch=('i686' 'x86_64')
url='http://www.chromium.org/'
license=('BSD')
depends=('nss' 'gconf' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme' 'bzip2' 'libevent' 'libxss' 'libxtst' 'ttf-dejavu' 'desktop-file-utils')
makedepends=('python2' 'perl' 'gperf' 'yasm' 'mesa' 'libgnome-keyring')
provides=('chromium-browser')
conflicts=('chromium-browser')
install=chromium.install
source=("http://build.chromium.org/buildbot/official/chromium-${pkgver}.tar.bz2"
        'chromium.desktop' 'chromium.sh' chromium-webkit-version.patch)
md5sums=('e589dd60329b3947b26c5fde31e546de'
         '075c3c2fa5902e16b8547dd31d437191'
         '096a46ef386817988250d2d7bddd1b34'
         'dee3e8798f8916d23fce203478094822')

build() {
  cd ${srcdir}/chromium-${pkgver}

  #http://code.google.com/p/chromium/issues/detail?id=70537
  patch -Np1 -i ${srcdir}/chromium-webkit-version.patch

### Configure

  echo 'Use python2 instead of python...'
  find . -type f -exec \
	sed -E 's#(/usr/bin/python)$#\12#g;s#(/usr/bin/python2)\.4$#\1#g' -i {} \;
  # There are still a lot of relative calls which need a workaround
  mkdir ${srcdir}/python2-path
  ln -s /usr/bin/python2 ${srcdir}/python2-path/python
  export PATH="${srcdir}/python2-path/:${PATH}"

  # we need to disable system_ssl until "next protocol negotiation" support
  # is available in our nss package
  # see https://bugzilla.mozilla.org/show_bug.cgi?id=547312

  build/gyp_chromium -f make build/all.gyp --depth=. \
    -Dgcc_version=45 \
    -Dno_strict_aliasing=1 \
    -Dwerror= \
    -Dlinux_sandbox_path=/usr/lib/chromium/chromium-sandbox \
    -Dlinux_strip_binary=1 \
    -Drelease_extra_cflags="${CFLAGS}" \
    -Dffmpeg_branding=Chrome \
    -Dproprietary_codecs=1 \
    -Duse_system_libjpeg=1 \
    -Duse_system_libxslt=0 \
    -Duse_system_libxml=0 \
    -Duse_system_bzip2=1 \
    -Duse_system_zlib=1 \
    -Duse_system_libpng=1 \
    -Duse_system_ffmpeg=0 \
    -Duse_system_yasm=1 \
    -Duse_system_libevent=1 \
    -Duse_system_ssl=0 \
    $([ "${CARCH}" == 'i686' ] && echo '-Ddisable_sse2=1')

### Build

  make chrome chrome_sandbox BUILDTYPE=Release
}

package() {
  cd ${srcdir}/chromium-${pkgver}

  install -m 0755 -D out/Release/chrome ${pkgdir}/usr/lib/chromium/chromium

  install -m 4555 -o root -g root -D out/Release/chrome_sandbox \
    ${pkgdir}/usr/lib/chromium/chromium-sandbox

  install -m 0644 -D out/Release/chrome.pak \
    ${pkgdir}/usr/lib/chromium/chrome.pak

  install -m 0644 -D out/Release/resources.pak \
    ${pkgdir}/usr/lib/chromium/resources.pak

  install -m 0755 -D out/Release/libffmpegsumo.so \
    ${pkgdir}/usr/lib/chromium/libffmpegsumo.so

# these links are only needed when building with system ffmpeg
#  ln -s /usr/lib/libavcodec.so.52 ${pkgdir}/usr/lib/chromium/
#  ln -s /usr/lib/libavformat.so.52 ${pkgdir}/usr/lib/chromium/
#  ln -s /usr/lib/libavutil.so.50 ${pkgdir}/usr/lib/chromium/

  cp -a out/Release/locales out/Release/resources \
    ${pkgdir}/usr/lib/chromium/

  find ${pkgdir}/usr/lib/chromium/ -name '*.d' -type f -delete

  install -m 0644 -D out/Release/chrome.1 \
    ${pkgdir}/usr/share/man/man1/chromium.1

  install -m 0644 -D ${srcdir}/chromium.desktop \
    ${pkgdir}/usr/share/applications/chromium.desktop

  for size in 16 22 24 32 48 64 128 256; do
    install -m 0644 -D \
      chrome/app/theme/chromium/product_logo_${size}.png \
      ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png
  done

  install -m 0755 -D ${srcdir}/chromium.sh ${pkgdir}/usr/bin/chromium

  install -m 0644 -D LICENSE ${pkgdir}/usr/share/licenses/chromium/LICENSE
}

# vim:set sw=2 sts=2 et:
