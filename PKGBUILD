# Maintainer: ajs124 < aur AT ajs124 DOT de > 
# Contributer: meyithi <mail at meyithi dot com>

pkgname=unigine-valley
_pkgname=Unigine_Valley
pkgver=1.0
pkgrel=1
pkgdesc="Latest Interactive Unigine Benchmark"
arch=('i686' 'x86_64')
url="http://www.unigine.com"
license=('custom:UNIGINE Engine')
depends=('libgl' 'gcc-libs' 'libxrandr' 'libxinerama' 'fontconfig')
optdepends=('openal: sound support')
source=("https://assets.unigine.com/d/"${_pkgname}"-"${pkgver}".run"
$pkgname.desktop)
sha512sums=('5778fde3c122528fba8e79088b9ccca672afb953f3996bb6d1e9a20e6b7a50934a088daf705711bd04bdcc11d50e09815e6fa4ad6b798efd382b957ae8723977'
            '5224118e34c0247c18be090c6bc9e67a1ee0b3449bbd29a0529859ee5ad4238f4d61badee84fb89ca49e2c58ba346a7d44346c9a6940a9d8b5f981c7d40c9a0e')

[ "${CARCH}" = "i686" ] && _arch=x86
[ "${CARCH}" = "x86_64" ] && _arch=x64

build() {
  sh "${_pkgname}"-"${pkgver}".run --target "${pkgname}" --noexec
}

package() {
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}"/opt/"${pkgname}"/bin/
  install -m775 bin/*_"${_arch}"* "${pkgdir}"/opt/"${pkgname}"/bin/
  cp -R data "${pkgdir}"/opt/"${pkgname}"/
  install -Dm755 valley "${pkgdir}"/usr/bin/"${pkgname}"
  sed -e "s|cd ./bin|cd /opt/"${pkgname}"/bin|" -e "s|./launcher_x86|./launcher_"${_arch}"|g" -i "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 documentation/License.pdf "${pkgdir}"/usr/share/licenses/"${pkgname}/License.pdf"
  install -Dm644 documentation/User_Manual.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"/User_Manual.pdf
}
