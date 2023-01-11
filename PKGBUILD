# Maintainer: poly000 <1348292515@qq.com>
pkgname=yas-scanner
pkgver=0.1.11.a716391
pkgrel=1
pkgdesc="fast Artifact scanner for an specific anime game works well with GNOME/Wayland and all on X11"

arch=('any')

url="https://github.com/poly000/yas/tree/linux-x11-support"
license=(unknown)
depends=(xorg-xwininfo libxcb libx11 libxrandr)
makedepends=("cargo")
provides=("yas-scanner")
source=()

prepare() {
    if [ -d "yas" ]
    then
        cd yas
	git pull
    else
        git clone https://github.com/poly000/yas --branch linux-x11-support --depth 1
    fi
}

pkgver() {
    cd yas
    echo 0.1.11.$(git describe --always)
}

build() {
    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cd yas
    cargo build --release --locked --target-dir target
}

package() {
   cd yas
   install -Dm755 target/release/yas ${pkgdir}/usr/bin/yas-scanner
}
