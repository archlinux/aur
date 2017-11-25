# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_basename='vcvrack'
_plugname='Fundamental'

pkgname='vcvrack-fundamental-git'
pkgver=0.4.0.r30.gb6a321a
pkgrel=1
pkgdesc='Fundamental VCV modules'
url='https://github.com/VCVRack/Fundamental'
license=(BSD)
arch=(i686 x86_64)
depends=(vcvrack-git)
makedepends=(git)

source=(
    "$_basename-$_plugname::git+https://github.com/VCVRack/$_plugname.git"
    "$_basename::git+https://github.com/VCVRack/Rack.git"
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

pkgver() {
    cd "$_basename-$_plugname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_basename"
    git submodule init
    git config submodule.ext/dr_libs.url "$srcdir/dr_libs"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git submodule update

    cd plugins
    git clone "$srcdir/$_basename-$_plugname" "$_plugname"
}

build() {
    cd "$_basename/plugins/$_plugname"
    make
}

package() {
    cd "$_basename/plugins/$_plugname"
    install -D -m644 -t "$pkgdir/usr/share/licenses/$_basename/$_plugname" LICENSE*
    install -d "$pkgdir/opt/$_basename/plugins/$_plugname"
    cp -dr --preserve=mode -t "$pkgdir/opt/$_basename/plugins/$_plugname" \
        res plugin.so
}
