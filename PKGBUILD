# Maintainer: N3oRay <n3oray77 at gmail dot com>
pkgname=proton-autogen
pkgver=3.4.7
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
    glycin
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
    'python-nautilus: Nautilus file manager integration'
)

makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)

source=("proton-autogen-${pkgver}.tar.gz::https://github.com/N3oRay/proton-autogen/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('926f7b39eed20d9d4ed33e3dda9a2df6dd68a9689f8451f5117443f84ffa33d5')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # pyproject.toml est resté en 3.4.2 dans le tag v3.4.5 : on aligne la
    # version du wheel sur pkgver. À retirer une fois pyproject.toml corrigé
    # en amont.
    sed -i "s/^version = \".*\"/version = \"$pkgver\"/" pyproject.toml
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Package Python et ses ressources (locales, CSS, images, SVG)
    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    # Lanceur
    install -Dm755 \
        usr/bin/proton-autogen \
        "$pkgdir/usr/bin/proton-autogen"

    # Ressources partagées (docs, profiles.csv)
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

    # Nemo : action « Ajouter à Proton-Autogen » (proton-autogen addux)
    install -Dm644 \
        usr/share/nemo/actions/proton-autogen-addux.nemo_action \
        "$pkgdir/usr/share/nemo/actions/proton-autogen-addux.nemo_action"

    # Nautilus (extension python-nautilus)
    install -Dm644 \
        usr/share/nautilus-python/extensions/proton_autogen_nautilus.py \
        "$pkgdir/usr/share/nautilus-python/extensions/proton_autogen_nautilus.py"

    # Licence
    install -Dm644 \
        LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

