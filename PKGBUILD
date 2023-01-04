# Maintainer Carey Minaieva <jedi2light@jedi2light.moe>

pkgname=pocketbook-pro-sdk-linux
pkgver=1.1
_pkgver=1_1a
pkgrel=2
pkgdesc="Pocketbook-Pro SDK for Linux"
url="https://sourceforge.net/projects/pocketbook-free/files/PocketBook_Pro_SDK_Linux_1.1/"
license=('custom')
source=(
    "https://liquidtelecom.dl.sourceforge.net/project/pocketbook-free/PocketBook_Pro_SDK_Linux_${pkgver}/sdkrelease_${_pkgver}.tar.gz"
    "https://master.dl.sourceforge.net/project/pocketbook-free/pbres/1/pbres.c"
)
arch=('x86_64')
md5sums=('814aca54f7edf4b8c4d9469b455e0866' '1cfaa2f3150974440c08bc02ed3625df')
depends=(zlib)
optdepends=(
    "cmake: build some pocketbook apps from /usr/share/${pkgname}/sources/"
    "freetype2: use freetype in your apps, also required to build some pocketbook apps"
    "gtk2: use GTK2 in your apps, also required to build some pocketbook apps"
    "bzip2: use bzip2 in your apps, also required to build some pocketbook apps"
    "giflib: use giflib in your apps, also required to build some pocketbook apps"
)
options=('!strip' '!libtool')

prepare() {
    cd $srcdir/
    echo "Replacing TOOLCHAIN_PATH in sources/*/CMakeLists.txt and removing useless CMAKE_CURRENT_SOURCE_DIR variable ..."
    for cmake_lists_txt in $(find -name CMakeLists.txt); do
        sed -i $cmake_lists_txt -e 's#../../FRSCSDK#/opt/frscsdk#g' -e 's#../../PBSDK#/opt/pbsdk#g' -e 's#${CMAKE_CURRENT_SOURCE_DIR}/##g'
    done
}

build() {
    cd $srcdir/
    # compile pbres utility
    gcc -lz pbres.c -o pbres
}

package() {
    cd $srcdir/
    # create required directories
    mkdir -p $pkgdir/opt/ $pkgdir/usr/share/${pkgname}/
    # install FRSCSDK to /opt/frscsdk & fix permissions
    cp -r FRSCSDK/ $pkgdir/opt/frscsdk
    find $pkgdir/opt/frscsdk/ -type d -exec chmod 0755 {} \;
    find $pkgdir/opt/frscsdk/ -type f -exec chmod 0644 {} \;
    find $pkgdir/opt/frscsdk/arm-none-linux-gnueabi/bin/ -type f -exec chmod 0755 {} \;
    find $pkgdir/opt/frscsdk/arm-none-linux-gnueabi/sysroot/usr/bin/ -type f -exec chmod 0755 {} \;
    find $pkgdir/opt/frscsdk/arm-none-linux-gnueabi/sysroot/vfp/usr/bin/ -type f -exec chmod 0755 {} \;
    find $pkgdir/opt/frscsdk/bin/ -type f -exec chmod 0755 {} \;
    find $pkgdir/opt/frscsdk/libexec/ -type f -exec chmod 0755 {} \;
    # install PBSDK to /opt/pbsdk & fix permissions
    cp -r PBSDK/ $pkgdir/opt/pbsdk
    find $pkgdir/opt/pbsdk/ -type d -exec chmod 0755 {} \;
    find $pkgdir/opt/pbsdk/ -type f -exec chmod 0644 {} \;
    find $pkgdir/opt/pbsdk/arm-linux/bin/ -type f -exec chmod 0755 {} \;
    find $pkgdir/opt/pbsdk/bin/ -type f -exec chmod 0755 {} \;
    find $pkgdir/opt/pbsdk/libexec/ -type f -exec chmod 0755 {} \;    
    # install sources of some pocketbook apps & fix broken links
    cp -r sources/ $pkgdir/usr/share/${pkgname}/
    find $pkgdir/usr/share/${pkgname}/sources/ -type l -name system -exec ln -fs /usr/share/${pkgname}/system {} \;
    # install copy of /mnt/ext1/system
    cp -r system/ $pkgdir/usr/share/${pkgname}/
    # fix permissions in /usr/share/${pkgname}
    find $pkgdir/usr/share/${pkgname}/ -type d -exec chmod 755 {} \;
    find $pkgdir/usr/share/${pkgname}/ -type f -exec chmod 644 {} \;
    # install pbres utility
    mkdir -p $pkgdir/usr/bin/
    install -m 0755 pbres $pkgdir/usr/bin/
}

#vim: syntax=sh
