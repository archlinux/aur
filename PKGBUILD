# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname='powerword-bin'
pkgver=1.2
pkgrel=6
pkgdesc="A Chinese-English dictionary tool."
arch=('x86_64')
license=('unknown')
url="http://www.iciba.com"
provides=("powerword")
depends=('sdl2_mixer' 'qtwebkit' 'qrencode' 'opencore-amr')
optdepends=('ttf-ms-fonts: font support')
source=("${pkgname}.deb::https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.kingsoft.powerword/com.kingsoft.powerword_${pkgver}_amd64.deb")
sha512sums=('c4d6146858fde3eafc3f087d1c284ceeeaf0747fa93db30c86cf33319f7c18e08757b4981f410fe6bb2bcc80bbedea5931e05668ae604fa4bc491401d5079fdd')

package() {
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    
    mkdir -p "${pkgdir}"/usr/share/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/entries/* "${pkgdir}"/usr/share/
    sed -i 's|/opt/apps/com.kingsoft.powerword/entries|/usr/share|g' "${pkgdir}"/usr/share/applications/com.kingsoft.powerword.desktop
    sed -i 's|/opt/apps/com.kingsoft.powerword/files/|/opt/powerword/|g' "${pkgdir}"/usr/share/applications/com.kingsoft.powerword.desktop
    chmod -R 0755 "${pkgdir}"/usr/share/
    
    mkdir -p "${pkgdir}"/opt/powerword/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/Powerword "${pkgdir}"/opt/powerword/Powerword
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/mp3player "${pkgdir}"/opt/powerword/mp3player
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/resources "${pkgdir}"/opt/powerword/resources
    
    # move needed libs to /usr/lib, should be replaced with ffmpeg.
    mkdir -p "${pkgdir}"/usr/lib/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/libs/libavformat.so.57 "${pkgdir}"/usr/lib/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/libs/libavcodec.so.57 "${pkgdir}"/usr/lib/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/libs/libavutil.so.55 "${pkgdir}"/usr/lib/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/libs/libswresample.so.2 "${pkgdir}"/usr/lib/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/libs/libswscale.so.4 "${pkgdir}"/usr/lib/
    
    chown -R root:root "${pkgdir}"/opt "${pkgdir}"/usr
    chmod -R og-w "${pkgdir}"/opt "${pkgdir}"/usr
    mkdir -p "${pkgdir}"/usr/bin/
    ln -s /opt/powerword/Powerword "${pkgdir}"/usr/bin/powerword
    
    # remove unused batch files.
    find "${pkgdir}"/opt/powerword/resources -name "*.bat"  | xargs rm -f
    
    rm -r "${pkgdir}"/opt/apps
} 
