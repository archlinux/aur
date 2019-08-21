# Maintainer: Philip Deljanov <philip dot deljanov at gmail dot com>
# Contributor: bohoomil <bohoomil at zoho dot com>

pkgbase=freetype2-infinality-remix
pkgname=(freetype2-infinality-remix freetype2-demos-infinality-remix)
pkgver=2.10.1
pkgrel=1
_patchrel=2019.08.21
pkgdesc="TrueType font rendering library with Infinality Remix patches"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"

# Adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
makedepends=('libx11' 'libpng' 'harfbuzz')

install=freetype2.install

source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz{,.sig}
        https://download-mirror.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.xz{,.sig}
        https://download-mirror.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.xz{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-infinality-${pkgver}-${_patchrel}.patch
        0004-Enable-long-PCF-family-names.patch
        0005-freetype-2.5.2-more-demos.patch
        0006-infinality-remix-tweaks.patch
        freetype2.sh
        infinality-settings.sh
        xft-settings.sh)

sha256sums=('16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f'
            'SKIP'
            '2fc160eda64cb6ee9f357c3fd6ef5f1f2b6039f10da650c726b0db49f863341f'
            'SKIP'
            'b1857376bd3eaad4fdb4bc7894cb557310186856099494f32e8998ddc32b41e8'
            'SKIP'
            'ac11a24b62a6c044cc245ea9fa2a0cbd9e2e62f2371873dd33084c28a76e7176'
            'afdc909def9d7e839f227a83a4e3b58d4060a28861739f9e1ab5540e60929cc8'
            '54800d4da18611cf9232aad8b63d74a83153a51bb56dd39191678c738ffc8b53'
            '36484db4b926ed026e7f32570573493b5a9793a129f08d54383a26d65a6af89b'
            '94493ed2865fd32e5ef8ef3493fcb2ccaaf8be4c9e0eaa7b417fcbc47fe4314d'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467'
            '1a5c12aa96e2ee66f7316b8ccb7012520b231a2d8ee21cfe4064aa28db35a57c'
            '4842d1461c240cd0f60a7247ee038271fdb1067107bea9024be6bdbb218d1bd4')

validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
    mv freetype-${pkgver} freetype2
    mv ft2demos-${pkgver} freetype2-demos

    # Patching FreeType
    cd freetype2
    patch -Np1 -i ../0001-Enable-table-validation-modules.patch
    patch -Np1 --verbose -i ../0002-infinality-${pkgver}-${_patchrel}.patch
    patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
    patch -Np1 --verbose -i ../0006-infinality-remix-tweaks.patch


    # Patching FreeType Demos
    cd ../freetype2-demos
    patch -Np1 -i ../0005-freetype-2.5.2-more-demos.patch

    # Suppress RPATH
    sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

build() {
    # Build FreeType
    cd freetype2
    ./configure --prefix=/usr --disable-static --with-harfbuzz --with-png
    make

    # Build FreeType demos
    cd ../freetype2-demos
    make
}

check() {
    cd freetype2
    make -k check
}

package_freetype2-infinality-remix() {
    groups=('infinality-remix')
    depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
    provides=("freetype2=$pkgver" 'freetype2-infinality' 'libfreetype.so')
    conflicts=('freetype2' 'freetype2-infinality' 'freetype2-infinality-ultimate')

    cd freetype2
    make DESTDIR="${pkgdir}" install
    # Disables changes to FREETYPE_PROPERTIES globally.
    install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"
    # Configures generic Xft hinting globally.
    install -Dm755 ../xft-settings.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/xft-settings.sh"
    # Configures global default Infinality settings.
    install -Dm755 ../infinality-settings.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/infinality-settings.sh"
}

package_freetype2-demos-infinality-remix() {
    pkgdesc="Freetype tools and demos"
    depends=('freetype2' 'libx11')
    conflicts=('freetype2-demos' 'freetype2-demos-git' 'freetype2-demos-infinality' 'freetype2-infinality-ultimate')

    cd freetype2-demos
    install -d "${pkgdir}/usr/bin"
    for _i in bin/{f,t}t*; do
        libtool --mode=install install $_i "${pkgdir}/usr/bin"
    done
}
