# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=obs-urlsource
pkgver=0.3.7
pkgrel=1
pkgdesc='OBS plugin to fetch data from a URL or file, connect to an API or AI service, parse responses and display text, image or audio on scene'
arch=(x86_64)
url='https://obsproject.com/forum/resources/url-api-source-live-data-media-and-ai-on-obs-made-simple.1756/'
license=('GPL-2.0-only')
depends=('obs-studio' 'qt6-base' 'curl' 'pugixml')
makedepends=('git' 'cmake' 'gcc')
source=("git+https://github.com/royshil/obs-urlsource.git#tag=$pkgver"
        "git+https://github.com/pantor/inja.git#commit=67d6fea2b7fe6b032891d8fb32bb07fb7353f695"
        "git+https://github.com/danielaparker/jsoncons.git#commit=62e38581f7a208314cb7dd52f0b0ff2473de3cb2")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd obs-urlsource
    git submodule init
    git config submodule.vendor/inja.url "$srcdir/inja"
    git config submodule.vendor/jsoncons.url "$srcdir/jsoncons"
    git -c protocol.file.allow=always submodule update
}

build() {
    export CFLAGS="$CFLAGS -Wno-error=deprecated-declarations"
    export CXXFLAGS="$CXXFLAGS -Wno-error=deprecated-declarations"

    cmake -B build -S obs-urlsource \
        -W no-dev \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_FRONTEND_API=ON \
        -DENABLE_QT=ON \
        -DUSE_SYSTEM_CURL=ON \
        -DUSE_SYSTEM_PUGIXML=ON \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
