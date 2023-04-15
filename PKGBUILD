# Maintainer: bipin Kumar <kbipinkumar@pm.me>

pkgbase=estscan
pkgname=('estscan' 'estscan-doc')
pkgver=3.0.3
pkgrel=2
pkgdesc="ORF-independent detector of coding DNA sequences"
arch=(x86_64)
url="https://estscan.sourceforge.net/"
license=('custom')
makedepends=('gcc-fortran')
source=(
        "$pkgbase-$pkgver.tar.gz::"https://sourceforge.net/projects/estscan/files/estscan/${pkgver}/estscan-${pkgver}.tar.gz""
        "Manual.pdf::"https://sourceforge.net/projects/estscan/files/documentation/Feb-2007/user_guide_fev_07.pdf""
        'Makefile.patch'
        )
sha256sums=('037dc8770681ed12406a789ea292462a4ce5d89b0e906a1a3340aa4debc71e2f'
            '416998f9fc282a53679fd56585b468ccebc4463e61ee5e989d9b426ed6f725fd'
            '262916b33753b64406a926a85d3c8fc807c7acbc4fdcf90955f2bfa6c2dd8a48')

prepare() {
  cp *.patch ${pkgbase}-${pkgver}/
  cp *.pdf ${pkgbase}-${pkgver}/
  cd ${pkgbase}-${pkgver}
  patch -p1 < Makefile.patch
}

build() {
	cd ${pkgbase}-${pkgver}
	make -f Makefile
}

package_estscan() {
depends=('glibc' 'perl' 'gcc-fortran' 'gcc-libs')
    cd ${pkgbase}-${pkgver}
    for bin in {estscan,evaluate_model,extract_EST,extract_UG_EST,makesmat,maskred,prepare_data,winsegshuffle}
  do
    install -Dm755 ${bin} "$pkgdir"/usr/bin/${bin}
  done
    install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_estscan-doc() {
arch=(any)
pkgdesc="Documentation for estscan"
    install -d  "$pkgdir"/usr/share/doc/${pkgname}/
    cd ${pkgbase}-${pkgver}
    install -Dm755 Manual.pdf "$pkgdir"/usr/share/doc/${pkgname}/
    install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
