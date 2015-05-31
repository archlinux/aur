# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Will Foran <will.foran@gmail.com>
# Contributor: quantax

pkgname=lastfmproxy
pkgver=1.3b
pkgrel=5
pkgdesc="A proxy server for the last.fm radio streams that allows you to use your regular old audio player to listen to the last.fm streams"
url="http://vidar.gimp.org/lastfmproxy"
license='GPL2'
depends=('python2')
backup=(
  'usr/share/lastfmproxy/config.py'
)
arch=('i686' 'x86_64')
source=(
  "http://vidar.gimp.org/wp-content/uploads/2007/12/${pkgname}-${pkgver}.tar.gz"
  'lastfmproxy.service'
)
sha256sums=(
  'b66be0fcc76e557d1306660162db946f97262335f3528cf5d303b3ab3410a881'
  '46470d3ee7aa51a40950fbe550a033ad990ccd2db33bab0dac8bf9ecdd833e07'
)
install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # create directories
  install -d "${pkgdir}/usr/share/lastfmproxy/data/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  # install everything
  cp -r * "${pkgdir}/usr/share/lastfmproxy/"
  chmod -R 644 "${pkgdir}/usr/share/lastfmproxy/"*
  chmod 755 "${pkgdir}/usr/share/lastfmproxy/main.py"
  chmod 755 "${pkgdir}/usr/share/lastfmproxy/changestation.py"
  # create additional executables in /usr/bin
  echo "#!/bin/bash
python2 /usr/share/lastfmproxy/main.py" > "${pkgdir}/usr/bin/lastfmproxy"
  echo "#!/bin/bash
python2 /usr/share/lastfmproxy/changestation.py \$@" > "${pkgdir}/usr/bin/lastfmproxy-station"
  # ... and make them executable
  chmod 755 "${pkgdir}/usr/bin/lastfmproxy"
  chmod 755 "${pkgdir}/usr/bin/lastfmproxy-station"
  # install systemd service file
  install -m 644 "${srcdir}/lastfmproxy.service" "${pkgdir}/usr/lib/systemd/system/"
}
