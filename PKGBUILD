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
pkgver=20190522
pkgrel=1
arch=('any' 'x86_64')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
makedepends=('curl' 'json-c' 'pam' 'python-boto' 'python-distro' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/compute-image-packages/archive/$pkgver.tar.gz")
sha256sums=('8cfb338c3c768ea7e76e479728a1438b2f10b0df13bddd70c9fbcbfc1273efd6')

build() {
	cd "compute-image-packages-$pkgver/packages"
	pushd python-google-compute-engine
	python setup.py build
	popd

	pushd google-compute-engine-oslogin
	make
	popd
}

package_google-compute-engine() {
	pkgdesc='Google Compute Engine guest environment'
	arch=('any')
	depends=('google-compute-engine-oslogin' 'python-boto' 'python-distro' 'python-setuptools')

	cd "compute-image-packages-$pkgver/packages"
	pushd python-google-compute-engine
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	popd

	pushd google-compute-engine/src
	install -m644 -Dt "$pkgdir/etc/modprobe.d" etc/modprobe.d/*
	install -m644 -Dt "$pkgdir/etc/sysctl.d" etc/sysctl.d/*
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system/" lib/systemd/system/*
	install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" lib/udev/rules.d/*
	install -m755 -Dt "$pkgdir/usr/bin" usr/bin/*
	# Use cp to install symbolic links.
	cp -d etc/dhcp/dhclient-exit-hooks "$pkgdir/etc/dhclient-exit-hooks"
	popd
}

package_google-compute-engine-oslogin() {
	pkgdesc='Google Compute Engine OS login support'
	arch=('x86_64')
	depends=('curl' 'json-c' 'pam')

	cd "compute-image-packages-$pkgver"/packages/google-compute-engine-oslogin
	make DESTDIR="$pkgdir/" NSS_INSTALL_PATH=/usr/lib PAM_INSTALL_PATH=/usr/lib/security install
}
