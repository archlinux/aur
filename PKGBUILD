# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=4msCompany
_name=4ms-vcv
pkgname=vcvrack-4ms
pkgver=2.0.11
pkgrel=1
pkgdesc='4ms VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/4ms/4ms-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(cmake git simde zstd)
source=("git+https://github.com/4ms/$_name#tag=vcv-v$pkgver"
        'git+https://github.com/4ms/cpputil'
        'git+https://github.com/4ms/metamodule-patch-serial'
        'git+https://github.com/4ms/metamodule-core-interface'
        'git+https://github.com/4ms/metamodule-core-modules'
        'git+https://github.com/google/flatbuffers'
        'git+https://github.com/danngreen/rapidyaml'
        'git+https://github.com/biojppm/c4core'
        'git+https://github.com/biojppm/cmake'
        'sdk-fixes.patch')
sha256sums=('3dd6725716dc718b61c8fb3687b36e0d6bfe4aab3eaf08163ef64198b8fc1f98'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '53c7ff84b0d7c05e1ff2245ff5833595c347a11ff1c7bf71201fd7628f9edd16')

prepare() {
  cd $_name
  # RackSDK.cmake expects different path
  patch -p1 -i ../sdk-fixes.patch
  # submodules
  git submodule init
  git config submodule.lib/cpputil.url "$srcdir"/cpputil
  git config submodule.lib/patch-serial.url "$srcdir"/metamodule-patch-serial
  git config submodule.lib/metamodule-core-interface.url "$srcdir"/metamodule-core-interface
  git config submodule.lib/CoreModules.url "$srcdir"/metamodule-core-modules
  git config submodule.lib/flatbuffers.url "$srcdir"/flatbuffers
  git -c protocol.file.allow=always submodule update
  pushd lib/patch-serial
  git submodule init
  git config submodule.ryml/rapidyaml.url "$srcdir"/rapidyaml
  git -c protocol.file.allow=always submodule update
  pushd ryml/rapidyaml
  git submodule init
  git config submodule.ext/c4core.url "$srcdir"/c4core
  git -c protocol.file.allow=always submodule update
  pushd ext/c4core
  git submodule init
  git config submodule.cmake.url "$srcdir"/cmake
  git -c protocol.file.allow=always submodule update
  popd
  popd
  popd
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE-GPL-v3.txt
}
