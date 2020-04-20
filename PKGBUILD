# Maintainer : Fredy García <frealgagu at gmail dot com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: bohoomil <@zoho.com>
# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
pkgbase="freetype2-infinality"
pkgname=("${pkgbase}" "${pkgbase/-/-demos-}" "${pkgbase/-/-docs-}")
pkgver=2.10.1
pkgrel=1
_patchrel=2019.08.21
pkgdesc="Font rasterization library with Infinality patches and custom settings."
arch=("armv7h" "i686" "x86_64")
license=("GPL")
url="http://www.${pkgbase%2-infinality}.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=("bzip2" "harfbuzz" "libpng" "sh" "zlib")
provides=("freetype2=$pkgver" 'freetype2-infinality' 'libfreetype.so')
conflicts=('freetype2' 'freetype2-infinality')
makedepends=("libx11")
source=("https://download-mirror.savannah.gnu.org/releases/${pkgbase%2-infinality}/${pkgbase%2-infinality}-${pkgver}.tar.gz"{,.sig}
        "https://download-mirror.savannah.gnu.org/releases/${pkgbase%2-infinality}/${pkgbase%2-infinality}-doc-${pkgver}.tar.gz"{,.sig}
        "https://download-mirror.savannah.gnu.org/releases/${pkgbase%2-infinality}/ft2demos-${pkgver}.tar.gz"{,.sig}
        "0001-Enable-table-validation-modules.patch"
        "0002-infinality-${pkgver}-${_patchrel}.patch"
        "0003-Enable-long-PCF-family-names.patch"
        "0004-freetype-2.5.2-more-demos.patch"
        freetype2.sh
        )
sha256sums=('3a60d391fd579440561bf0e7f31af2222bc610ad6ce4d9d7bd2165bca8669110'
            'SKIP'
            'a4e4a8e69c7bf833eba7c158254a572fd43131d5e9b8791bd2ecbb03546ce155'
            'SKIP'
            '5e9e94a2db9d1a945293a1644a502f6664a2173a454d4a55b19695e2e2f4a0bc'
            'SKIP'
            '739a67083b810c04e5cb87fa7e5a7819983410307e3d38d8f2a334c23085a5c2'
            'afdc909def9d7e839f227a83a4e3b58d4060a28861739f9e1ab5540e60929cc8'
            '778a084b84215fbe62dafaed1dd7ebcdbd35c5c7af681d2789b5fe37764ceadd'
            '36484db4b926ed026e7f32570573493b5a9793a129f08d54383a26d65a6af89b'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467')
validpgpkeys=("58E0C111E39F5408C5D3EC76C1A60EACE707FDA5")

prepare() {
  # Rename source dir to allow building the demos
  mv "${srcdir}/${pkgbase%2-infinality}-${pkgver}" "${srcdir}/${pkgbase%-infinality}"
  mv "${srcdir}/ft2demos-${pkgver}" "${srcdir}/${pkgbase%-infinality}-demos"

  cd "${srcdir}/${pkgbase%-infinality}"
  patch -Np1 -i "${srcdir}/0001-Enable-table-validation-modules.patch"
  patch -Np1 -i "${srcdir}/0002-infinality-${pkgver}-${_patchrel}.patch"
  patch -Np1 -i "${srcdir}/0003-Enable-long-PCF-family-names.patch"
  
  cd "${srcdir}/${pkgbase%-infinality}-demos"
  # Enable more demos
  patch -Np1 -i "${srcdir}/0004-${pkgbase%2-infinality}-2.5.2-more-demos.patch"

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
