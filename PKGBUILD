#Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>
pkgbase=cndrvcups-lb
pkgname=cndrvcups-lb
pkgver=2.90
pkgrel=3
pkgdesc="Canon UFR II /LIPSLX Printer Driver build from source for LBP, iR & MF printers"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0100270808.html"
license=('custom')
install=${pkgname}.install
depends=('cndrvcups-lb-cpca=2.90-3' 'cndrvcups-common-lb')
if [[ $CARCH == "i686" ]]; then
  depends+=('libxml2')
  _lib32dir="lib"
else
  depends+=('lib32-libxml2')
  _lib32dir="lib32"
fi
makedepends=('autoconf' 'automake')
conflicts=('cndrvcups-lb-bin')
source=(Linux_UFRII_PrinterDriver_V290_uk_EN.tar.gz::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMjcwODEx&cmp=ABS&lang=EN'
       'how-to.txt')
options=('!emptydirs' '!strip' '!libtool')
sha512sums=('23181155f5719fa0a9c216c058be749b5faaa8ee745d260eba2e5e284ef4ff161e344289a7c301a2d74cc919c5031763b0daf41cd07686cfdce188492a9b34b2'
            '736e1785c443c4d129c8801a127410012889f46691259e8a7f6a54106a0647beb5b6267aabb78b3ed0a1c7a9d8ce216e159515d3aad425812e5be52c8b58e4ee')
         
# build instructions are adapted from upstream cndrvcups-lb.spec file
prepare() {
    cd "${srcdir}"/Linux_UFRII_PrinterDriver_V290_uk_EN/Sources
    tar xf "${pkgbase}"-"${pkgver}"-1.tar.gz -C "${srcdir}"
}

build() {
    
    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/ppd
    autoreconf -fi
    ./autogen.sh --prefix=/usr
        
    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/pstoufr2cpca
    autoreconf -fi
    ./autogen.sh --prefix=/usr --libdir=/usr/lib
    cd ..

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/cngplp
    aclocal
    autoreconf -fi
    ./autogen.sh --prefix=/usr --libdir=/usr/lib
    
    cd files
    autoreconf -fi
    ./autogen.sh --prefix=/usr

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"
    for _dir in pstoufr2cpca ppd cngplp
    do
      echo "compiling modules ${_dir} ..."
      cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/"${_dir}"
      make
    done
}

package() {
  
    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"

    if [[ $CARCH=="x86_64" ]]; then
      mkdir -p "${pkgdir}"/usr/"${_lib32dir}"
    fi
    mkdir -p "${pkgdir}"/usr/{bin,share/{caepcm,cnpkbidi,ufr2filter}}
    for _dir in pstoufr2cpca ppd cngplp
    do
      echo "Installing modules ${_dir} ..."
      cd "${srcdir}"/"${pkgbase}"-"${pkgver}"/"${_dir}"
      make install DESTDIR="${pkgdir}"
    done

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"
    install -m 4755 libs/cnpkmoduleufr2  "${pkgdir}"/usr/bin

    install -m 755 libs/libcanonufr2.la  "${pkgdir}"/usr/"${_lib32dir}"
    install -s -m 755 libs/libcanonufr2.so.1.0.0  "${pkgdir}"/usr/"${_lib32dir}"
    install -s -m 755 libs/libufr2filter.so.1.0.0   "${pkgdir}"/usr/"${_lib32dir}"
    install -s -m 755 libs/libEnoJBIG.so.1.0.0   "${pkgdir}"/usr/"${_lib32dir}"
    install -s -m 755 libs/libEnoJPEG.so.1.0.0   "${pkgdir}"/usr/"${_lib32dir}"
    install -s -m 755 libs/cnpkbidi   "${pkgdir}"/usr/bin
    install -s -m 755 libs/libcaiocnpkbidi.so.1.0.0   "${pkgdir}"/usr/"${_lib32dir}"

    install -m 644 data/CnLB*  "${pkgdir}"/usr/share/caepcm
    install -m 644 libs/cnpkbidi_info* "${pkgdir}"/usr/share/cnpkbidi
    install -m 644 libs/ThLB*  "${pkgdir}"/usr/share/ufr2filter

    install -m 755 libs/libcnlbcm.so.1.0     "${pkgdir}"/usr/"${_lib32dir}"

    cd "${pkgdir}"/usr/"${_lib32dir}"
    ln -sf libcanonufr2.so.1.0.0 libcanonufr2.so
    ln -sf libcanonufr2.so.1.0.0 libcanonufr2.so.1
    ln -sf libufr2filter.so.1.0.0 libufr2filter.so
    ln -sf libufr2filter.so.1.0.0 libufr2filter.so.1
    ln -sf libEnoJBIG.so.1.0.0 libEnoJBIG.so
    ln -sf libEnoJBIG.so.1.0.0 libEnoJBIG.so.1
    ln -sf libEnoJPEG.so.1.0.0 libEnoJPEG.so
    ln -sf libEnoJPEG.so.1.0.0 libEnoJPEG.so.1
    ln -sf libcaiocnpkbidi.so.1.0.0 libcaiocnpkbidi.so
    ln -sf libcaiocnpkbidi.so.1.0.0 libcaiocnpkbidi.so.1
    ln -sf libcnlbcm.so.1.0     libcnlbcm.so.1
    ln -sf libcnlbcm.so.1.0     libcnlbcm.so

    cd "${srcdir}"/"${pkgbase}"-"${pkgver}"
    install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -m644 L*-ufr2-"${pkgver}"* "${pkgdir}"/usr/share/licenses/"${pkgname}/"
    install -m644 LICENSE-lipslx-"${pkgver}".txt "${pkgdir}"/usr/share/licenses/"${pkgname}/"
    install -m755 -d "${pkgdir}"/usr/share/doc/"${pkgname}"
    install -m644 READ* "${pkgdir}"/usr/share/doc/"${pkgname}"
    install -m644 "${srcdir}"/Linux_UFRII_PrinterDriver_V290_uk_EN/Documents/guide-ufr2-2.9xUK.tar.gz "${pkgdir}"/usr/share/doc/"${pkgname}"/guide-ufr2-2.9xUK.tar.gz
}
