# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# _releases=(R2020b R2021a R2021b R2022a R2022b R2023a R2023b R2024a R2024b
_releases=(R2025a)

_name="batch"
pkgbase="matlab-${_name}"
pkgname=("matlab-common-${_name}" "${pkgbase}")
for rel in "${_releases[@]}"; do
  pkgname+=("matlab-${rel,,}-${_name}")
done
pkgver=2025.03.1
pkgrel=6
pkgdesc="CLI tool that starts MATLAB non-interactively using a batch licensing token and any MATLAB startup options"
arch=('x86_64')
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
url="${_url}/blob/main/alternates/non-interactive/MATLAB-BATCH.md"
license=('custom:MATLAB EULA')
_pkgsrc="${pkgbase}" # -${pkgver}
source=("${_pkgsrc}-README.md::${_url}/raw/refs/heads/main/alternates/non-interactive/MATLAB-BATCH.md"
        "${pkgbase}.sh")
source_x86_64=("${_pkgsrc}-x86_64::https://ssd.mathworks.com/supportfiles/ci/${pkgbase}/v1/glnxa64/${pkgbase}")
sha256sums=('SKIP'
            '3d51b3c8d17af0adcb1f6289646396da9161a49ea75896ff4ad05d68d82454a9')
sha256sums_x86_64=('SKIP')

prepare() {
  cd "${srcdir}"
  chmod +x ./"${_pkgsrc}-${CARCH}"
}

pkgver() {
  cd "${srcdir}"
  ./"${_pkgsrc}-${CARCH}" -version | 
    sed -n 's/^matlab-batch \([0-9.]\+\) .*/\1/p'
}

build() {
  cd "${srcdir}"
  ./"${_pkgsrc}-${CARCH}" -displayLicenseAgreement > "LICENSE"
}

package_matlab-common-batch() {
  pkgdesc+=" (common files)"

  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/lib/${pkgbase}/${pkgbase}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"              "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_matlab-batch() {
  arch=('any')
  depends=('matlab' "matlab-common-${_name}=${pkgver}-${pkgrel}" "matlab-release>=${_releases[-1]}") # "matlab-release=${_releases[-1]}"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

for rel in "${_releases[@]}"; do
  eval "
package_matlab-${rel,,}-${_name}() {
  pkgdesc+=' (${rel})'
  arch=('any')
  depends=('matlab-release=${rel}' 'matlab-common-${_name}=${pkgver}-${pkgrel}' 'sh')
  provides=('${pkgbase}-release=${rel}')

  install -vd \"\${pkgdir}/usr/lib/${pkgbase}/${rel}\"
  ln -vsf '/usr/bin/matlab-${rel}' \"\${pkgdir}/usr/lib/${pkgbase}/${rel}/matlab\"

  install -vDm755 '${pkgbase}.sh' \"\${pkgdir}/usr/bin/matlab-${rel}-${_name}\"
  sed -i 's/@@RELEASE@@/${rel}/g' \"\${pkgdir}/usr/bin/matlab-${rel}-${_name}\"
}"
done
