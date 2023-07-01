# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgbase=cura5
pkgname=cura-5
_pkgname=cura
pkgver=5.3.1
pkgrel=0
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('3dprinter-udev-rules'
         'cura-resources-materials'
         'curaengine-5'
         'libglvnd'
         'python-certifi'
         'python-keyring'
         'python-numpy-stl'
         'python-pyserial'
         'python-pynest2d'
         'python-requests'
         'python-pyqt6'
         'python-numpy'
         'python-uranium'
         'python-savitar'
         'python-trimesh'
         'python-zeroconf'
         'qt6-svg'
         'ttf-opensans'
         'xtrans')
makedepends=('qt6-tools'
             'cmake'
             'ninja'
             'python-sip4'
             'python-pyqt6-sip')
optdepends=('python-zeroconf: network printing support'
            'python-trimesh: Reading AMF files'
            'python-libcharon: UFPWriter/UFPReader'
            'cura-binary-data: Binary data (firmwares and such) for cura'
            'cura5-plugin-octoprint: Cura plugin which enables printing directly to OctoPrint and monitoring the progress')
replaces=(cura)
conflicts=(cura)
provides=(cura)
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPLv3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "CMakeLists.txt"
        "com.ultimaker.cura.appdata.xml"
        "com.ultimaker.cura.desktop.in"
        "CuraPluginInstall.cmake"
        "CuraTests.cmake"
        "CuraVersion.py.in"
        "mod_bundled_packages_json.py"
        "028e7f7.patch")
sha512sums=('4b7e64a18b9e4260141bd5b2101ae1c567041580f24470fd20b99bc6caacc2d7a6c15fb7ecaf1aae8f1cf43cea995fd9eab1e5edcdc4efc786d3b209f4f7484e'
            'e38abbe895abf94346eabbd2ae76ba8c5e34d7150bf7216b77977c37d5a04cb98aea332c4ed9fd6dfef01f170de26463a71297bc99eadb756159263609a7f412'
            '9c4e221bb45a75390acef37e6667b9c8a0721ed77067a093369e39946d894001354dd5ce2f2aa0d6789c5300dd84abff9ec840698d10eda0b524470aaec08a6a'
            'fd1f94ccdce3ede61573791df7d0359a9d4e9de46d1e66dc7109e4d05db51e859fc761ad0f86a916120dc9fc949c644cbdf705f96f2cbc68b3fbc1b36545fa57'
            '6fd5ec4fa734668f264a28ecd306c1e9ec78388866340dffee7bdefdb43797b1e38a9dd6db4bedbc374aed937f0ad783475904b6daf95210fc9c0e0825adb47c'
            'c21502d8cb03d498e9516b0ff605302328dcfaf49572056394c19116154504198d8718e6da8eb9c3668dcc0c9eb833f08d886cbc873ab4d3ae79ee4c66de1f0c'
            '9858776a1d027fb7b02da5f2423861fcce4ad60078510ffcdf2861df789026875be6acf5016b72ac901be7074c2b8b01a3ab4cd4dc3b97427aadc57556cf0f5b'
            '536ad03e3acfa8959a32a1ceb83967e4b9480297ef4103846352cd444b36ff278faa6597bd8a231a5c849b6d2b738d27a463fb64d6848707641040ce1fe6cda2'
            '16090f14c49bedf83284518462a7bf4f7bde6b85925acc2611a55d4b45d310408b860e7fdc049b154ea64f03787f8e0d41cf4b2f8300e3761b8414a80c737204')
cura_cloud_api_root="https://api.ultimaker.com"
cura_cloud_api_version="1"
cura_cloud_account_api_root="https://account.ultimaker.com"

prepare(){
	cd $srcdir/Cura-${pkgver}
	mkdir cmake
	cp ${srcdir}/mod_bundled_packages_json.py ${srcdir}/CuraPluginInstall.cmake ${srcdir}/CuraTests.cmake cmake
	rm -rf CMakeLists.txt
	cp ${srcdir}/com.ultimaker.cura.desktop.in ${srcdir}/CMakeLists.txt ${srcdir}/com.ultimaker.cura.appdata.xml .
	cp ${srcdir}/CuraVersion.py.in cura
	patch -Np1 < ${srcdir}/028e7f7.patch
}

build(){
	cd Cura-${pkgver}
	cmake -G Ninja -B build \
		-DCURA_VERSION:STRING=${pkgver} \
		-DCURA_BUILDTYPE="AUR ${pkgver}" \
		-DCURA_CLOUD_API_ROOT:STRING=${cura_cloud_api_root} \
		-DCURA_CLOUD_API_VERSION:STRING=${cura_cloud_api_version} \
		-DCURA_CLOUD_ACCOUNT_API_ROOT:STRING=${cura_cloud_account_api_root} \
		-DLIB_SUFFIX:STR= \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package(){
	cd Cura-${pkgver}
	DESTDIR="${pkgdir}" cmake --install build
}

# vim:set ts=2 sw=2 et:

