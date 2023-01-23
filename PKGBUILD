pkgname='ecode'
pkgver='0.4.2'
pkgrel=1
pkgdesc='lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance.'
arch=('x86_64')
url='https://github.com/SpartanJ/eepp'
license=('MIT')
depends=('sdl2' 'openal')
makedepends=('premake')

build() {
    git clone --recurse-submodules https://github.com/SpartanJ/eepp.git
    cd eepp
    git checkout ecode-$pkgver
    premake5 gmake2
    config=release_x86_64 make -j$((`nproc`+1)) -C make/linux
}

package() {
    install -Dm755 "${srcdir}/eepp/bin/ecode" "$pkgdir/opt/ecode/bin/ecode"
    install -Dm644 "${srcdir}/eepp/libs/linux/libeepp.so" "$pkgdir/opt/ecode/libs/linux/libeepp.so"

    install -d "${pkgdir}/opt/ecode/bin/assets"
    cp -r ${srcdir}/eepp/bin/assets/* "${pkgdir}/opt/ecode/bin/assets"
    find "${pkgdir}/opt/ecode/bin/assets" -type f -exec chmod 644 -- {} +

    install -Dm644 ${srcdir}/../ecode.desktop "$pkgdir/usr/share/applications/ecode.desktop"
    install -Dm644 "${srcdir}/eepp/LICENSE" "$pkgdir/opt/ecode/LICENSE"
}
