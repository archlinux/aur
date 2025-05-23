# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_depends="anyzig"
_provides="zig"
_pkgvers=(0.2.0 0.3.0 0.4.0 0.5.0 0.6.0 0.7.1 0.8.1 0.9.0 0.10.1 0.11.0 0.12.1
          0.13.0) # 0.1.1

pkgbase="${_depends}-${_provides}"
pkgname=("${pkgbase}")
for _ver in "${_pkgvers[@]}"; do
  pkgname+=("${pkgbase}${_ver%.*}")
done
pkgver=0.14.0
pkgrel=2
pkgdesc="A wrapper script for ${_depends} to provide ${_provides}"
arch=('any')
url="https://github.com/marler8997/${_depends}"
license=('custom:None')
depends=("${_depends}" 'sh')
source=("${pkgbase}.sh")
sha256sums=('277996c96eb1dfee4ee63e8d54b008c2e843918b07a8d1f9ab77fb78539631d3')

package_anyzig-zig() {
  pkgdesc+=" (latest stable release)"
  provides=("${_provides}=${pkgver}")
  conflicts=("${_provides}")

  install -vDm755 "${pkgbase}.sh"  "${pkgdir}/usr/bin/${_provides}"
  sed -i "s/@VERSION@/${pkgver}/g" "${pkgdir}/usr/bin/${_provides}"
}

for _ver in "${_pkgvers[@]}"; do
  _provides_ver="${_provides}${_ver%.*}"

  eval "
package_${pkgbase}${_ver%.*}() {
  pkgdesc+=\" (${_ver})\"
  provides=(\"${_provides_ver}=${_ver}\")
  conflicts=(\"${_provides_ver}\")

  install -vDm755 '${pkgbase}.sh' \"\${pkgdir}/usr/bin/${_provides_ver}\"
  sed -i 's/@VERSION@/${_ver}/g'  \"\${pkgdir}/usr/bin/${_provides_ver}\"
}"
done
