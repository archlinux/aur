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
pkgver=20220211.00
pkgrel=2
pkgdesc='Linux Guest Environment for Google Compute Engine'
arch=('any')
url='https://github.com/GoogleCloudPlatform/guest-configs'
license=('Apache')
depends=('nvme-cli' 'google-compute-engine-oslogin' 'google-guest-agent')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-configs/archive/$pkgver.tar.gz"
        'google-compute-engine.install'
        'google_set_hostname.patch')
sha256sums=('eeb95c321a6e73a48e4cb988270b5ce210fb0654951deb153a48ad04dbc74947'
            '9b31cc5146d83374cc8f8da9f0ce924bbafeb932d0cf0ce60e4aec71d1f981b7'
            'f54b3bb58e1c4eb0b9d0c7d8f38244dbd1f6b9b9db8fe9880d4562c35eced704')
install='google-compute-engine.install'

prepare() {
  cd "$srcdir/guest-configs-$pkgver"
  patch --strip=1 --input="$srcdir/google_set_hostname.patch"
}

package() {
	cd "$srcdir/guest-configs-$pkgver"
	install -m644 -Dt "$pkgdir/etc/modprobe.d" src/etc/modprobe.d/*
	install -m644 -Dt "$pkgdir/etc/sysctl.d" src/etc/sysctl.d/*
	install -m644 -Dt "$pkgdir/usr/lib/udev" src/lib/udev/google_nvme_id
	install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" src/lib/udev/rules.d/*
	install -m755 -Dt "$pkgdir/usr/bin" src/usr/bin/*
	ln -s /usr/bin/google_set_hostname "$pkgdir/etc/dhclient-exit-hooks"
}
