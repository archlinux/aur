# Maintainer: Oleg Pahl <z3r0.c01n at protonmail.com>

pkgname=veracrypt-git-no-gost
_pkgname=VeraCrypt
pkgver=20200725
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt (No GOST)'
url='https://www.veracrypt.fr/'
arch=('i686' 'x86_64')
license=('custom:TrueCrypt')
depends=('fuse2>=2.8.0' 'wxgtk3>=3.0' 'libsm' 'device-mapper')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
makedepends=('git' 'yasm')
source=("${pkgname%-git}::git+https://github.com/FollowMeDown/VeraCrypt.git"
    no-makeself.patch
    veracrypt.desktop)
sha512sums=('SKIP'
            '40c269859bb97fbcceb443e5f457788bac650271ed118ec79d34f56fc340ad6e613114fe905ec5aba8c4d171c51c9a6865f97e9fa1ba01fa98ef18be4e97bbe1'
            'f689ca64bac7042030de7714aed8cc89f2c5f87b407444b1b121491c1d89c147babaaa454ddc2a93b70ae20d4da59f96ad64f01b04bea9017d658c377faeb75d')
provides=('veracrypt')
conflicts=('veracrypt')

pkgver() {
    cd $srcdir/${pkgname%}
    git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
    cd $srcdir/${pkgname%}/src
    chmod -R u+w . # WAT award
    patch -Np1 < "${srcdir}/no-makeself.patch"
}

build() {
    cd $srcdir/${pkgname%}/src
    make PKG_CONFIG_PATH=/usr/lib/pkgconfig \
         WX_CONFIG=/usr/bin/wx-config-gtk3 \
         TC_EXTRA_LFLAGS+="-ldl ${LDFLAGS}" \
         TC_EXTRA_CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}" \
         TC_EXTRA_CFLAGS="${CFLAGS} ${CPPFLAGS}"
}

package() {
    cd $srcdir/${pkgname%}/src
    install -Dm 755 Main/veracrypt "${pkgdir}/usr/bin/${pkgname%}"
    install -Dm 644 "${srcdir}/veracrypt.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm 644 Resources/Icons/VeraCrypt-256x256.xpm "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
    install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname%}"
}
