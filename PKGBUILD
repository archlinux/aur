# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod
pkgver=0.8.2
_pkgver=0.8.2
pkgrel=3
pkgdesc="A fork of The Ur-Quan Masters that remasters the HD mod with a veritable smorgasbord of extra features and options by JHGuitarFreak (Kohr-Ah Death)."
arch=("x86_64")
url="https://github.com/JHGuitarFreak/UQM-MegaMod"
license=("GPL2")

makedepends=("pkgconf" "lua")
depends=("libogg" "libpng" "libvorbis" "libgl" "sdl2" "zlib" "glu" "libmikmod" "lua52" "uqm-megamod-data")
optdepends=(
  "uqm-megamod-addon-hd: For HD assets"
  "uqm-megamod-addon-classic-hd: For Classic HD-mod styled textures"
  "uqm-megamod-addon-3do: For 3DO content (voice, music and videos)"
  "uqm-megamod-addon-sol-textures: For improved textures for the planets in the Sol System"
  "uqm-megamod-addon-vols-remix: For a remix pack by Volasaurus"
)

source=(
  "${pkgname}-${_pkgver}.tar.gz::https://github.com/JHGuitarFreak/UQM-MegaMod/archive/refs/tags/${_pkgver}.tar.gz"
  config.state
  uqm-megamod
  uqm-megamod.desktop
  uqm-megamod.png
  fix_userdir_location.diff
)

md5sums=(
  "e399ca893a0974889c2423aea8f23570"
  "b0387306700c3c853b13876fa13e45fd"
  "123544d70ae98cb3037f9595cc427b72"
  "16019d6775329f5d4a57f9280b4559f1"
  "c6a3026f3a42c24f47d9ceacf86d1d83"
  "39e1cde3ef631535c2fb2b9155cd9e21"
)

noextract=("mm-${_pkgver}-content.uqm")

prepare() {
  mv "${srcdir}/UQM-MegaMod-${_pkgver}" "${srcdir}/${pkgname}-${_pkgver}"
  cd "${srcdir}/${pkgname}-${_pkgver}"
  cp "${srcdir}/config.state" .
  patch -p1 < "${srcdir}/fix_userdir_location.diff"
  sed -i 's/uqm_CFLAGS="$uqm_CFLAGS -Isrc"/uqm_CFLAGS="$CPPFLAGS $CFLAGS $uqm_CFLAGS -Isrc"/' Makeproject
  sed -i 's/uqm_CXXFLAGS="$uqm_CXXFLAGS -Isrc"/uqm_CXXFLAGS="$CPPFLAGS $CXXFLAGS $uqm_CXXFLAGS -Isrc"\nuqm_LDFLAGS="$LDFLAGS $uqm_LDFLAGS"/' Makeproject

  ./build.sh uqm reprocess_config
}

build() {
  CFLAGS+=" $(pkgconf --cflags lua52) $(pkgconf --cflags libmikmod)"
  LDFLAGS+=" $(pkgconf --libs lua52) $(pkgconf --libs libmikmod)"
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./build.sh uqm
}

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${_pkgver}/UrQuanMasters" "${pkgdir}/usr/lib/uqm/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  mkdir -p "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
  cp -r "${srcdir}/${pkgname}-${_pkgver}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${_pkgver}/licenses" "${pkgdir}/usr/share/licenses/${pkgname}"
}
