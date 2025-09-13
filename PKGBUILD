# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slsa-verifier"
pkgname="${_pkgname}-bin"
pkgver=2.7.1
pkgrel=3
pkgdesc="Verify provenance from SLSA compliant builders"
arch=('aarch64' 'x86_64')
url="https://github.com/slsa-framework/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64"
                "${_pkgsrc}-aarch64.intoto.jsonl::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.intoto.jsonl")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
               "${_pkgsrc}-x86_64.intoto.jsonl::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.intoto.jsonl")
sha256sums=('687e15e6a5490c4eeca451e87f5505e99fe6374f290c26a5f11c252f21d89a21'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_aarch64=('5d3b2349ede7bfec19e7a21569f18b9f7410145ad12e9584b175370669e14061'
                    '84592ff469d958aa0738152ca5253f4a1da2bb3a4748446f282bee376276e9d7')
sha256sums_x86_64=('946dbec729094195e88ef78e1734324a27869f03e2c6bd2f61cbc06bd5350339'
                   'b567f5ed9a08d0cbddffc169c4ad2d4101abc6b29f9a4c81893a801e432df1f4')
b2sums=('c39e35bdddaff0fc0cbc1852ea8b370441c00451996199755a6847c135a6d62f7ee81f8b9a9add8e709a9372e5a762ca04f373bbd59d77b5513cea88580c2e64'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85')
b2sums_aarch64=('10d98e8996a80888b05ba84958966afbd0f29ae5f874d885c7775312a325bdd00a373584df94e6686eb11cb81c4bafe392b150bf975b16ae651b48e53909ea21'
                '8c4fbcda153e8bd7d9fd5fcb661f3ba9dcb42ad1d8a5e6d0d58fa5f3507b21cd2deb19ebd13ac58e93fae2806c3c81247abb3a68340bf989633475ba2128cb6b')
b2sums_x86_64=('b538e5a54c3fddeb5c8b3b5ebbfeab7a59bcf60c1b1bcf2289378f4c4dbefb7df6cd5a8d6c603e1ef0134c922f7ea964ac0878e3f984b0980bae54ca6518a80e'
               'b03d3b65cf63f43ef2657233dd12760d8c380b21bd76cc9e005260aecdd2813b0d971474713d8c67e136550e01375f22622a100387758402ec956fa0b083248f')

verify() {
  _slsa_verifier_bin="${_pkgname}"
  if ! which "${_pkgname}" >/dev/null 2>&1; then
    echo "  -> WARNING: Using the downloaded artifact as its own checker!"
    _slsa_verifier_bin="./${_pkgsrc}-${CARCH}"
    chmod +x "${_slsa_verifier_bin}"
  fi

  "${_slsa_verifier_bin}" verify-artifact "${_pkgsrc}-${CARCH}" \
    --provenance-path "${_pkgsrc}-${CARCH}.intoto.jsonl" \
    --source-uri "${url#https://}" \
    --source-tag "v${pkgver}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
