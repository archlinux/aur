# Maintainer : shogeki < shogeki at gmail dot com >

pkgname=uqm-megamod-git
pkgver=0.8.3.r263.g6ba5942f
_pkgver=0.8.3
pkgrel=1
pkgdesc="A fork of The Ur-Quan Masters that remasters the HD mod with a veritable smorgasbord of extra features and options by JHGuitarFreak (Kohr-Ah Death). Latest Git version"
arch=("x86_64")
url="https://github.com/JHGuitarFreak/UQM-MegaMod"
license=("GPL2")
options=("!debug" "!strip")

makedepends=("pkgconf" "lua" "git")
depends=("libogg" "libpng" "libvorbis" "libgl" "sdl2" "zlib" "glu" "libmikmod" "lua52")
conflicts=(uqm-megamod)
source=(
  "git+https://github.com/JHGuitarFreak/UQM-MegaMod.git"
  "git+https://github.com/JHGuitarFreak/UQM-MegaMod-Content.git"
  "https://downloads.sourceforge.net/project/sc2/UQM%20Remix%20Packs/UQM%20Remix%20Pack%201/uqm-remix-disc1.uqm"
  "https://downloads.sourceforge.net/project/sc2/UQM%20Remix%20Packs/UQM%20Remix%20Pack%202/uqm-remix-disc2.uqm"
  "https://downloads.sourceforge.net/project/sc2/UQM%20Remix%20Packs/UQM%20Remix%20Pack%203/uqm-remix-disc3.uqm"
  "https://downloads.sourceforge.net/project/sc2/UQM%20Remix%20Packs/UQM%20Remix%20Pack%204/uqm-remix-disc4-1.uqm"
  "https://downloads.sourceforge.net/project/sc2/UQM/0.8/uqm-0.8.0-3domusic.uqm"
  config.state
  uqm-megamod
  uqm-megamod.desktop
  uqm-megamod.png
  fix_userdir_location.diff
)

md5sums=(
"SKIP"
"SKIP"
"09f242d8d72166d1d5ccbd3d99c93e7d"
"fbc8bdcb709939d559d8c7216ad15cc2"
"5ccc6d4ac301ae98e172ac6835dcdead"
"3fb63f4ac514343ed4b4b5b194c413fb"
"9e5801d45ca12028b486cdeb83568c02"
"b0387306700c3c853b13876fa13e45fd"
"123544d70ae98cb3037f9595cc427b72"
"16019d6775329f5d4a57f9280b4559f1"
"c6a3026f3a42c24f47d9ceacf86d1d83"
"39e1cde3ef631535c2fb2b9155cd9e21"
)

noextract=("uqm-remix-disk1.uqm" "uqm-remix-disc2.uqm" "uqm-remix-disc3.uqm" "uqm-remix-disc4-1.uqm" "uqm-0.8.0-3domusic.uqm")

prepare() {
  cd ${srcdir}/UQM-MegaMod
  cp "${srcdir}/config.state" .
  patch -p1 < "${srcdir}/fix_userdir_location.diff"
  sed -i 's/uqm_CFLAGS="$uqm_CFLAGS -Isrc"/uqm_CFLAGS="$CPPFLAGS $CFLAGS $uqm_CFLAGS -Isrc"/' Makeproject
  sed -i 's/uqm_CXXFLAGS="$uqm_CXXFLAGS -Isrc"/uqm_CXXFLAGS="$CPPFLAGS $CXXFLAGS $uqm_CXXFLAGS -Isrc"\nuqm_LDFLAGS="$LDFLAGS $uqm_LDFLAGS"/' Makeproject

  ./build.sh uqm reprocess_config
}

pkgver() {
	cd "$srcdir/UQM-MegaMod"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  CFLAGS+=" $(pkgconf --cflags lua52) $(pkgconf --cflags libmikmod) -Wno-incompatible-pointer-types "
  LDFLAGS+=" $(pkgconf --libs lua52) $(pkgconf --libs libmikmod)"
  cd "${srcdir}/UQM-MegaMod"
  ./build.sh uqm
}

package() {
  install -Dm755 "${srcdir}/uqm-megamod" "${pkgdir}/usr/bin/uqm-megamod"
  install -Dm755 "${srcdir}/UQM-MegaMod/UrQuanMasters" "${pkgdir}/usr/lib/uqm/uqm-megamod"
  install -Dm644 "${srcdir}/uqm-megamod.desktop" "${pkgdir}/usr/share/applications/uqm-megamod.desktop"
  install -Dm644 "${srcdir}/uqm-megamod.png" "${pkgdir}/usr/share/pixmaps/uqm-megamod.png"
  mkdir -p "${pkgdir}/usr/share/uqm-megamod/content/"
  cp -vr "${srcdir}/UQM-MegaMod-Content/." "${pkgdir}/usr/share/uqm-megamod/content"
  install -Dm644 "${srcdir}/uqm-remix-disc1.uqm" "${pkgdir}/usr/share/uqm-megamod/content/uqm-remix-disc1.uqm"
  install -Dm644 "${srcdir}/uqm-remix-disc2.uqm" "${pkgdir}/usr/share/uqm-megamod/content/uqm-remix-disc2.uqm"
  install -Dm644 "${srcdir}/uqm-remix-disc3.uqm" "${pkgdir}/usr/share/uqm-megamod/content/uqm-remix-disc3.uqm"
  install -Dm644 "${srcdir}/uqm-remix-disc4-1.uqm" "${pkgdir}/usr/share/uqm-megamod/content/uqm-remix-disc4-1.uqm"
  install -Dm644 "${srcdir}/uqm-0.8.0-3domusic.uqm" "${pkgdir}/usr/share/uqm-megamod/content/uqm-0.8.0-3domusic.uqm"
  
  mkdir -p "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
  cp -vr "${srcdir}/UQM-MegaMod/doc" "${pkgdir}/usr/share/doc/uqm-megamod"
  cp -vr "${srcdir}/UQM-MegaMod/licenses" "${pkgdir}/usr/share/licenses/uqm-megamod"
}
