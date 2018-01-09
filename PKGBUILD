# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_rackver=0.5.1
_plugname='Fundamental'

pkgname='vcvrack-fundamental'
pkgver=0.5.1
pkgrel=1
pkgdesc='Fundamental VCV modules'
url='https://github.com/VCVRack/Fundamental'
license=(BSD)
arch=(i686 x86_64)
depends=(vcvrack)
makedepends=(git)

source=(
    "vcvrack-$_plugname::git+https://github.com/VCVRack/$_plugname.git#tag=v$pkgver"
    "vcvrack::git+https://github.com/VCVRack/Rack.git#tag=v$_rackver"
    git+https://github.com/AndrewBelt/osdialog.git
    git+https://github.com/AndrewBelt/oui-blendish.git
    git+https://github.com/mackron/dr_libs.git
    git+https://github.com/memononen/nanosvg.git
    git+https://github.com/memononen/nanovg.git
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
)

prepare() {
    cd vcvrack
    git submodule init
    git config submodule.ext/dr_libs.url "$srcdir/dr_libs"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git submodule update

    cd plugins
    git clone "$srcdir/vcvrack-$_plugname" "$_plugname"
}

build() {
    cd "vcvrack/plugins/$_plugname"
    make
}

package() {
    cd "vcvrack/plugins/$_plugname"
    install -D -m644 -t "$pkgdir/usr/share/licenses/vcvrack/$_plugname" LICENSE*
    install -d "$pkgdir/opt/vcvrack/plugins/$_plugname"
    cp -dr --preserve=mode -t "$pkgdir/opt/vcvrack/plugins/$_plugname" \
        res plugin.so
}
