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

pkgname='google-compute-engine'
pkgver=20191121
pkgrel=1
pkgdesc='Google Compute Engine guest environment'
arch=('any')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
depends=('ethtool' 'google-compute-engine-oslogin' 'inetutils' 'python-boto' 'python-distro' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/compute-image-packages/archive/v$pkgver.tar.gz")
sha256sums=('3a8fd0fcede35552e7efd091a96d2697e7d149383b5fe54008c68d4f53f69951')

build() {
	cd "compute-image-packages-$pkgver/packages/python-google-compute-engine"
	python setup.py build
}

package() {
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
	ln -s /usr/bin/google_set_hostname "$pkgdir/etc/dhclient-exit-hooks"
	popd
}
