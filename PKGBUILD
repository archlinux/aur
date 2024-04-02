# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
# Maintainer: Ckat <ckath@yandex.com>

pkgname=unifont-otb
pkgver=15.1.05
pkgrel=1
pkgdesc="A free bitmap font with wide Unicode support (OTB version generated with fonttosfnt)"
arch=('any')
license=('GPL2')
url="https://ftp.gnu.org/gnu/unifont"
makedepends=('fonttosfnt-git')
conflicts=('otb-unifont')
source=("https://ftp.gnu.org/gnu/unifont/unifont-${pkgver}/unifont-${pkgver}.bdf.gz"{,.sig} "https://unifoundry.com/LICENSE.txt")
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy
md5sums=('202302c7bc7fbb2147d2765c723d82d6'
         'SKIP'
         '4cba5a7530b5f046a1305d520cde8c2b')

build() {
	cd "${srcdir}"
	f="unifont-${pkgver}.bdf"
	family_name="$(grep -F 'FAMILY_NAME "' "$f")"
    family_name="${family_name%\"}"
    family_name_otb="$family_name (OTB)"
    sed -i "s/$family_name/$family_name_otb/" "$f"
    fonttosfnt -b -c -g 2 -m 2 -o "${f/bdf/otb}" "$f"
}

package() {
    cd "${srcdir}"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    for f in *.otb; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/fonts/misc/${f}"
    done
}
