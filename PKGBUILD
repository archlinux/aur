# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="infekt"
pkgname=("${pkgbase}-cli" "${pkgbase}-gtk")
pkgver=1.3.0
pkgrel=1
pkgdesc="The ultimate best NFO viewer, ever!"
arch=('any')
url="https://infekt.ws"
_url="https://github.com/syndicodefront/${pkgbase}"
license=('GPL-2.0-or-later')
makedepends=('cmake>=3.2.0' 'zlib' 'pkgconf' 'gtk2>=2.16' 'gtkmm>=2.4'
             'gendesk')
depends=('glibc' 'gcc-libs' 'cairo')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/v${pkgver}.tar.gz"
        "${pkgbase}-gtk.png::https://s3.amazonaws.com/cloud.ohloh.net/attachments/31718/sdafdas2_med.png"
        "${pkgbase}_forgiving_utf8.h"
        "${pkgbase}_fix_cmake_main.patch"
        "${pkgbase}_fix_cmake_gtk.patch"
        "${pkgbase}_fix_nfo_renderer_h.patch"
        "${pkgbase}_fix_nfo_renderer_cpp.patch"
        "${pkgbase}_fix_nfo_view_ctrl_h.patch"
        "${pkgbase}_fix_nfo_view_ctrl_cpp.patch"
        "${pkgbase}_fix_nfo_colormap_h.patch"
        "${pkgbase}_fix_nfo_data_cpp.patch"
        "${pkgbase}_fix_util_h.patch")
sha256sums=('0768e7147288c7150d7c8d933f36dd99df5d13e96071b3870ce1c61cc9a0765c'
            'b54898446f768761f2affec657329f0778f2b217b58af5af8b59abb71856e76a'
            '200b1a655944609de6a331463ea809b8163c3f80f5766ba844fff8c1b63fd2ee'
            '1366192d7ed37dad1eb38f4b6b639740afb72ece6d47372d0bb198b0e0c3ed2f'
            '4dcd6707e273e2ddbb7cb2e00c0c3e7e9eb2020eed475722597b223ac1b35d22'
            'e12023f4ad836952a344b425f94fe3628c8a7d6cc24d5db0c35997a84b33fd0f'
            '2b516b84fc5a5c4db951dddb7aa21fcd3f0982218dddb13cb13da6b6c9fe5060'
            '59f8d29ab6b6d92a533768e54ab943f5cf2c87beec57828a093ac7b2895816e1'
            '37a12dddb03fe755e2e7da4406739517378875840bb2e35970ab9218e3663ac0'
            '8e86fc28563e6819a5536063e1cebdb80e9bad229554d21ed9f2ea84fb1eadcb'
            'ffb65a24a67b32610e2ce013a511fa569c3f04f5c7cd5ab0dda39dce7a0c563c'
            '53892d5903477fcd2124dcbe1188db09cecf7723a07ff84d1c1f6319a1353e6b')

prepare() {
  cd "${srcdir}"
  cp "${pkgbase}_forgiving_utf8.h" "${_pkgsrc}/src/lib/forgiving_utf8.h"

  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}_fix"*".patch"; do
    patch -p1 --binary -i "${_patch}"
  done
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DOPTION_GTK=TRUE \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"

  gendesk \
  --pkgname="${pkgbase}-gtk" \
  --pkgdesc="${pkgdesc}" \
  --exec="${pkgbase}-gtk %U" \
  --icon="${pkgbase}-gtk" \
  --categories="Utility;Graphics;GTK" \
  --name="Infekt GTK" \
  --comment="${pkgdesc}" \
  --startupnotify=true \
  -f
}

package_infekt-cli() {
  depends+=('libpng')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  cd "${pkgdir}/usr"
  rm -rf "share/${pkgbase}"

  cd "bin"
  rm -f "${pkgbase}-gtk"
}

package_infekt-gtk() {
  pkgdesc+=" - GTK2 GUI"
  depends+=('infekt-cli' 'gtkmm>=2.4' 'glibmm' 'glib2' 'atkmm' 'libsigc++'
            'cairomm')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png"     "${pkgdir}/usr/share/applications/icons/hicolor/64x64/apps/${pkgname}.png"

  cd "${pkgdir}/usr/bin"
  rm -f "${pkgbase}-cli"
}
