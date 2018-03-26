# Maintainer : Fredy García <frealgagu at gmail dot com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgbase="freetype2-infinality"
pkgname=("${pkgbase}" "${pkgbase/-/-demos-}" "${pkgbase/-/-docs-}")
pkgver=2.9
pkgrel=2
pkgdesc="Font rasterization library with Infinality patches and custom settings."
arch=("armv7h" "i686" "x86_64")
license=("GPL")
url="http://www.${pkgbase%2-infinality}.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=("bzip2" "harfbuzz" "libpng" "sh" "zlib")
makedepends=("libx11")
source=("https://download-mirror.savannah.gnu.org/releases/${pkgbase%2-infinality}/${pkgbase%2-infinality}-${pkgver}.tar.gz"{,.sig}
        "https://download-mirror.savannah.gnu.org/releases/${pkgbase%2-infinality}/${pkgbase%2-infinality}-doc-${pkgver}.tar.gz"{,.sig}
        "https://download-mirror.savannah.gnu.org/releases/${pkgbase%2-infinality}/ft2demos-${pkgver}.tar.gz"{,.sig}
        "0001-Enable-table-validation-modules.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Enable-table-validation-modules.patch?h=packages/${pkgbase%-infinality}"
        "0002-Enable-infinality-subpixel-hinting.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0002-Enable-infinality-subpixel-hinting.patch?h=packages/${pkgbase%-infinality}"
        "0003-Enable-long-PCF-family-names.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0003-Enable-long-PCF-family-names.patch?h=packages/${pkgbase%-infinality}"
        "0001-psaux-Correctly-handle-Flex-features-52846.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-psaux-Correctly-handle-Flex-features-52846.patch?h=packages/${pkgbase%-infinality}"
        "0005-${pkgbase%2-infinality}-2.5.2-more-demos.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0005-${pkgbase%2-infinality}-2.5.2-more-demos.patch?h=packages/${pkgbase%-infinality}"
        "${pkgbase%-infinality}.sh::https://git.archlinux.org/svntogit/packages.git/plain/trunk/${pkgbase%-infinality}.sh?h=packages/${pkgbase%-infinality}")
sha256sums=("bf380e4d7c4f3b5b1c1a7b2bf3abb967bda5e9ab480d0df656e0e08c5019c5e6"
            "06460168615c4c69293e4126c7e69731b7cc7d4db5470bca3cb95c05807993e2"
            "9312f7d2e5c798684d39e1fecddfed8e29d2102f035c4bd765157e2d077175f8"
            "37c0ee3d983769a50a33292f547bec8d0dc064da62090dd7690bedf2d1dba7d0"
            "29641b22a8e785997a953b5f5e59ba972e6969cb8c43fbce5e5c3537a1fabc7e"
            "54466e05fb50b4a5def0589202ae41b15ea160b279092e01f5322dcd54fba044"
            "12bead126c05bc980af4d4a730f230db925e8bfb27b9e3683cba05e42a4be6e6"
            "7c1438c6bb137e24b39aa8a4eabb5c82f1ed3c3911ad9b698f3944c4a4c79be9"
            "e5541954d302ddae6e6c906b1ab2e18a7a7bec450af90c3f260f26040b7e1731"
            "94bacad40d0be11659518bd6fb663c84f03f8a95b65dff95bb1f1f825f997236"
            "36484db4b926ed026e7f32570573493b5a9793a129f08d54383a26d65a6af89b"
            "f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467")
validpgpkeys=("58E0C111E39F5408C5D3EC76C1A60EACE707FDA5")

prepare() {
  # Rename source dir to allow building the demos
  mv "${srcdir}/${pkgbase%2-infinality}-${pkgver}" "${srcdir}/${pkgbase%-infinality}"
  mv "${srcdir}/ft2demos-${pkgver}" "${srcdir}/${pkgbase%-infinality}-demos"

  cd "${srcdir}/${pkgbase%-infinality}"
  patch -Np1 -i "${srcdir}/0001-Enable-table-validation-modules.patch"
  patch -Np1 -i "${srcdir}/0002-Enable-infinality-subpixel-hinting.patch"
  patch -Np1 -i "${srcdir}/0003-Enable-long-PCF-family-names.patch"

  # Freetype 2.9 regression: bad rendering for some Type 1 fonts
  # https://savannah.nongnu.org/bugs/?52846
  patch -Np1 -i "${srcdir}/0001-psaux-Correctly-handle-Flex-features-52846.patch"

  cd "${srcdir}/${pkgbase%-infinality}-demos"
  # Enable more demos
  patch -Np1 -i "${srcdir}/0005-${pkgbase%2-infinality}-2.5.2-more-demos.patch"

  # Suppress RPATH
  sed -i "/X11_LIB:%=-R%/d" "graph/x11/rules.mk"
}

build() {
  cd "${srcdir}/${pkgbase%-infinality}"
  ./configure --prefix=/usr --disable-static  --with-harfbuzz --with-png
  make

  # Build demos
  cd "${srcdir}/${pkgbase%-infinality}-demos"
  make
}

check() {
  cd "${srcdir}/${pkgbase%-infinality}"
  make -k check
}

package_freetype2-infinality() {
  provides=("${pkgname%-infinality}" "lib${pkgname%2-infinality}.so")
  conflicts=("${pkgname%-infinality}")
  install="${pkgname%-infinality}.install"
  backup=("etc/profile.d/${pkgname%-infinality}.sh")
  options=("libtool")

  cd "${srcdir}/${pkgname%-infinality}"
  make DESTDIR="${pkgdir}" install
  install -Dt "${pkgdir}/etc/profile.d" -m644 "${srcdir}/${pkgname%-infinality}.sh"
}

package_freetype2-demos-infinality() {
  pkgdesc="Freetype tools and demos with Infinality patches and custom settings"
  depends=("${pkgname%-demos-infinality}" "libx11")
  provides=("${pkgname%-infinality}")
  conflicts=("${pkgname%-infinality}")

  cd "${srcdir}/${pkgname%-infinality}"
  install -d "${pkgdir}/usr/bin"
  for _i in bin/{f,t}t*; do
    libtool --mode=install install $_i "${pkgdir}/usr/bin"
  done
}

package_freetype2-docs-infinality() {
  pkgdesc="Freetype documentation with Infinality patches and custom settings"
  depends=("${pkgname%-docs-infinality}")
  provides=("${pkgname%-infinality}")
  conflicts=("${pkgname%-infinality}")

  cd "${pkgname%-docs-infinality}"
  install -d "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname%-docs-infinality}"
}
