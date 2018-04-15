# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_rackver=0.6.0
_plugname='AudibleInstruments'

pkgname='vcvrack-audible-instruments'
pkgver=0.6.0
pkgrel=1
pkgdesc="Mutable Instruments' VCV modules"
url='https://github.com/VCVRack/AudibleInstruments'
license=(BSD)
arch=(i686 x86_64)
depends=('vcvrack>=0.6')
makedepends=(git zip)
install="$pkgname.install"

source=(
    "vcvrack-$_plugname::git+https://github.com/VCVRack/$_plugname.git#tag=v$pkgver"
    "vcvrack::git+https://github.com/VCVRack/Rack.git#tag=v$_rackver"
    AndrewBelt-eurorack::git+https://github.com/AndrewBelt/eurorack.git
    git+https://github.com/AndrewBelt/osdialog.git
    git+https://github.com/AndrewBelt/oui-blendish.git
    git+https://github.com/memononen/nanosvg.git
    git+https://github.com/memononen/nanovg.git
    git+https://github.com/pichenettes/avr-audio-bootloader.git
    git+https://github.com/pichenettes/avril.git
    git+https://github.com/pichenettes/avrilx.git
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

    cd AudibleInstruments
    git submodule init
    git config submodule.eurorack.url "$srcdir/AndrewBelt-eurorack"
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
    cd "vcvrack/plugins/$_plugname"
    FLAGS='-I/opt/vcvrack/include' make dist
}

package() {
    cd "vcvrack/plugins/$_plugname"
    install -D -m644 "dist/$_plugname-$pkgver-lin.zip" \
        "$pkgdir/opt/vcvrack/$_plugname.zip"
}
