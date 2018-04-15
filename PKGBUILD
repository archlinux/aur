# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_rackver=0.6.0
_plugname='Befaco'

pkgname='vcvrack-befaco'
pkgver=0.6.0
pkgrel=1
pkgdesc="Befaco's VCV modules"
url='https://github.com/VCVRack/Befaco'
license=(BSD)
arch=(i686 x86_64)
depends=('vcvrack>=0.6')
makedepends=(git zip)
install="$pkgname.install"

source=(
    "vcvrack-$_plugname::git+https://github.com/VCVRack/$_plugname.git#tag=v$pkgver"
    "vcvrack::git+https://github.com/VCVRack/Rack.git#tag=v$_rackver"
    git+https://github.com/AndrewBelt/osdialog.git
    git+https://github.com/AndrewBelt/oui-blendish.git
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
)

prepare() {
    cd vcvrack
    git submodule init
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
    sed -i 's/FLAGS =/FLAGS +=/' Makefile
    FLAGS='-I/opt/vcvrack/include' make dist
}

package() {
    cd "vcvrack/plugins/$_plugname"
    install -D -m644 "dist/$_plugname-$pkgver-lin.zip" \
        "$pkgdir/opt/vcvrack/$_plugname.zip"
}
