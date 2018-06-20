# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=motionbuilder
pkgver=2017
pkgrel=1
pkgdesc="Autodesk 3D character animation software"
arch=('x86_64')
url="https://www.autodesk.com/products/motionbuilder/overview"
license=('custom: unlimited')
# Depends on gstreamer0.10-base
# Setup needs qt4
depends=('libpng12' 'tcsh' 'libxp' 'openssl' 'libjpeg6-turbo' 'libtiff' 'gamin'
         'audiofile' 'e2fsprogs' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi'
         'xorg-fonts-misc' 'openssl-1.0')
options=(!strip)
# Download it yourself, I don't know a direct download link.
source=("local://Autodesk_MotionBuilder_${pkgver}_EN_JP_ZH_Linux_64bit.tgz")
sha512sums=('de96ac1f70af63ca9e41a74aecfbf3df716b77dfdc6ffb36561f3980cef6ac246af4868f4ee72ccdb7fd806b7c83887a90765fd0daeb1c4dfdc1c1e20c4e242e')

prepare() {
    cd "$srcdir"

    rm -Rf ../motionbuilder-setup
    mkdir -p ../motionbuilder-setup
    mv * ../motionbuilder-setup
}

package() {
    cd "$pkgdir"

    # Extract RPMs
    for i in ../../motionbuilder-setup/*.rpm; do
        msg2 "Extracting ${i}"
        bsdtar -xf $i
    done

    mkdir "$pkgdir"/usr/tmp/
    chmod 777 "$pkgdir"/usr/tmp/

    mkdir -p "$pkgdir"/usr/bin/
    chmod 755 "$pkgdir"/usr/bin/
    ln -s /usr/autodesk/MotionBuilder2017/bin/linux_64/motionbuilder "$pkgdir"/usr/bin/motionbuilder

    mkdir -p "$pkgdir"/opt/motionbuilder-setup/
    chmod 755 "$pkgdir"/opt/motionbuilder-setup/
    cp ../../motionbuilder-setup/setup{,.xml} "$pkgdir"/opt/motionbuilder-setup/

    # "Fix" conflicts with Maya
    mv "$pkgdir"/opt/Autodesk/Adlm "$pkgdir"/opt/Autodesk/Adlm_motionbuilder
    mv "$pkgdir"/opt/flexnetserver "$pkgdir"/opt/flexnetserver_motionbuilder
    mv "$pkgdir"/var/opt/Autodesk/Adlm "$pkgdir"/var/opt/Autodesk/Adlm_motionbuilder
}
