
#!/bin/bash

# A script which download all required DEBS from repo.radeon.com .

. ./versions

### Creating Archive ###

ARCHIVE=amdgpu-pro-$amdgpu_pro_ver-$pkgver_build
[[ -d $ARCHIVE ]] || mkdir ${ARCHIVE}
cd ${ARCHIVE}

### Getting Debs ###

wget http://repo.radeon.com/amdgpu/${pkgver_base}/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_${amdgpu_pro_ver}-${pkgver_build}.${ubuntu_ver}_i386.deb -O i386.deb
