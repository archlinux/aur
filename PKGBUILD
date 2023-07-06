# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Michal Malek <michalm@fastmail.fm>
# Contributor: Sharif Olorin <sio@tesser.org>

pkgname=orthanc
pkgver=1.12.1
pkgrel=1
pkgdesc='Open-source, lightweight DICOM server'
arch=('x86_64' 'i686')
url='https://www.orthanc-server.com/'
license=('GPL3')

depends=(
    'boost-libs' 'curl' 'dcmtk' 'jsoncpp' 'libjpeg-turbo' 'lua' 'pugixml' 'sqlite'
)
makedepends=(
    'boost' 'cmake' 'doxygen' 'gtest' 'make' 'python' 'unzip'
)
backup=("etc/webapps/${pkgname}/config.json")
source=(
    "https://www.orthanc-server.com/downloads/get.php?path=/orthanc/Orthanc-${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
)
sha512sums=(
    '1a15004497821601275f3da404e3f46ffb39b0f2c57c3d552bdf85ae251747f88ee6c22b0b10a4dfc9752f3506cca3db784562ce9d2dbae38a0c8d6ab71b8a83'
    'cd69b74eff5eea43191341ec35cef53d026a1939bb6fdc6a71734c0f9339ff47effc0eb611c16fd609d6ffcf1e332f48cfaa533ccf8d7f71ce7e61f04b4fabca'
    '30d63bafdcfff751e12f6187115bac5d1630eb31848eab6d06d10359118e3a3c404a845ef14852ee578df0b25f622f2195d0b0546fe62cdc8a2702f2ffb59634'
    '2dffd683e6c9bd0e495a1478bf2c6f90833a5c260c7619828136804d410da1d38b385db5db094a065352e21c54c0da1b5dcdd83bce129bd4bcba9c4a11361d18'
)

build() {
    # dcmtk needs to be rebuilt each time there is a new libicu release.
    # After that, make sure the package builds from a fresh env.
    # src.: https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot
    #
    # mkdir chroot
    # CHROOT=${PWD}/chroot
    # mkarchroot $CHROOT/root base-devel
    # makechrootpkg -c -r $CHROOT -I /home/wget/.cache/yay/dcmtk/dcmtk-3.6.6-3-x86_64.pkg.tar
    cd Orthanc-"${pkgver}"/OrthancServer
    cmake \
        -DSTATIC_BUILD=OFF \
        -DALLOW_DOWNLOADS=ON \
        -DUSE_SYSTEM_CIVETWEB=OFF \
        -DUSE_SYSTEM_BOOST=ON \
        -DUSE_SYSTEM_LIBICU=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B"${srcdir}"/build \
        ../OrthancServer/

    cd "${srcdir}"/build
    make
    make doc
}

check() {
    cd "${srcdir}"/build
    ./UnitTests
}

package() {
    cd Orthanc-"${pkgver}"/OrthancServer
    cmake --build "${srcdir}"/build --target install -- DESTDIR="${pkgdir}"
    mkdir -p ${pkgdir}/usr/bin
    mv "${pkgdir}"/usr/sbin/* ${pkgdir}/usr/bin
    rmdir "${pkgdir}"/usr/sbin

    # Systemd
    install -Dm644 "${srcdir}/${pkgname}".service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 "${srcdir}/${pkgname}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
    install -Dm644 "${srcdir}/${pkgname}".tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/"${pkgname}".conf

    # Orthanc config file
    install -dm755 "${pkgdir}"/etc/webapps/"${pkgname}"
    install -m644 "${srcdir}"/Orthanc-"${pkgver}"/OrthancServer/Resources/Configuration.json "${pkgdir}"/etc/webapps/"${pkgname}"/config.json

    sed -e 's@"StorageDirectory" : ".*"@"StorageDirectory" : "/var/lib/orthanc/"@g' \
        -e 's@"IndexDirectory" : ".*"@"IndexDirectory" : "/var/lib/orthanc/"@g' \
        -i "${pkgdir}"/etc/webapps/"${pkgname}"/config.json
}
