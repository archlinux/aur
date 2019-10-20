# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Michal Malek <michalm@fastmail.fm>
# Contributor: Sharif Olorin <sio@tesser.org>

pkgname=orthanc
pkgver=1.5.8
pkgrel=1
pkgdesc='Open-source, lightweight DICOM server'
arch=('x86_64' 'i686')
url='http://orthanc-server.com/'
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
    '9610526cff59e2061e16728d7ce78a80dd8803371ac80be561349476bac011ad2200b1e144df13b4e94174a90591ed8a1a0c258c98122f934ce4e70b320568e5'
    'cd69b74eff5eea43191341ec35cef53d026a1939bb6fdc6a71734c0f9339ff47effc0eb611c16fd609d6ffcf1e332f48cfaa533ccf8d7f71ce7e61f04b4fabca'
    '30d63bafdcfff751e12f6187115bac5d1630eb31848eab6d06d10359118e3a3c404a845ef14852ee578df0b25f622f2195d0b0546fe62cdc8a2702f2ffb59634'
    '2dffd683e6c9bd0e495a1478bf2c6f90833a5c260c7619828136804d410da1d38b385db5db094a065352e21c54c0da1b5dcdd83bce129bd4bcba9c4a11361d18'
)

build() {
	cmake \
        -DSTATIC_BUILD=OFF \
		-DALLOW_DOWNLOADS=ON \
        -DUSE_SYSTEM_CIVETWEB=OFF \
        -DBoost_NO_BOOST_CMAKE=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-H"${srcdir}"/Orthanc-"${pkgver}" \
		-B"${srcdir}"/build

	cmake --build "${srcdir}"/build
	cmake --build "${srcdir}"/build --target doc
}

check() {
	cd "${srcdir}"/build
	./UnitTests
}

package() {
	cmake --build "${srcdir}"/build --target install -- DESTDIR="${pkgdir}"
	mkdir -p ${pkgdir}/usr/bin
	mv "${pkgdir}"/usr/sbin/* ${pkgdir}/usr/bin
	rmdir "${pkgdir}"/usr/sbin

    # Systemd
    install -Dm644 "${pkgname}".service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 "${pkgname}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
    install -Dm644 "${pkgname}".tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/"${pkgname}".conf

    # Orthanc config file
    install -dm755 "${pkgdir}"/etc/webapps/"${pkgname}"
    install -Dm644 "${srcdir}"/Orthanc-"${pkgver}"/Resources/Configuration.json -t "${pkgdir}"/etc/webapps/"${pkgname}"
    mv "${pkgdir}"/etc/webapps/"${pkgname}"/Configuration.json "${pkgdir}"/etc/webapps/"${pkgname}"/config.json

    sed -e 's@"StorageDirectory" : ".*"@"StorageDirectory" : "/var/lib/orthanc/"@g' \
        -e 's@"IndexDirectory" : ".*"@"IndexDirectory" : "/var/lib/orthanc/"@g' \
        -i "${pkgdir}"/etc/webapps/"${pkgname}"/config.json
}
