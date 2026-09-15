# Maintainer: N3oRay <n3oray77 at gmail dot com>
pkgname=proton-autogen
pkgver=3.3.8
pkgrel=1
pkgdesc="Automatic Proton/Wine launcher for Windows executables"
arch=('any')
url="https://github.com/N3oRay/proton-autogen"
license=('MIT')

depends=(
    python
    python-gobject
    python-pyyaml
    python-rich
    python-requests
    python-psutil
    python-xlib
    gtk4
    gdk-pixbuf2
    graphene
)

optdepends=(
    'steam: Proton runtime'
    'wine: Wine fallback'
    'mangohud: Performance overlay'
    'gamemode: Game optimization'
    'gamescope: Micro-compositor'
    'dolphin: Dolphin file manager integration'
    'nemo: Nemo file manager integration'
)

makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)

source=("proton-autogen-${pkgver}.tar.gz::https://github.com/N3oRay/proton-autogen/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('239eba0c7d2051877829665ddd16ad849d30190d02f385c211074b7f88c37846')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

package() {
cd "$srcdir/$pkgname-$pkgver"


# Installation du package Python et de ses ressources
python -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

# Lanceur
install -Dm755 \
    usr/bin/proton-autogen \
    "$pkgdir/usr/bin/proton-autogen"

# Ressources partagées
if [[ -d usr/share/proton-autogen ]]; then
    install -dm755 \
        "$pkgdir/usr/share/proton-autogen"

    cp -a \
        usr/share/proton-autogen/. \
        "$pkgdir/usr/share/proton-autogen/"
fi

# Desktop
install -Dm644 \
    usr/share/applications/proton-autogen.desktop \
    "$pkgdir/usr/share/applications/proton-autogen.desktop"

# Icône
install -Dm644 \
    usr/share/icons/hicolor/256x256/apps/proton-autogen.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/proton-autogen.png"

install -Dm644 \
    usr/share/icons/hicolor/256x256/apps/proton-autogen.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.N3oRay.ProtonAutogen.png"

# Page de manuel
install -Dm644 \
    debian/proton-autogen.1.gz \
    "$pkgdir/usr/share/man/man1/proton-autogen.1.gz"

# Dolphin / KDE
install -Dm644 \
    usr/share/kio/servicemenus/proton-autogen.desktop \
    "$pkgdir/usr/share/kio/servicemenus/proton-autogen.desktop"

# Nemo
install -Dm644 \
    usr/share/nemo/actions/proton-autogen.nemo_action \
    "$pkgdir/usr/share/nemo/actions/proton-autogen.nemo_action"

# Licence
install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


}

