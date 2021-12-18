# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.6.1
pkgrel=5
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL3)
depends=(ffmpeg libopenshot libopenshot-audio python-pyqt5 python-pyzmq
python-requests qt5-base qt5-svg qt5-webkit)
makedepends=(python-setuptools)
optdepends=('faac: for exporting audio using AAC')
source=(
  https://github.com/OpenShot/openshot-qt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
  "${pkgname}-2.6.1-video_widget.patch::https://github.com/OpenShot/openshot-qt/commit/9748a13268d66a5949aebc970637b5903756d018.patch"
  "${pkgname}-2.6.1-python3.10_int.patch::https://github.com/OpenShot/openshot-qt/commit/fff785eb1e3e0c30ed6ca57e2d1933aaa807ae22.patch"
  "${pkgname}-2.6.1-no_metric_default.patch"
)
sha512sums=('9e2d1eae5d72ec2deab914e464dac0d84a864ba2ca63104fad57c90fc907764d5683149fb8136d50030cae993cef9a977e995b0783868988de4668e71a3a5ee2'
            'e7a70fde0195a961cc1aa0d69fa24ef50d1cd77de2ee6eabbe3992c3182fc3f8be4b26c02323df4d3d86da3d020258ab7affcb6efda290c6e4c0d169a560dfb9'
            'b13e1cfb2c672896f90f06407398a6739214fa126f4b6feb1e9697bea89126439048ed05881fd564982ba2d5c6b9d56799831c579c9f86b950c471bdb4bc884b'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('b3a163983bdb811103e5d9307beeb38938719747f743dd58520a0166c08eb11f4592d47bf24224062f9db323a66a2f353eb22f087982b929d60a519cd2c40789'
        '8b37dc0dc5bb355a7cd38d0e3431b9de18e26c8d194c208e73615835ee41f0a9558a5424ec836362a748958af9e8fc85eb7e441f21795b71efba6ced641fe8a2'
        '5e7dfae0611346f270ce5c8d9d1c86884f5a90f544cad8261136aee4a2a6668440c2d017d84c2081bf8e37f18458d7a9d2f9530aaf6fc0392c83f7eb185b1aad'
        '6f75f37be8d3e03090a8ca53e645b3269f92c7f44aa39cfbe1a03266a36d508d5c18eebbb5792ed9d6d031b3694902bc3fa3a2dac745aad60b2bc331657a364a')

prepare() {
  cd ${pkgname}-qt-${pkgver}
  # fix python 3.10 related issues
  # https://bugs.archlinux.org/task/73076
  patch -Np1 -i ../"${pkgname}-2.6.1-video_widget.patch"
  patch -Np1 -i ../"${pkgname}-2.6.1-python3.10_int.patch"
  # disable default metric collection with google analytics
  patch -Np1 -i ../"${pkgname}-2.6.1-no_metric_default.patch"
}

build() {
  cd ${pkgname}-qt-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-qt-${pkgver}
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} -t "${pkgdir}"/usr/share/doc/${pkgname}
}
