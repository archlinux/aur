# Maintainer: detian <dehe_tian@outlook.com>
# Contributor: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Philacorns <opuspace@gmail.com>
# Contributor: wicast <wicastchen at hotmail>

_pkgname=wqy-microhei
pkgname=$_pkgname-patched
pkgver=0.2.0_beta
pkgrel=11
pkgdesc="A Sans-Serif style high quality CJK outline font \
(With kr patch, half-width quota and closer brackets)"
arch=('any')
license=('GPL3' 'APACHE' 'custom:"font embedding exception"')
url="https://wenq.org"
makedepends=('xdelta3')
provides=('wqy-microhei')
conflicts=('wqy-microhei')
source=("https://downloads.sourceforge.net/project/wqy/$_pkgname/${pkgver//_/-}/$_pkgname-${pkgver//_/-}.tar.gz"
        '44-wqy-microhei.conf'
        # https://salsa.debian.org/fonts-team/fonts-wqy-microhei/-/blob/a22dd8e7/debian/wqy-microhei.ttc.xd3
        'wqy-microhei.ttc.xd3')
sha512sums=('c1e09c83f6427f637b3c93c7f89e427bde7fb22cedcfbb806fb036f13a553551f28d985516c7ab4c2602b4159502de36b52e6cc9b41c9b6d6e36778a6de74037'
            'e443a5289b24ab1c405b3f1b5548f18bf1a63c54796e2e072c996680326de333ce2fb8d97aa41dbd5ac2cab99af1105e6c1a0f19313f832aa43ec4d6939f8b9e'
            'f8c106089562647f2f33e8a01c7375e2f66319754aee990f74b8b9af19c010dd49028df66b8fdcfb1a394721e80d953da019046452d74a1ae381384e2ab5d6d4')

build() {
  cd $_pkgname
  tail README.txt --lines=16 | head --lines=-3 >|FONTEXCEPTION
  xdelta3 -df -s wqy-microhei.ttc "$srcdir"/wqy-microhei.ttc.xd3 "$srcdir"/wqy-microhei.patched.ttc
}

package() {
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  install -Dm644 "$srcdir"/44-wqy-microhei.conf "$pkgdir"/usr/share/fontconfig/conf.avail/44-wqy-microhei.conf
  install -Dm644 "$srcdir"/wqy-microhei.patched.ttc "$pkgdir"/usr/share/fonts/wenquanyi/$_pkgname/wqy-microhei.ttc
  install -Dm644 "$srcdir"/$_pkgname/FONTEXCEPTION "$pkgdir"/usr/share/licenses/$_pkgname/FONTEXCEPTION
  ln -s ../conf.avail/44-wqy-microhei.conf "$pkgdir"/usr/share/fontconfig/conf.default/44-wqy-microhei.conf
}
