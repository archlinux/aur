# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
pkgdesc="Camouflages network traffic for strong privacy and censorship resistance. Built from Chromium's network stack."
pkgver=102.0.5005.61_1    # use underscore (_) instead of dash (-) in pkgver
pkgrel=2
url="https://github.com/klzgrad/${pkgname%-bin}"
license=('BSD')
depends=('gcc-libs' 'glibc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/config.json")
options=('!strip')      # don't modify prebuilt binaries

# declare supported architectures and corresponding tar name suffices
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'mips64el' 'mipsel')
_tar_arch=('x64' 'x86' 'arm64' 'arm' 'mips64el' 'mipsel')
#declare the array index of the current CARCH
_current_arch_index=$(echo "${arch[@]/${CARCH}/_}" | cut -d_ -f1 | wc -w | tr -d ' ')

# declare source arrays for all supported architectures
_base_tarname="${pkgname%-bin}-v${pkgver//_/-}-linux"
_base_url="${url}/releases/download"
for i in "${!arch[@]}"; do
  declare -g -a "source_${arch[$i]}=(\"${_base_url}/v${pkgver//_/-}/${_base_tarname}-${_tar_arch[$i]}.tar.xz\")"
done

# declare hash sums of each source tar
b2sums_x86_64=('7f1cfc7a306f0e7838385281e17f75fbf4e287c871d03fc3dcb1abb42dc2ae0b6c0cdfae17b3d775a9bd1cd5c41675dd9a031bdb571cf84cc9d4dfa4fb9985d7')
b2sums_i686=('f0787d0628c8ac6decf709bf2058b2815406d50dcaf91a12c2f7acd9d10fb5e5fa6059b89ca7664fa200ecd47f011b84e1501569b1f82e3f208e6cf0deaa37b6')
b2sums_aarch64=('7df66752a5bc1c19ac88f4ad3c74fa6441a79140d16cf9227036c2dd0a10f3b3753efcfb7db766c23ff7bee46ccf4714eb9aea4fdefdccb61548cc90f1647141')
b2sums_armv7h=('15069b7984b51ab49d25b4f48619d44a0044312416b383678ef17173a98d10afb1ca69132a6abaa7e946791daef1bce3f9db6cb5768725f44cdb9cc8d87335e9')
b2sums_mips64el=('7dffcff1425144b31deb3183bb71ca334f2ea6017d7be5ce981a9b9b73627352ceb0e7f5387a719fe38ede5625bdd8492010137c8035143c19222cb5df09b3df')
b2sums_mipsel=('92214c84041a9bdd07032c27229cc0d64f0524867b3abcacae10720fc3ca641af031b47e1534c88027e8ec453dbb56710458f56a3ea19e447a7dc546afce2471')

package(){
  pushd "${srcdir}/${_base_tarname}-${_tar_arch[${_current_arch_index}]}"
  install -Dm755 naive "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 config.json "${pkgdir}/etc/${pkgname%-bin}/config.json"
  install -Dm644 USAGE.txt "${pkgdir}/usr/share/doc/${pkgname%-bin}/USAGE.txt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  popd
}
