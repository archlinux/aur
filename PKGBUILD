# -*- pkgbuild-update-sums-on-save: nil -*-
# Maintainer: jpkotta [at] gmail dot com

pkgname=foldingathome-noroot
pkgver=7.4.4
pkgrel=1
pkgdesc="Folding@Home client that does not run as the root user."
arch=('i686' 'x86_64')
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('glibc')
optdepends=('opencl-nvidia: for folding with an nVidia GPU')
replaces=('foldingathome-v7' 'foldingathome')
conflicts=('foldingathome-v7' 'foldingathome')
install=foldingathome.install

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

[ "$CARCH" = "i686" ] && _source_arch="32bit"
[ "$CARCH" = "x86_64" ] && _source_arch="64bit"

_urlbase="https://fah-web.stanford.edu/file-releases/public/release/fahclient"
source=(foldingathome.service fah-config foldingathome.install)
md5sums=('40530df579e406fa29e6535adf2c0c22'
         'bb0bca34f6f32c8bd46dfcdcd6abe1f6'
         '12accb9cd18aaa13d8b2f1ce6fa169d0')

_urlbase="https://fah-web.stanford.edu/file-releases/public/release/fahclient"
if [ "$CARCH" = "i686" ]; then
  source+=($_urlbase/debian-testing-32bit/v7.4/fahclient_${pkgver}-32bit-release.tar.bz2)
  md5sums+=('cfc23aeb72efed82289b53a055618dfc')
elif [ "$CARCH" = "x86_64" ]; then
  source+=($_urlbase/debian-testing-64bit/v7.4/fahclient_${pkgver}-64bit-release.tar.bz2)
  md5sums+=('3a068d236d3a508a2a98a4a161fa14e2')
fi

package() {
  tardir=${srcdir}/fahclient_${pkgver}-${_source_arch}-release/
  installdir=${pkgdir}/opt/fah/

  install -D -c -m755 ${srcdir}/fah-config ${installdir}/fah-config
  install -D -c -m755 ${tardir}/FAHClient ${installdir}/FAHClient
  install -D -c -m755 ${tardir}/FAHCoreWrapper ${installdir}/FAHCoreWrapper
  install -D -c -m755 ${tardir}/sample-config.xml ${installdir}/sample-config.xml

  chmod 755 ${installdir}/FAHClient
  chmod 755 ${installdir}/FAHCoreWrapper
  install -D -m644 ${tardir}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
  install -D -m644 ${tardir}/README ${installdir}/README
  install -D -m644 ${tardir}/ChangeLog ${installdir}/ChangeLog
  install -D -m644 ${srcdir}/foldingathome.service ${pkgdir}/etc/systemd/system/foldingathome.service
}

