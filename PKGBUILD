# Copyright 2020 Google Inc. All Rights Reserved.
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

pkgname='google-guest-agent'
pkgver=20220824.00
pkgrel=1
pkgdesc='Guest Agent for Google Compute Engine'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/guest-agent'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-agent/archive/$pkgver.tar.gz"
        'google-guest-agent.install')
sha256sums=('4e53de5276b8ff60fe50f5bd91e6a88282d8eb1250a83124a31ff999d946b308'
            'bf8dd6ae04242160cd78e781015fd456c73c208ba09049fc56cc0f716038c5f2')
install='google-guest-agent.install'
backup=('etc/default/instance_configs.cfg')

export CGO_CPPFLAGS="$CPPFLAGS"
export CGO_CFLAGS="$CFLAGS"
export CGO_CXXFLAGS="$CXXFLAGS"
export CGO_LDFLAGS="$LDFLAGS"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

build() {
	cd "guest-agent-$pkgver"
	go build -o google_guest_agent ./google_guest_agent
	go build -o google_metadata_script_runner ./google_metadata_script_runner
}

check() {
	cd "guest-agent-$pkgver"
	go test ./google_guest_agent ./google_metadata_script_runner
}

package() {
	cd "guest-agent-$pkgver"
	install -m755 -Dt "$pkgdir/usr/bin" google_guest_agent/google_guest_agent
	install -m755 -Dt "$pkgdir/usr/bin" google_metadata_script_runner/google_metadata_script_runner
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system" *.service
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system-preset" *.preset
	install -m644 -Dt "$pkgdir/usr/share/google-guest-agent" instance_configs.cfg
	install -m644 -Dt "$pkgdir/etc/default" instance_configs.cfg
}
