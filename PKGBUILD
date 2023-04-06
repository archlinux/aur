# Maintainer: David Runge <dvzrv@archlinux.org>

_name=slimit
pkgname=slimit
pkgver=0.8.1
pkgrel=9
pkgdesc="A JavaScript minifier/parser in Python"
arch=('any')
url="https://github.com/rspivak/slimit"
license=('MIT')
depends=('python-ply')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
# license not in pypi sdist
# python3 not properly supported in 0.8.1
# https://github.com/rspivak/slimit/issues/107
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rspivak/${pkgname}/archive/${pkgver}.tar.gz"
        "0001-Make-tests-work-with-nose-test-runner.patch"
        "0002-Preferred-way-for-bootstrapping-now-is-to-use-virtua.patch"
        "0003-Add-tests-for-https-github.com-rspivak-slimit-issues.patch"
        "0004-Convert-readthedocs-links-for-their-.org-.io-migrati.patch"
        "0005-fix-the-identifier-regular-expression-by-coalescing-.patch"
        "0006-Update-classifiers.patch"
        "0007-Remove-outdated-link-to-slimit.org.patch"
        "0008-Python-3-compatibility-102.patch")
sha512sums=('ce33dd15c755b8327a73121322b525738b5f8d83c08b0b6329fa6e090575c68883b4bfa29df04544e5f566f3a81a60e480b5e760e2b0e67644a7db5e25604cc0'
            'd876b8ccb1da04d24ddf65407bf082f879d366c9af806db604e7844806d8f3860aaaee25908a5772de1744e5354aa7f48df77d02f095ccce1f7c60d60e32597c'
            '462f49f9e6bd8e813f19b3aa00691a353ba1c3c6d7ffbd06729ef30d87569e9a29eec52f06dc244ea6d45b20454ace6f55457a28fa01d8596553f03ddf6f502e'
            '87c0c8ff4bbbd899e76b61c1120ec2b2d05ae5d00171f0da921e8059f70ccd47e230d27acc7241919440605cfeb1bc22c3fdbb3f2a63bbd6a4f9474775949797'
            'e5ad5bd899146483881037386286decdb0f670b5905091ce91b7c4c4ed084afe79d979e3ca1e6b943dd4c6933b25b61abebe70cc79423b0e441307daceb84395'
            '8965bb75d447c7c3ee499978f10c88a5d48d148a2cdeb4ce5a7b7283b45f15ea3b50640947219c549310e55b388d01c713359065b1ba9dc259d9e400e730a23d'
            'f92c88b4d6477e73e432250ab2d87cc50f1e148fdb86b79b4d980ca46baecf4a1721e26188d5bf8c15896702e96af258271d296d7af96f7cbad9417750239563'
            '0f3f9b8511624de02f0c5287ee4e1e07583743ee539e8e5de04b3710d56ce977eb8916e9dfed364fbbf346c3e87b7ffc5f45e107931251a5faff62575d3d9761'
            'c28f91ddfbb727baea61d60277e9160be2512178378dd8d27e6cf014ad565bc0fee5cefad0959b80005a6719cfabd397e6a45385b3169c9e648c4b050d14187c')
b2sums=('9bf7a00fa7aa48a47950b2db66868c03e3923ed7b878ac4d93bd92becc1909cb79a15365db8185f6d8872028e0d01343394e4c768149155bc6aaeb4acf69954f'
        '68fe765ec54260429d761c057a88d7f82f1f5a2c34d107e814f6925e7b6fb1d6b17663fc4909a66109657627ffbba30c186881f6145281e9da7b3089ee8fec14'
        '9560933642368c980d71bb0b0492f793b1e80afee0f477cf011c1e1d4590fa5a072e21a3b4dd9d21d2c0056230b713e2095d2f86ea41451827fe229e499c5c42'
        '5cf5bea50166938c1143552040f960e1f6f79a65ccfcb4b36052978b1e099a6c7fd4dba7dbcfb7e44637c4920b31c53fe20fee3f01c6e1656325e7ec49775cf0'
        '7be1b91a8e14f02414e701730651665cfb6876ebd9040eb29ae76e20a2634a7ec4ccb93879a556714a1ba1a6c2553366b0aab32ab4ecbe8b64484ac3557f374a'
        '8195b353601428dc2c8a443e6fb749891943f9168fc4b1a5e32e043fccdfbfaf083c0c7b862d1d5485de4da3359e626e90633d5735dbfa8dd640b5af099e64aa'
        '3d590b0aa26a5205cdc225e58aabe6656494fb1a9d04aefa95740734eda11aa0f95559bd4fd7c83516be7c6cae1f5889f1f33435b895a02cfd66166d366ad3fd'
        '832b69d8adb8828be392847b5dd090126c134b1204e263c2cc217455622924be3352b0d7986f7fec845bbc5f2c304e037a760316e57e4d6b9c4b75879840f451'
        '4e40dd6555b8706793844ef8604c1fc019bf0048d814abfcff639b44f12d5149fc93c6847900d3f3d3c7c1d53b76767e0331245c5ce2ce5a6c924f7a4c8489da')

prepare() {
  cd "$pkgname-$pkgver"
  for patch_file in ../*.patch; do
    patch -Np1 -i "${patch_file}"
  done
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {CHANGES,README.rst} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
