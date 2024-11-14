_pkgname=hardware-audio-processing
_reponame=valve-$_pkgname
pkgname=${_pkgname}-git
pkgver=0.56.r2.g024e0d1
pkgrel=1
pkgdesc='Valve Hardware Audio Processing'
arch=(x86_64)
url=https://gitlab.com/evlaV/$_reponame
license=(GPL2)
depends=(
    noise-suppression-for-voice
)
makedepends=(
    boost
    cmake
    make
    git
    ninja
    faust
    gcc
    ladspa
    lv2
    patch
    pkgconf
    qt5-base
    xz
)
source=(
    "git+${url}.git"
    "001-lib64-ladspa.patch"
    "002-confdir.patch"
    "pipewire-workaround.service"
    "wireplumber-workaround.service"
    )
b2sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    )

pkgver() {
    cd "$srcdir/$_reponame"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_reponame"
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply "../$src"
    done
}

build() {
    cd "$srcdir/$_reponame"
    make FAUSTINC="/usr/include/faust" FAUSTLIB="/usr/share/faust"
}

package() {
    cd "$srcdir/$_reponame"
    make DEST_DIR="$pkgdir" LIB_DIR="$pkgdir/usr/lib" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    xz --check=crc32 "$pkgdir/usr/lib/firmware/amd/sof/*" || true
    xz --check=crc32 "$pkgdir/usr/lib/firmware/amd/sof-tplg/*" || true

    rm -f "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/wireplumber-sysconf.service"
    rm -f "$pkgdir/etc/wireplumber"
    rm -f "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/pipewire-sysconf.service"
    rm -f "$pkgdir/etc/pipewire"

    # mkdir -p "$pkgdir/usr/libexec/hwsupport"
    install -dm755 "$pkgdir/usr/libexec/hwsupport"
    mv "$pkgdir/usr/share/wireplumber/hardware-profiles/wireplumber-hwconfig" "$pkgdir/usr/libexec/hwsupport/wireplumber-hwconfig"
    mv "$pkgdir/usr/share/pipewire/hardware-profiles/pipewire-hwconfig" "$pkgdir/usr/libexec/hwsupport/pipewire-hwconfig"

    install -Dm644 "$srcdir/pipewire-workaround.service" "$pkgdir/usr/lib/systemd/system/pipewire-workaround.service"
    install -Dm644 "$srcdir/wireplumber-workaround.service" "$pkgdir/usr/lib/systemd/system/wireplumber-workaround.service"

    rm "$pkgdir/usr/share/wireplumber/hardware-profiles/default"
    rm "$pkgdir/usr/share/pipewire/hardware-profiles/default"
}
