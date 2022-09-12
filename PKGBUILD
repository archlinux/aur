# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=youku
pkgver=1.0.0
pkgrel=4
pkgdesc="YouKu Video client"
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
arch=('x86_64')
license=('GPL')
makedepends=('electron9-bin')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
source=('youku.deb::https://mirrors.163.com/ubuntukylin/pool/partner/youku-app_1.0.0_amd64.deb'
        'youku.desktop'
)
sha256sums=('c28ade22d41fa6074fce7f2cb06f9db4dfba439698bbea37b0f5735d9ae30075'
            '6b984c5b95804defaaa8bba57563e7dbe0a6a841712240822a1764670cd805c2')
noextract=('youku.deb')

build() {
  ar x youku.deb
  tar xf data.tar.xz #resources
}

package() {
    # Install electron
    install -d ${pkgdir}/usr/lib/${pkgname}
    cp -r /usr/lib/electron9/* ${pkgdir}/usr/lib/${pkgname}
    rm -f ${pkgdir}/usr/lib/${pkgname}/resources/default_app.asar

    # Create symlink for command
    install -d ${pkgdir}/usr/bin
    mv ${pkgdir}/usr/lib/${pkgname}/electron ${pkgdir}/usr/lib/${pkgname}/YouKu
    ln -fs /usr/lib/${pkgname}/YouKu ${pkgdir}/usr/bin/${pkgname}

    # Install desktop file
#    install -Dm644 opt/优酷/resources/assets/images/app_icon256.png ${pkgdir}/usr/share/pixmaps/youku.png
    install -Dm644 ${srcdir}/youku.desktop -t ${pkgdir}/usr/share/applications/

    # copy app.asar and other resource files
    cd $srcdir/opt/优酷/resources
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/${pkgname}/resources/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/lib/${pkgname}/resources/}{} \;

    cd $srcdir/usr/share/icons
    find . -type d -exec install -d {,"$pkgdir"/usr/share/icons/}{} \;
    for i in `find . -type f`;do
      install -Dm644 $i "$pkgdir"/usr/share/icons/`echo $i | tr 'A-Z' 'a-z'`
    done
}
