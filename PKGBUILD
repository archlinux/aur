# Maintainer: Josef Vybíhal (josef.vybihal@gmail.com)
# Note: My first PKGBUILD ever, bare with me :) I have been inpired a lot in other PKGBUILDs, like google-chrome's one.

pkgname=google-webdesigner
pkgver=1.7.0.114
pkgrel=1
pkgdesc="Create engaging, interactive HTML5-based designs and motion graphics that can run on any device."
arch=('x86_64')
url="https://www.google.com/webdesigner"
license=('custom:webdesigner')
depends=('gtk2' 'libudev0-shim' 'gconf')
optdepends=()
provides=("google-webdesigner=${pkgver}")
options=('!emptydirs' '!strip')
install=${pkgname}.install
_source_arch="i386"
[ "${CARCH}" = 'x86_64' ] && _source_arch="amd64"
md5sums=('ae2ad8fbae17bed6a529051204b9f606')
#[ "${CARCH}" = 'i686' ] && md5sums[0]='04ab693e6baa641ebcbdcc9512d4f57e' # i686 not tested by me
source=("google-webdesigner_current_${_source_arch}.deb::https://dl.google.com/linux/direct/google-webdesigner_current_${_source_arch}.deb")

package() {
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Moving icons in place"
  # Icons
  for i in 16 32 48 64 128; do
    install -Dm644 "${pkgdir}"/opt/google/webdesigner/resources/product_logo_${i}.png \
                   "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/google-webdesigner.png
  done

  # TODO: changelog /usr/share/doc/google-webdesigner/

  # TODO: License http://www.google.com/intl/en/policies/terms/

  msg2 "Removing unnecessities (e.g. Debian Cron job)"
  rm -r "${pkgdir}"/etc/cron.daily/ "${pkgdir}"/opt/google/webdesigner/cron/
  rm "${pkgdir}"/opt/google/webdesigner/resources/product_logo_*.png

  msg2 "Checking browsers"
  # Google Chrome Dev
  [ ! -f /usr/bin/chrome ] && [ -f /usr/bin/google-chrome-unstable ] && ln -s /usr/bin/google-chrome-unstable "${pkgdir}"/usr/bin/chrome || true

  # Firefox Nightly
  [ ! -f /usr/bin/firefox ] && [ -f /usr/bin/firefox-nightly ] && ln -s /usr/bin/firefox-nightly "${pkgdir}"/usr/bin/firefox || true
}
