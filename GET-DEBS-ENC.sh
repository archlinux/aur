
#!/bin/bash

# A script which download all required DEBS from repo.radeon.com .

. ./versions

### Creating Archive ###

mkdir amdgpu-pro-$pkgver_base-$pkgver_build-ubuntu-$ubuntu_ver
ARCHIVE=amdgpu-pro-$pkgver_base-$pkgver_build-ubuntu-$ubuntu_ver
cd ${ARCHIVE}

### Getting Debs ### 

### libamdenc-amdgpu-pro ###

wget http://repo.radeon.com/amdgpu/${pkgver_base}/ubuntu/pool/proprietary/liba/libamdenc-amdgpu-pro/libamdenc-amdgpu-pro_${encver_base}-${pkgver_build}_amd64.deb






