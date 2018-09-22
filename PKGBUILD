# Maintainer: Kozec <kozec at kozec dot com>

pkgname='mcedit-git'
reponame='MCEdit-Unified'
pkgver='201800909'
pkgrel=2
pkgdesc='Minecraft world editor'
arch=('any')
url='https://www.mcedit-unified.net/'
license=('BSD')

makedepends=('cython2' 'git')
depends=('python2' 'python2-opengl' 'python2-numpy' 'python2-pygame'
        'python2-yaml' 'python2-pillow' 'python2-ftputil' 'python2-xlib' 'xclip')
conflicts=('mcedit' 'pymclevel')

source=(MCEdit MCEdit.desktop
    directories.patch
    setup_leveldb.patch
    git+https://github.com/Podshot/$reponame.git
    )

prepare() {
    cd ${srcdir}/${reponame}
    grep -rlZ DejaVuSans\-Regular\.ttf * | while IFS= read -r -d '' filename; do sed -i 's/DejaVuSans\-Regular\.ttf/DejaVuSans\.ttf/g' "$filename"; done
    msg setup_leveldb.patch
    patch -Np0 -i ../setup_leveldb.patch || return 1
    msg directories.patch
    patch -Np0 -i ../directories.patch || return 1
}


build() {
    cd ${srcdir}/${reponame}
    python2 setup.py all
    cd pymclevel
    python2 setup_leveldb.py
}


package() {
    cd ${srcdir}/${reponame}
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/mcedit"
    mkdir -p "${pkgdir}/usr/share/mcedit"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    # Pys
    cp *.py "${pkgdir}/usr/lib/mcedit"
    cp *.pyc "${pkgdir}/usr/lib/mcedit"
    cp cpngfilters* "${pkgdir}/usr/lib/mcedit"
    for i in albow editortools pymclevel utilities panels viewports leveldb_mcpe; do
        cp -R $i "${pkgdir}/usr/lib/mcedit/$i"
    done

    # Images and stuff
    cp *.png "${pkgdir}/usr/share/mcedit"
    for i in stock-schematics toolicons stock-filters stock-brushes lang\
    item-textures Items splashes bo3.def RELEASE-VERSION.json\
    LR5_mzu.fot mcver; do
        cp -R $i "${pkgdir}/usr/share/mcedit/$i"
    done
    ln -s "/usr/share/mcedit/favicon.png" "${pkgdir}/usr/share/pixmaps/MCEdit.png"

    # Launcher
    install -D -m755 "${srcdir}/MCEdit" "${pkgdir}/usr/bin/"
    install -D "${srcdir}/MCEdit.desktop" "${pkgdir}/usr/share/applications"
}

md5sums=('b08f609c8923067b13a9bd462999a6f4'
        '53fe3c41d58fd1f6429f90ba0b1831ac'
        '91f520357b56b83e96073c385aa4e19e'
        '7eee6c02f60a7ff1c7d245624b75bace'
        'SKIP')
