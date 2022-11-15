# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=acc
pkgver=1.59
pkgrel=1
pkgdesc='ACS script compiler for use with ZDoom and/or Hexen'
arch=('i686' 'x86_64')
url='https://github.com/rheit/acc'
license=('custom:EULA')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/ZDoom/acc/archive/refs/tags/${pkgver}.tar.gz"
        'http://www.doomworld.com/eternity/activision_eula.txt')
sha256sums=('6f58e6683e0de94ca53fd6a2120e5ee446bf54d8d1c6eb1a56c1a4abfce071e0'
            'd1dd96235e883c638e202715039946fac58f2979e1f11cb2bbe2a24eefb5fe9a')

prepare() {
    cd acc-${pkgver}
    sed -ri "s|/usr/local/share/acc|/usr/share/acc|" acc.c
}

build() {
    cd acc-${pkgver}
    mkdir -p build
    cmake -B build -D CMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd acc-${pkgver}
    install -d "$pkgdir"/usr/bin/ \
               "$pkgdir"/usr/share/acc/ \
               "$pkgdir"/usr/share/licenses/$pkgname/

    install build/acc "$pkgdir"/usr/bin/

    install -m644 zcommon.acs "$pkgdir"/usr/share/acc/
    install -m644 zdefs.acs "$pkgdir"/usr/share/acc/
    install -m644 zspecial.acs "$pkgdir"/usr/share/acc/
    install -m644 zwvars.acs "$pkgdir"/usr/share/acc/

    install -m644 "$srcdir"/activision_eula.txt \
                  "$pkgdir"/usr/share/licenses/$pkgname/
}
