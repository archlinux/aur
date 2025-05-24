# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_depends=("anyzig" "zigup")
_provides="zig"
_pkgvers=(0.2.0 0.3.0 0.4.0 0.5.0 0.6.0 0.7.1 0.8.1 0.9.0 0.10.1 0.11.0 0.12.1
          0.13.0) # 0.1.1

pkgbase="fakezig-${_provides}"
pkgname=("${_depends[@]/%/-zig}" "zigup-${_provides}-dev")
for _dep in "${_depends[@]}"; do
  for _ver in "${_pkgvers[@]}"; do
    pkgname+=("${_dep}-${_provides}${_ver%.*}")
  done
done
pkgver=0.14.0
pkgrel=1
pkgdesc="A wrapper script for anyzig or zigup to provide ${_provides}"
arch=('any')
# url=""
license=('custom:None')
depends=('sh')
source=("${_depends[@]/%/-zig.sh}")
sha256sums=('060ce466e6367f49cc0e46a0a0e78600ae34d2327e0ef2ac9824576d07ec469b'
            '082ba0702f77689f29a213bce7b7c9d91491c36cc9eebfdbf715cc4089d694e0')

for _dep in "${_depends[@]}"; do
  eval "
package_${_dep}-${_provides}() {
  pkgdesc='A wrapper script for ${_dep} to provide ${_provides} (latest stable release)'
  depends=('${_dep}')
  provides=('${_provides}=${pkgver}')
  conflicts=('${_provides}')

  install -vDm755 '${_dep}-${_provides}.sh' \"\${pkgdir}/usr/bin/${_provides}\"
  sed -i 's/@VERSION@/${pkgver}/g' \"\${pkgdir}/usr/bin/${_provides}\"
}"

  for _ver in "${_pkgvers[@]}"; do
    _provides_ver="${_provides}${_ver%.*}"

    eval "
package_${_dep}-${_provides}${_ver%.*}() {
  pkgdesc='A wrapper script for ${_dep} to provide ${_provides} (${_ver})'
  depends=('${_dep}')
  provides=('${_provides_ver}=${_ver}')
  conflicts=('${_provides_ver}')

  install -vDm755 '${_dep}-${_provides}.sh' \"\${pkgdir}/usr/bin/${_provides_ver}\"
  sed -i 's/@VERSION@/${_ver}/g' \"\${pkgdir}/usr/bin/${_provides_ver}\"
}"
  done
done

package_zigup-zig-dev() {
  pkgdesc="A wrapper script for zigup to provide ${_provides} (latest dev release)"
  depends=('zigup')
  provides=("${_provides}-dev")
  conflicts=("${_provides}-dev")

  install -vDm755 "zigup-${_provides}.sh" "${pkgdir}/usr/bin/${_provides}-dev"
  sed -i 's/@VERSION@/master/g' "${pkgdir}/usr/bin/${_provides}-dev"
}
