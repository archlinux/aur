origname=tremulous
pkgname="${origname}-git"
origver=1.2.0
pkgver=1.2.0.r3127.c862a534
pkgrel=1
pkgdesc='Team based FPS/RTS hybrid built on the open ioq3 engine.'
url='http://tremulous.net'
arch=('x86_64' 'i686')
license=('GPL')
depends=('sdl' 'openal' 'libgl' "tremulous-data=1.1.0" "freetype2" 'glu')
makedepends=('git' 'mesa')
provides=("tremulous-updated=${origver}-${pkgrel}")
conflicts=('tremulous-updated')
replaces=('trem-backport' 'tremulous-updated')
source=(git://github.com/darklegion/tremulous.git
        autogen.cfg
        tremdedrc
        tremded.sh
        tremulous.sh
        tremulous.desktop
        tremulous.xpm)
backup=('etc/tremdedrc')

_arch="${CARCH/i686/x86}"

pkgver() {
  cd "${srcdir}/${origname}"
  echo "${origver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  sed -i "s/EXT_REPLACE/${_arch}/" "${srcdir}/tremulous.sh"
  sed -i "s/EXT_REPLACE/${_arch}/" "${srcdir}/tremded.sh"

  cd "${srcdir}/${origname}"
  make release
}

package() {
  cd "${srcdir}/${origname}"
  install -D -m644 "${srcdir}/autogen.cfg"  "${pkgdir}/opt/tremulous/autogen.cfg"
  install -D -m644 "${srcdir}/tremdedrc"    "${pkgdir}/etc/tremdedrc"
  install -D -m755 "${srcdir}/tremded.sh"   "${pkgdir}/usr/bin/tremded"
  install -D -m755 "${srcdir}/tremulous.sh" "${pkgdir}/usr/bin/tremulous"

  install -D -m755 "build/release-linux-${_arch}/tremded.${_arch}" \
    "${pkgdir}/opt/tremulous/tremded.${_arch}"
  install -D -m755 "build/release-linux-${_arch}/tremulous.${_arch}" \
    "${pkgdir}/opt/tremulous/tremulous.${_arch}"
  install -D -m755 "build/release-linux-${_arch}/renderer_opengl1_${_arch}.so" \
    "${pkgdir}/opt/tremulous/renderer_opengl1_${_arch}.so"
  install -D -m755 "build/release-linux-${_arch}/renderer_opengl2_${_arch}.so" \
    "${pkgdir}/opt/tremulous/renderer_opengl2_${_arch}.so"

  # Install the .desktop and icon files
  install -D -m644 "${srcdir}/tremulous.xpm"     "${pkgdir}/usr/share/pixmaps/tremulous.xpm"
  install -D -m644 "${srcdir}/tremulous.desktop" "${pkgdir}/usr/share/applications/tremulous.desktop"
}

sha256sums=('SKIP'
            '6a41333f4b2a4937b91cd26bc257575ee55c1f1c8dae1324c880c4fad32c6c0f'
            '7393025b937812220a0e6a3e16112ae3a7f1297ad4fcdebd3d944676ca26697c'
            'fb308390bf62c651cf83c496d58cdcd53dcb548ec2b1d7c8c3433d329fa2fd70'
            'd50043ef0f2aabf0aa2a17114f1987b4e78898d5b13e75a3338418850c78c7e5'
            '9af436e7f004abeb043276de6948d6142a8a4cfb554993b7aa8d9e09e41acafa'
            '0770cc5e153b25e00d42077e3f0e7f813264f1db468efca2a26083a5d38301d1')
