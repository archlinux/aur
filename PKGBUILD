# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>
pkgname=airmanager
pkgver=5.2.7
pkgrel=1
pkgdesc="Flight simulator instrument panels"
arch=('x86_64')
url="https://siminnovations.com/"
license=('custom:proprietary')
depends=()
makedepends=('unzip' 'tar')
options=('!strip' '!debug')
source=("airmanager.zip::https://api6.siminnovations.com/application/download/b2e884a4-0021-49e5-2865-37ef2442e767"
        "libfreeimage.deb::http://archive.ubuntu.com/ubuntu/pool/universe/f/freeimage/libfreeimage3_3.18.0+ds2-1ubuntu3_amd64.deb"
        "libjxr0.deb::http://archive.ubuntu.com/ubuntu/pool/universe/j/jxrlib/libjxr0_1.1-6build1_amd64.deb"
        "libjpeg8.deb::http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb"
        "libjpeg-turbo8.deb::http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb"
        "libraw19.deb::http://archive.ubuntu.com/ubuntu/pool/main/libr/libraw/libraw19_0.19.5-1ubuntu1_amd64.deb"
        "libopenexr.deb::http://archive.ubuntu.com/ubuntu/pool/universe/o/openexr/libopenexr24_2.3.0-6ubuntu0.5_amd64.deb"
        "libilmbase.deb::http://archive.ubuntu.com/ubuntu/pool/universe/i/ilmbase/libilmbase24_2.3.0-6build1_amd64.deb"
        "libtiff5.deb::http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff5_4.0.9-5ubuntu0.10_amd64.deb"
        "libwebp6.deb::http://archive.ubuntu.com/ubuntu/pool/main/libw/libwebp/libwebp6_0.6.1-2ubuntu0.20.04.3_amd64.deb"
        "libjbig0.deb::http://archive.ubuntu.com/ubuntu/pool/main/j/jbigkit/libjbig0_2.1-3.1build1_amd64.deb"
        "airmanager.desktop"
        "airmanager.sh")
sha256sums=('d982b1792485da44d3b4443db949063acf4f3dfea169b9ea39c657c35431e503'
            'ce8fd82e2a75fa4f8372481300311d15c3dbf92acfa658e96367638eb155b3b2'
            'c851ab88ee89803ee5b6ddb9629377c5b20808c1e6c066d15e94ab07c7d1d2a2'
            'baaecbc8e7ef55fc1887365721a7771f7d533fabca38fca878668b9c8f7ee13f'
            '0df3b0bc50605902d73a0619f32e4fbef86d123373480c5304af1645729cafc9'
            '7dd1a6027a7adbf65f692113a44df20b84e911cba2735ca709c376a9979e30e7'
            'b502e043cbd9fbce0b8d7db0a021040b57d70e3a95934b86fdf5b6660624a8ca'
            'e40669f8a3c4a88280ad11591c945c847b6549534bc512a7d05c28666b547d2c'
            '66aa05b2f59644fe68f36bcb01cba7f50e5895609c102981dd8ae783f13b2518'
            '78bd6a8a1a6cd990024cad5f8ccfc0b7988b0b4bcfe2faa7c4f7ea3c6b44189e'
            'f19d3e72dad9a418ca71ef58ee94b258616abbdbab3d1c5e2ed98fb8f14622a8'
            '04559fa799c251723a85ee64f77c41b9622bc0eb967ed7da8e720b32c955f2a8'
            'f0635c5d43ebf667b2047496eac3aa5a4a1d8fb0a80fe172abd5631cd5e3f801')
noextract=('airmanager.zip' 'libfreeimage.deb' 'libjxr0.deb' 'libjpeg8.deb' 'libjpeg-turbo8.deb' 'libraw19.deb' 'libopenexr.deb' 'libilmbase.deb' 'libtiff5.deb' 'libwebp6.deb' 'libjbig0.deb')

prepare() {
    cd "${srcdir}"
    
    # Extract AirManager into its own clean directory
    mkdir -p AirManager
    unzip -q airmanager.zip -d AirManager/
    
    # Extract DEB files correctly using ar and tar
    for pkg in libfreeimage.deb libjxr0.deb libjpeg8.deb libjpeg-turbo8.deb libraw19.deb libopenexr.deb libilmbase.deb libtiff5.deb libwebp6.deb libjbig0.deb; do
        ar x "$pkg"
        tar -xf data.tar.xz || tar -xf data.tar.zst || tar -xf data.tar.gz || true
    done
}

package() {
    cd "${srcdir}"
    
    # Install main application
    install -dm755 "${pkgdir}/opt/airmanager"
    cp -a AirManager/* "${pkgdir}/opt/airmanager/"
    
    # Remove unnecessary setup scripts
    rm -f "${pkgdir}/opt/airmanager/setup.sh"
    
    # Install udev rules for the Knobster hardware
    if [ -f "${pkgdir}/opt/airmanager/99-knobster.rules" ]; then
        install -Dm644 "${pkgdir}/opt/airmanager/99-knobster.rules" "${pkgdir}/usr/lib/udev/rules.d/99-knobster.rules"
        rm -f "${pkgdir}/opt/airmanager/99-knobster.rules"
    fi
    
    # Install bundled legacy libraries
    install -dm755 "${pkgdir}/opt/airmanager/lib"
    cp -a usr/lib/x86_64-linux-gnu/* "${pkgdir}/opt/airmanager/lib/"
    cp -a lib/x86_64-linux-gnu/* "${pkgdir}/opt/airmanager/lib/" 2>/dev/null || true
    
    # Install executable wrapper
    install -Dm755 airmanager.sh "${pkgdir}/usr/bin/airmanager"
    
    # Install desktop entry and icon
    install -Dm644 airmanager.desktop "${pkgdir}/usr/share/applications/airmanager.desktop"
    install -Dm644 AirManager/images/si_logo.png "${pkgdir}/usr/share/pixmaps/airmanager.png"
}
