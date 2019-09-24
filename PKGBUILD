# Maintainer: Rocky Prabowo (rocky.prabowo) <rocky at lazycats dot id>
# AMD μProf (amduprof from AUR) or AMDPowerProfilerDriverSource.tar.gz inside of <AMDuProf_Linux_x64_${pkgver}.tar.bz2>/bin is required from upstream

pkgname=amdpowerprofiler-dkms
pkgver=8.00
pkgrel=1
pkgdesc="AMD Power Profiler Driver (DKMS)"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
depends=("dkms")
optdepends=("amduprof: AMD μProf includes the source of this driver")
install=${pkgname}.install

_archive_name="AMDPowerProfilerDriverSource"
_archive=${_archive_name}.tar.gz

_driver_module_name="AMDPowerProfiler"
_driver_version=${pkgver}

AMD_UPROF_DRIVER_DIR="/opt/amduprof/bin"

if [ ! -f ${PWD}/${_archive} ]; then
	if [ -f $AMD_UPROF_DRIVER_DIR/${_archive} ]; then
		ln -sfn $AMD_UPROF_DRIVER_DIR/${_archive} ${PWD}
	else
		printf $(tput setaf 6 ; tput bold)"Can't find ${_archive} in ${PWD} or ${AMD_UPROF_DRIVER_DIR}!\n"$(tput sgr0)
		printf $(tput setaf 6 ; tput bold)"Install amduprof from AUR or put ${_archive} from <AMD μProf archive>/bin to build directory ${PWD}\n"$(tput sgr0)
	fi
fi

source=("local://${_archive}"
        local://powerprofilerdriver_8_fix.patch
        local://amdpowerprofiler-load
        local://amdpowerprofiler-load.service
        )

sha256sums=('f2b7cabd95d7d59a3c66d8908d23efce716143d9d60e7b66f4edd46b8b5ed33a'
            'c8330adf5815ebf2e440264b83245258780f9ff3674cd1a038f4d70f54f1eaf4'
            'be4dd22642ef97c9e2f85aebe7e8f9c9198fc18f195ee6cc3a091560050b3a7d'
            '7ee0f1b579302714789b43d096e94b549be1d3714112d7809fc93ae632206be6')

prepare() {
	cd ${srcdir}/${_driver_module_name}-${_driver_version}
	
	# Obtain the version from source
    _driver_version=$(cat ./AMDPowerProfilerVersion)
    
    # Patch the module source so it can be built on Linux 5.1 or newer
    patch --forward --strip=1 --input="${srcdir}/powerprofilerdriver_8_fix.patch"
    
    # Replace the PACKAGE_VERSION on dkms.conf with the version from the source
    sed -i -e "/^PACKAGE_VERSION=/ s/=.*/=\"${_driver_version}\"/" dkms.conf
}

pkgver() {
	echo ${_driver_version}
}

package_amdpowerprofiler-dkms() {    
    cd ${srcdir}/${_driver_module_name}-${_driver_version}
    
    mkdir -p ${pkgdir}/usr/src/${_driver_module_name}-${_driver_version}
    cp -pr * ${pkgdir}/usr/src/${_driver_module_name}-${_driver_version}
    
    # systemd service unit for module (un)loading
    mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -Dm644 "$srcdir/amdpowerprofiler-load.service" "${pkgdir}/usr/lib/systemd/system/amdpowerprofiler-load.service"
	
	# Module (un)loader script
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 "$srcdir/amdpowerprofiler-load" "${pkgdir}/usr/bin/amdpowerprofiler-load"
}
