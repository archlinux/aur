# Maintainer: Daniil Gentili <daniil@daniil.it>

_pkgname=BlendNet
pkgname=blendnet
pkgdesc="Distribute your Blender renders (with CUDA CPU+GPU support!)"
pkgver=0.3.9
pkgrel=2
arch=('any')
license=('Apache')
depends=('blender')

source=(
  "https://github.com/state-of-the-art/$pkgname/archive/refs/tags/v${pkgver}.tar.gz"
  "agent.json"
  "${pkgname}-validate"
  "${pkgname}-agent.service"
  "${pkgname}-manager.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
  "${pkgname}.install"
  "blender-v3.patch"
  "cuda.patch"
  "manager.json"
)
sha512sums=('0cbe17f60a34d72408e83d065ba35849e6faf31a3243c8d9d43a45e99800625e64032402a78a64901c3e8678c8c0714193168ff2cf4a88d1efa3607136406c56'
            '27129424d46a54ee86bf4d614600cfe6cb302ebce8dd54625d7cb0a443c65696d6629e93d943ec686705211dece022e852cd949600e6618d1c532f6b607b92a4'
            '3b042688735bbd1aa883605030fbfa490ddb139ba00f1cfad716f24c29de437763a5529a240192e16137752be5fc57bffb19b7d615fcf34ec599bec6a9bdb682'
            '5c4b3e850c67ea3198fb2c855141df44e35ea431371e1a6d0367bd8b365575c75bb797558254ea20c86ef6ed2a9bf56bea9d8006ad154c95e266b690b6e7f934'
            '33cb682c3441caa3ba38f7b5417a404ed46382419fe2d1e0bcd67a68304768cb29030a5ba479b6b0f08396b646dc4be4c37b1708bc740b014c87e5867f45d6f3'
            '20e7efd2156bf61272b36d4b3bd1c1a53632f7c6c9500c3b5bf4afb557b55cba118bceab35a51f7257ba12d7a7c0db2cda0dc32e66e0d8c27d904ce4fca5ccbf'
            'e4943047b1e3e22ab77f7d464ffaef70c4864adc5e17583daf5932282334fe1d329d0f8b6bf0ba95ba3c97c3e867f7c921648e1200c6935a2b4c9ca7c9c0a0aa'
            '0d8c078dfc80739aa2401a537646fe529fdaf3401785ef6776beedebcd67201c6d9c58772036fb065ffa3c08ed9f50ce084ab999a866572c1f35d926f29a4cde'
            'dedcc94ea5d4a5cfaad600c8111f93650f87d53f622a2bdfa43af6f2eae7a6ed6a1628856e02587509a5b252624ee139539d4040e2b3d1de64b618aebd7cc9a3'
            'd045be0b99899a0b4ad955ace2f4242522d051acd47e570cef2059f5449c2c9e15b70f4076f0145c545ddea2c4b0a22731f6e61c907f08ccacc4266f888147d2'
            '946bd9bfb21ccd3e8cbbfff4a26aa5533046c32683a1689611f774ca8f23ac1428de095b68c3814a6c54e9adee9c89300ca7b2680392a323ebbc8fd3026739d3')

install="${pkgname}.install"

backup=(
  etc/${pkgname}/agent.json
  etc/${pkgname}/manager.json
)

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/blender-v3.patch
  patch -Np1 -i ${srcdir}/cuda.patch
}

package() {
  _blender=$(blender -v | head -n1 | cut -f2 -d ' ' | sed 's/\.0$//')
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${pkgname}
  cp -a -t ${addons}/${pkgname} ${_pkgname}-${pkgver}/*
  install -Dm755 ${pkgname}-validate -t ${addons}/${pkgname}/

  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 ${pkgname}-manager.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${pkgname}-agent.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 manager.json "${pkgdir}"/etc/${pkgname}/manager.json
  install -Dm644 agent.json "${pkgdir}"/etc/${pkgname}/agent.json
}
