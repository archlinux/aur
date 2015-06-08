# Maintainer: mirandir <mirandir[at]orange[dot]com>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=limbo
pkgver=20140618
pkgrel=1
pkgdesc="LIMBO is a modern classic, putting players in control of a boy's journey through a tense and hostile world."
url="http://playdead.com/limbo/"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-sdl2')
else
  depends=('sdl2')
fi
makedepends=('unzip')
_archivename="${pkgname^}-Linux-2014-06-18.sh"
conflicts=('limbo_wine')
_purgelibs=('libSDL2-2.0.so.0')
noextract=("${_archivename}")
source=("${pkgname}.desktop" "hib://${_archivename}")
sha256sums=('be458f507ea5e730967c2dc6e3daec356da75d5b77b29c5d8184093fada02161'
            'e7843c8aaf3d3225814dd98ae1dc39238d9b247f1915b98964a91d10f11f27d3')

PKGEXT=".pkg.tar"

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package()
{
  mkdir -p "${pkgdir}/opt/${pkgname}/"

  unzip -qq "${srcdir}/${_archivename}" -d "${pkgdir}/opt/tmp/" 'data/*' || true

  mv "${pkgdir}/opt/tmp/data/"* "${pkgdir}/opt/${pkgname}/"
  rm -r "${pkgdir}/opt/tmp/"
  
  for i in "${_purgelibs[@]}"; do
    rm "${pkgdir}/opt/${pkgname}/${i}"
  done

  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
