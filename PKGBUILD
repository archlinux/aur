# Maintainer: Jeanbon 
# Contributor: tritonas00 <tritonas00@gmail.com>

_pkgname=rigsofrods
_gitname=rigs-of-rods

pkgname=$_pkgname-git
pkgver=0.4.7.0.r95.g5cf716d5
pkgrel=1
pkgdesc="An open source vehicle simulator based on soft-body physics"
arch=('i686' 'x86_64')
url="http://rigsofrods.org"
license=('GPL')
depends=('openal' 'wxgtk' 'ogre-1.8' 'caelum-ogre1.8' 'mygui-ogre1.8' 'ogre-1.8-pagedgeometry' 'socketw' 'angelscript-2.22.1' 'jsoncpp')
optdepends=('sh: for being able to run the commands rigsofrods and rigsofrods-config instead of /opt/rigsofrods/RoR and /opt/rigsofrods/RoRConfig')
makedepends=('cmake' 'git')
conflicts=('rigsofrods' 'rigsofrods-hg' 'rigsofrods-noangelscript-git')
provides=('rigsofrods')
source=("git+https://github.com/RigsOfRods/$_gitname.git"
        "plugins.cfg"
        "rigsofrods.png"
        "RoRConfig.desktop"
        "RoR.desktop"
        "rigsofrods.sh"
        "rigsofrods-config.sh")
sha512sums=('SKIP'
            'aaf465b9afa2acde5300c5721d46147e54a25d74ca42efc560e47fd2e1197717904a33deef3bedcf4a94103228c25129b77f200d386567424a5c1f96fb55b339'
            '8280ddec6dba37e66c323e469c1894bacc3b592b6ea1f7fd3876bc9e7253b14b4949c3c51d7dd47ad7bd78e085fbe51aad83b1e8d0b0755deda426129e4a6710'
            '40a000061d72245265d53d7c2ce0c4acc81eb3dddb6f6beda4b693a154e34922b8eb5c8400062b58c5f43a74be6cdaab938c1cd6427aebfc691d1fa52517fe2d'
            'b0c04df93fa622d27ba485df1253ee786ebe42acb2c7b2f5d9657f22623503ee995845905f782c7b550625a4db0dbfdd924e4757b2daf21f84bb9cb3f6d683af'
            '83796e24bda42ed9f744cfd12af7eaf4ce576a4f784f3b10c360a6038fc921f47f42b90e205c933b89f0e837a65d446f101063fc9bac22591963747ed45fdfb6'
            'fe76e153ff532f1e88dd57889f6347c598517024681e0f899a878d3c57e2ef6a400c391bfc0a1860975138dc8dc814df268d0c419d919757e59389a307b0f71d')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"

    export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:/opt/MyGUI-OGRE1.8/lib/pkgconfig:/opt/Caelum-OGRE1.8/lib/pkgconfig:/opt/PagedGeometry-OGRE1.8/lib/pkgconfig:$PKG_CONFIG_PATH"
    export LD_LIBRARY_PATH="/opt/OGRE-1.8/lib:/opt/MyGUI-OGRE1.8/lib:/opt/Caelum-OGRE1.8/lib:/opt/PagedGeometry-OGRE1.8/lib:$LD_LIBRARY_PATH"

    # get a clean build dir
    [[ -d build ]] && rm -rf build && find ./bin -type f -maxdepth 1 ! -name resources -delete
    mkdir build && cd build

    cmake .. \
    -DROR_USE_MYGUI="TRUE" \
    -DROR_USE_OPENAL="TRUE" \
    -DROR_USE_SOCKETW="TRUE" \
    -DROR_USE_PAGED="TRUE" \
    -DROR_USE_CAELUM="TRUE" \
    -DROR_USE_ANGELSCRIPT="TRUE" \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DMYGUI_OGRE_PLATFORM="/opt/MyGUI-OGRE1.8/lib/"
    
    make
}

package() {
    cd $srcdir

    mkdir -p "$pkgdir/opt/$_pkgname"
    cp -r $srcdir/$_gitname/bin/* "$pkgdir/opt/$_pkgname/"
    cp $srcdir/$_gitname/build/bin/RoR "$pkgdir/opt/$_pkgname/"
    cp $srcdir/$_gitname/build/bin/RoRConfig "$pkgdir/opt/$_pkgname/"

    install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
    install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
    install -Dm755 RoRConfig.desktop "$pkgdir/usr/share/applications/RoRConfig.desktop"
    install -Dm755 plugins.cfg "$pkgdir/opt/$_pkgname/plugins.cfg"
    install -Dm755 rigsofrods.sh "$pkgdir/usr/bin/rigsofrods"
    install -Dm755 rigsofrods-config.sh "$pkgdir/usr/bin/rigsofrods-config"
}
