# Maintainer: Jesse Bryan <jesse@winneon.moe>
_oldcommit=7c0d24f2f2f3c44aa04c78df55bab5bc7deeb5c4
_newcommit=153e1d4c026c124fbac6ee93e559b5df375f24f5
pkgname=noto-fonts-emoji-marshmallow
pkgver=1.0.0
pkgrel=1
pkgdesc="Google Noto emoji fonts (Android 6.0.1 blob version)"
arch=("any")
license=("custom: SIL Open Font License")
depends=("fontconfig")
makedepends=(
    # Official Repositories:
        "python2" "python2-fonttools" "python2-pillow" "python2-virtualenv" "optipng" "cairo"
        "pango" "pygtk" "imagemagick" "harfbuzz"
    # AUR:
        "python2-booleanoperations" "python2-defcon" "python2-pyclipper" "python2-ufolib"
)
provides=("noto-fonts-emoji")
conflicts=("noto-fonts-emoji")
source=("old.zip"::"https://codeload.github.com/googlei18n/noto-emoji/zip/${_oldcommit}"
        "new.zip"::"https://codeload.github.com/googlei18n/noto-emoji/zip/${_newcommit}"
        "nototools"::"git+https://github.com/googlei18n/nototools.git"
        "Makefile.patch")
sha256sums=("279dd15d00eb8cb5aa45730c6d773b8ca2d9e92ad1977875df0847e8b3e656d4"
            "da62d5c87f80ec41ff83efaa4aca2018fe1fc7d9d3efd718ea63993d75054267"
            "SKIP"
            "bcb5bebfde727ffb605ed4b2403e34fd47c615d31f5c1714f71b39e706c9d3da")

prepare() {
    # Overwrite all Android 7.0+ blobs with 6.0.1 blobs.
    cp -a noto-emoji-${_oldcommit}/png/. noto-emoji-${_newcommit}/png/
    cp -a noto-emoji-${_oldcommit}/svg/. noto-emoji-${_newcommit}/svg/
    cp -a noto-emoji-${_oldcommit}/third_party/region-flags/png/. noto-emoji-${_newcommit}/third_party/region-flags/png/
    cp -a noto-emoji-${_oldcommit}/third_party/region-flags/svg/. noto-emoji-${_newcommit}/third_party/region-flags/svg/
    cp -a noto-emoji-${_oldcommit}/waveflag.c noto-emoji-${_newcommit}/waveflag.c

    cd "noto-emoji-${_newcommit}/"

    # Fix duplicate emoji issues.
    mv "png/128/emoji_u1f469_200d_2764_fe0f_200d_1f469.png" "png/128/emoji_u1f469_200d_2764_200d_1f469.png"
    mv "png/128/emoji_u1f469_200d_2764_fe0f_200d_1f48b_200d_1f469.png" "png/128/emoji_u1f469_200d_2764_200d_1f48b_200d_1f469.png"
    mv "png/128/emoji_u1f468_200d_2764_fe0f_200d_1f468.png" "png/128/emoji_u1f468_200d_2764_200d_1f468.png"
    mv "png/128/emoji_u1f468_200d_2764_fe0f_200d_1f48b_200d_1f468.png" "png/128/emoji_u1f468_200d_2764_200d_1f48b_200d_1f468.png"

    # Patch Makefile to work with older build files.
    patch -p1 -i "${srcdir}/Makefile.patch"
}

build() {
    # Start a python2 virtual environment because python calls are hardcoded in nototools/noto-emoji.
    virtualenv2 "temp/"
    . "temp/bin/activate"

    # Install a temporary instance of nototools.
    cd "${srcdir}/nototools/"
    python setup.py install

    # The build process can take up to 30 minutes dependent on how many threads your CPU has.
    cd "${srcdir}/noto-emoji-${_newcommit}/"
    make flag-symlinks
    make ZOPFLIPNG= -j$(nproc)
}

package() {
    cd "${srcdir}/noto-emoji-${_newcommit}/"

    # Install fonts to the appropriate directory.
    mkdir -p "${pkgdir}/usr/share/fonts/noto/"
    install -m644 NotoColorEmoji.ttf "${pkgdir}/usr/share/fonts/noto/"
    install -m644 fonts/NotoEmoji-Regular.ttf "${pkgdir}/usr/share/fonts/noto/"

    # Install the SIL Open Font License.
    install -Dm644 fonts/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
