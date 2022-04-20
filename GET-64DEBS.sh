
#!/bin/bash

# A script which download all required DEBS from repo.radeon.com .

. ./versions

### Creating Archive ###

mkdir amdgpu-pro-$pkgver_base-$pkgver_build-ubuntu-$ubuntu_ver
ARCHIVE=amdgpu-pro-$pkgver_base-$pkgver_build-ubuntu-$ubuntu_ver
cd ${ARCHIVE}

### Getting Debs ###

wget http://repo.radeon.com/amdgpu/${pkgver_base}/ubuntu/pool/proprietary/o/opencl-legacy-amdgpu-pro/opencl-legacy-amdgpu-pro-icd_${pkgver_base}-${pkgver_build}_amd64.deb
