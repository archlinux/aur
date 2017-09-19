# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_basename='vcvrack'
_plugname='AudibleInstruments'

pkgname='vcvrack-audible-instruments-git'
pkgver=r21.31135d1
pkgrel=1
pkgdesc="Mutable Instruments' VCV modules"
url='https://github.com/VCVRack/AudibleInstruments'
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
    git+https://github.com/pichenettes/avr-audio-bootloader.git
    git+https://github.com/pichenettes/avril.git
    git+https://github.com/pichenettes/avrilx.git
    git+https://github.com/pichenettes/eurorack.git
    git+https://github.com/pichenettes/stm-audio-bootloader.git
    git+https://github.com/pichenettes/stmlib.git
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
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
    printf 'r%s.%s' "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
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

    cd AudibleInstruments
    git submodule init
    git config submodule.eurorack.url "$srcdir/eurorack"
    git submodule update

    cd eurorack
    git submodule init
    git config submodule.avr-audio-bootloader.url "$srcdir/avr-audio-bootloader"
    git config submodule.avril.url "$srcdir/avril"
    git config submodule.avrilx.url "$srcdir/avrilx"
    git config submodule.stm-audio-bootloader.url "$srcdir/stm-audio-bootloader"
    git config submodule.stmlib.url "$srcdir/stmlib"
    git submodule update
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
