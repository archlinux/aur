# Contributor: zendeavor <j.s.mcgee115@gmail.com>
# Contributor: Yochai Gal <yochaigal@gmail.com>
# Contributor: Yann Kaiser <kaiser.yann@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=supermeatboy
pkgver=20131111
_pkgver=11112013
pkgrel=1
pkgdesc='An insanely hard and delightfully meaty platformer (game sold separately)'
url='http://www.supermeatboy.com/'
license=('custom')
arch=('i686' 'x86_64')
depends=('openal' 'sdl2' 'sh' 'gcc-libs')
_gamepkg="${pkgname}-linux-${_pkgver}-bin"
source=("hib://${_gamepkg}"
        "${pkgname}.desktop")
md5sums=('fc024d757395eebfdee342571671332b'
         'dc9beaef2fc60faa16d39aed8e84b0d3')
makedepends=('unzip')
options=('!strip')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download the file manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf"; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

build() {
  cd "${srcdir}"
  unzip -u "${_gamepkg}" -d "${pkgname}-${pkgver}" || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    _rmarch='x86'
  else
    _arch='x86'
    _rmarch='amd64'
  fi

  install -d "${pkgdir}/opt"
  cp -Rl data "${pkgdir}/opt/${pkgname}"
  chmod 644 "${pkgdir}/opt/${pkgname}/resources/Shaders/"*.bin
  rm -rf "${pkgdir}/opt/${pkgname}/${_rmarch}"
  # Use system-provided libraries.
  rm "${pkgdir}/opt/${pkgname}/${_arch}/libopenal.so.1"
  rm "${pkgdir}/opt/${pkgname}/${_arch}/libSDL2-2.0.so.0"

  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/SuperMeatBoy" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
