# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=5.0.396.0
pkgrel=1
pkgdesc='The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser.'
arch=('i686' 'x86_64')
url='http://www.chromium.org/'
license=('BSD')
depends=('nss' 'gconf' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme' 'bzip2' 'libevent' 'libxss')
makedepends=('python' 'perl' 'gperf' 'yasm' 'mesa')
provides=('chromium-browser')
conflicts=('chromium-browser')
install='chromium.install'
source=("http://build.chromium.org/buildbot/official/chromium-${pkgver}.tar.bz2"
        'chromium.desktop' 'chromium.sh' 'ffmpeg_branding_mime.patch')
md5sums=('1ca0f15f3bbf39bc298228d9abfcbe1b'
         '897de25e9c25a01f8b1b67abe554a6b7'
         '096a46ef386817988250d2d7bddd1b34'
         'ae9e26e6c2d164e6af0e513dae2273a3')

build() {
  cd ${srcdir}/chromium-${pkgver}

### Patch

  patch -p1 -i ${srcdir}/ffmpeg_branding_mime.patch || return 1

### Configure

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
    -Ddisable_sse2=1

### Build

  make chrome chrome_sandbox BUILDTYPE=Release || return 1
}

package() {
  cd ${srcdir}/chromium-${pkgver}

  install -m 0755 -D out/Release/chrome ${pkgdir}/usr/lib/chromium/chromium

  install -m 4555 -o root -g root -D out/Release/chrome_sandbox \
    ${pkgdir}/usr/lib/chromium/chromium-sandbox

  install -m 0644 -D out/Release/chrome.pak \
    ${pkgdir}/usr/lib/chromium/chrome.pak

  install -m 0755 -D out/Release/libffmpegsumo.so \
    ${pkgdir}/usr/lib/chromium/libffmpegsumo.so

  ln -s /usr/lib/libavcodec.so.52 ${pkgdir}/usr/lib/chromium/
  ln -s /usr/lib/libavformat.so.52 ${pkgdir}/usr/lib/chromium/
  ln -s /usr/lib/libavutil.so.50 ${pkgdir}/usr/lib/chromium/

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
