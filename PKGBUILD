# Copyright 2018 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Lorenzo Castelli <lcastelli@google.com>
# Maintainer: Samuel Littley <samuellittley@google.com>

pkgname=('google-compute-engine' 'google-compute-engine-oslogin')
pkgver=20181023
pkgrel=1
arch=('any' 'x86_64')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
makedepends=('curl' 'json-c' 'pam' 'python-boto' 'python-distro' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/compute-image-packages/archive/$pkgver.tar.gz"
        "google_oslogin_control.patch")
sha256sums=('17355f56e405a81b19ebbf139d3d3c8b1f09f3f5b1e6b7cda428ac99d8c70523'
            '276c1cabcd0e88b668a8c16bdca2153d47e42cc19d69d62ab54b7c7d6badc360')

prepare() {
	cd "compute-image-packages-$pkgver"
	patch -p1 -i ../google_oslogin_control.patch
}

build() {
	cd "compute-image-packages-$pkgver"
	python setup.py build

	cd google_compute_engine_oslogin
	make
}

package_google-compute-engine() {
	pkgdesc='Google Compute Engine guest environment'
	arch=('any')
	depends=('google-compute-engine-oslogin' 'python-boto' 'python-distro' 'python-setuptools')

	cd "compute-image-packages-$pkgver"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system/" google_compute_engine_init/systemd/*.service
	install -m755 -Dt "$pkgdir/etc/dhcp/dhclient-exit-hooks.d/" google_config/bin/google_set_hostname
	install -m644 -Dt "$pkgdir/etc/modprobe.d" google_config/modprobe/gce-blacklist.conf
	install -m644 -Dt "$pkgdir/etc/sysctl.d" google_config/sysctl/*
	install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" google_config/udev/*
}

package_google-compute-engine-oslogin() {
	pkgdesc='Google Compute Engine OS login support'
	arch=('x86_64')
	depends=('curl' 'json-c' 'pam')

	cd "compute-image-packages-$pkgver"/google_compute_engine_oslogin
	make DESTDIR="$pkgdir/" NSS_INSTALL_PATH=/usr/lib PAM_INSTALL_PATH=/usr/lib/security install
}
