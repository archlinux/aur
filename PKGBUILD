# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pedalboard
pkgver=0.9.22
pkgrel=1
pkgdesc='A Python library for adding effects to audio'
arch=(x86_64)
url='https://spotify.github.io/pedalboard/'
license=(GPL-3.0-only)
depends=(
  alsa-lib
  freetype2
  glibc
  libgcc
  libstdc++
  python
  python-numpy
)
makedepends=(
  git
  python-build
  python-installer
  python-scikit-build-core
  pybind11
  libsndfile
  libx11
  libxrandr
  libxinerama
  libxrender
  libxcomposite
  libxcursor
)
source=(
  "$pkgname::git+https://github.com/spotify/pedalboard#tag=v$pkgver"
  use-anonymous-git.patch
  'github.com-juce-framework-JUCE::git+https://github.com/juce-framework/JUCE'
  'github.com-BreakfastQuay-Rubberband::git+https://github.com/BreakfastQuay/Rubberband'
  'github.com-lameproject-lame::git+https://github.com/lameproject/lame'
  'github.com-timothytylee-libgsm::git+https://github.com/timothytylee/libgsm'
  'github.com-pybind-pybind11::git+https://github.com/pybind/pybind11'
)
sha512sums=('46b3652c72e6316a72afefbfd637c1675bf54de35f86f8b96f621f013e50a7e20823c795890e72b55bbf29600d594c8f8901e7acb3743724467acd38c99ae880'
            '5f35bed9ffab92de957404ea5312f72dce84c8eaa09074debeb9ad33eff940c0683495712e570c1bbc410e699226a2a4523954b95dc4b98e4970db04ab50eb5b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
b2sums=('5cdd54c00273b646104418cea8963b32fc5b402b79e3b477c2786cce56c8e7eb739399e4fe8111e46a946dad8e545c1b2843e206971513fc1958ff524c331ff0'
        '72cd382af54de31b91aac154574fdcfecb07239cea7c00331f44f6d59902b1b0f19d343114a83b16900402a8eb275ca7d909df051384c533008d6be33d69bac6'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd "$pkgname"

  # use anonymous git
  patch -p1 -i "$srcdir/use-anonymous-git.patch"

  # setup git submodules
  git submodule init
  git config submodule.JUCE.url "$srcdir/github.com-juce-framework-JUCE"
  git config submodule.vendors/rubberband.url "$srcdir/github.com-BreakfastQuay-Rubberband"
  git config submodule.vendors/lame.url "$srcdir/github.com-lameproject-lame"
  git config submodule.vendors/libgsm.url "$srcdir/github.com-timothytylee-libgsm"
  git config submodule.vendors/pybind11.url "$srcdir/github.com-pybind-pybind11"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
