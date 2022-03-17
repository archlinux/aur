# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=dosbox-openglide-svn
pkgver=0.74.3.r4473
pkgrel=1
pkgdesc='DOS emulator for running DOS games (with openglide 3D, svn version)'
arch=('x86_64')
url='https://www.dosbox.com/'
license=('GPL')
depends=('sdl_net' 'zlib' 'sdl_sound' 'libgl' 'libpng' 'alsa-lib' 'gcc-libs' 'glu'
         'openglide-git')
makedepends=('subversion' 'mesa-libgl')
provides=('dosbox' 'dosbox-openglide' 'dosbox-svn')
conflicts=('dosbox')
source=('dosbox'::'svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk'
        'https://raw.githubusercontent.com/voyageur/openglide/c300160d0a8292bc04e79dd59e6cc178aa648dec/platform/dosbox/glide2x.ovl'
        'dosbox.desktop'
        'dosbox.png'
        '010-dosbox-add-openglide-support.patch')
sha256sums=('SKIP'
            'ed391bb9fb0e7b5d33b92882356f02b05913361675712d93b4ef303d5b9f2ac9'
            '680c8543cb0329000a36c188bb95999c6fae159d3704a4496b54cfada360c7e5'
            '491c42d16fc5ef7ee2eca1b736f7801249d4ca8c0b236a001aec0d3e24504f3b'
            '396f9cfbfe0880517bc93b97ff6d90e9878f72f3ff5695d45123fd9aa7555ea1')

prepare() {
    cd dosbox
    
    # add openglide support
    svn revert -R .
    rm -f {include/{glide,glidedef}.h,src/hardware/glide.cpp}
    patch -Np1 -i "${srcdir}/010-dosbox-add-openglide-support.patch"
    
    ./autogen.sh
}

pkgver() {
    printf '%s.r%s' "$(head -n1 dosbox/NEWS | sed 's/-/./g')" \
                    "$(svnversion dosbox | tr -d 'A-z')"
}

build() {
    cd dosbox
    ./configure --prefix='/usr' --sysconfdir='/etc/dosbox'
    make
}

package() {
    make -C dosbox DESTDIR="$pkgdir" install
    
    # glide2x.ovl
    install -D -m644 glide2x.ovl -t "${pkgdir}/usr/share/dosbox"
    
    # desktop file and icon
    install -D -m644 dosbox.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 dosbox.png     -t "${pkgdir}/usr/share/pixmaps"
    
    # docs
    install -D -m644 dosbox/README            -t "${pkgdir}/usr/share/doc/dosbox"
    install -D -m644 dosbox/docs/README.video -t "${pkgdir}/usr/share/doc/dosbox"
}
