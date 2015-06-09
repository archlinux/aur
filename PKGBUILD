# Maintainer : Lone_Wolf lonewolf@xs4all.nl
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbpadre@gmail.com>

pkgbase=cndrvcups-common-lb
pkgname=cndrvcups-common-lb
# used this name to avoid conflict with the existing cndrvcups-common (no longer in aur) which was wrong version for cndrvcups-lb
_pkgname=cndrvcups-common
pkgver=2.90
pkgrel=1
pkgdesc="Common printer driver modules for cndrvcups-lb package, built from source"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0100270808.html"
license=('GPL' 'MIT' 'custom')
  depends=('libglade')
if [[ ${CARCH} == "i686" ]]; then
  depends+=('gcc-libs')
  _lib32dir="lib"
else
  depends+=('lib32-gcc-libs')
  _lib32dir="lib32"
fi
makedepends=('automake' 'autoconf')
conflicts=('cndrvcups-lb-bin')
#source=(Linux_UFRII_PrinterDriver_V290_uk_EN.tar.gz::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMjcwODEw&cmp=ABS&lang=EN')
source=(Linux_UFRII_PrinterDriver_V290_uk_EN.tar.gz::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMjcwODEx&cmp=ABS&lang=EN')
options=('!emptydirs' '!strip' 'staticlibs')
sha512sums=('23181155f5719fa0a9c216c058be749b5faaa8ee745d260eba2e5e284ef4ff161e344289a7c301a2d74cc919c5031763b0daf41cd07686cfdce188492a9b34b2')

# build instructions are adapted from upstream cndrvcups-common.spec file

prepare() {
    cd "${srcdir}"/Linux_UFRII_PrinterDriver_V290_uk_EN/Sources
    tar xf "${_pkgname}"-"${pkgver}"-1.tar.gz -C "${srcdir}"
}

build() {

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/buftool
    autoreconf -i
    ./autogen.sh --prefix=/usr/ --enable-progpath=/usr/bin --libdir=/usr/lib

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/cngplp
    _cflags="${CFLAGS}"
    CFLAGS="${CFLAGS} $(pkg-config --cflags --libs gmodule-2.0)"
    autoreconf -i
    ./autogen.sh --prefix=/usr --libdir=/usr/lib 
    CFLAGS="${_cflags}"

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/backend
    autoreconf -i
    ./autogen.sh --prefix=/usr --libdir=/usr/lib

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
    make

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/c3plmod_ipc
    make 
}
package()
{

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
    mkdir -p "${pkgdir}"/usr/{bin,lib/cups/backend,include}
    if [[ ${CARCH}=="x86_64" ]]; then
      mkdir -p "${pkgdir}"/usr/"${_lib32dir}"
    fi
    mkdir -p "${pkgdir}"/usr/share/{caepcm,cngplp,locale/ja/LC_MESSAGES}

    make install DESTDIR="${pkgdir}"

    cd c3plmod_ipc
    make install DESTDIR="${pkgdir}" LIBDIR=/usr/lib
    cd ..

    install -m 755 libs/libcaiowrap.so.1.0.0   "${pkgdir}"/usr/"${_lib32dir}"
    install -m 755 libs/libcaiousb.so.1.0.0    "${pkgdir}"/usr/"${_lib32dir}"

    install -m 755 libs/libc3pl.so.0.0.1     "${pkgdir}"/usr/"${_lib32dir}"
    install -m 755 libs/libcaepcm.so.1.0     "${pkgdir}"/usr/"${_lib32dir}"

    install -m 755 libs/libColorGear.so.0.0.0    "${pkgdir}"/usr/"${_lib32dir}"
    install -m 755 libs/libColorGearC.so.0.0.0    "${pkgdir}"/usr/"${_lib32dir}"


    install -m 644 data/*.ICC  "${pkgdir}"/usr/share/caepcm

    install -s -m 755 libs/c3pldrv     "${pkgdir}"/usr/bin

    install -m 755 libs/libcanon_slim.so.1.0.0   "${pkgdir}"/usr/"${_lib32dir}"

    cd "${pkgdir}"/usr/"${_lib32dir}"
    ln -sf libc3pl.so.0.0.1     libc3pl.so.0
    ln -sf libc3pl.so.0.0.1     libc3pl.so
    ln -sf libcaepcm.so.1.0     libcaepcm.so.1
    ln -sf libcaepcm.so.1.0     libcaepcm.so
    ln -sf libcaiowrap.so.1.0.0   libcaiowrap.so.1
    ln -sf libcaiowrap.so.1.0.0   libcaiowrap.so
    ln -sf libcaiousb.so.1.0.0    libcaiousb.so.1
    ln -sf libcaiousb.so.1.0.0    libcaiousb.so
    ln -sf libcanon_slim.so.1.0.0   libcanon_slim.so.1
    ln -sf libcanon_slim.so.1.0.0   libcanon_slim.so

    ln -sf libColorGear.so.0.0.0    libColorGear.so.0
    ln -sf libColorGear.so.0.0.0    libColorGear.so
    ln -sf libColorGearC.so.0.0.0   libColorGearC.so.0
    ln -sf libColorGearC.so.0.0.0   libColorGearC.so

    cd "${pkgdir}"/usr/lib
    ln -sf libcanonc3pl.so.1.0.0    libcanonc3pl.so
    ln -sf libcanonc3pl.so.1.0.0    libcanonc3pl.so.1
    
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
    install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -m755 LICENSE-common-"${pkgver}"* "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
