pkgname=inkstitch
pkgver=3.3.0
pkgrel=4
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=('any')
url="https://inkstitch.org/"
license=('GPL-3.0-or-later')
fonts_commit=084eac038bf1af5a3a8b881a6cf0cc3340cf6e9b
makedepends=('gettext')
depends=('inkscape' 'python-colormath2' 'python-diskcache' 'python-flask'
         'python-fonttools' 'python-jinja' 'python-lxml' 'python-networkx'
         'python-numpy' 'python-platformdirs' 'python-pystitch' 'python-shapely'
         'python-trimesh' 'python-wxpython')
source=(
    "https://github.com/inkstitch/inkstitch/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/inkstitch/embroidery-fonts/archive/${fonts_commit}/inkstitch-fonts.tar.gz"
)
b2sums=(
    '02a5696d39333684ccc5dbf7311338e0f0aa540df66e4eec57c1524f782067ae1faef912fe90e6af847f38bdc3ff1105853a456bc5b29b6e4f2caa72352db7ef'
    'b9f672d2bbef7673bb5bddf700d637fb996a2b7fe06e5f49853c21c106b165809b529f41411d4a62473ffbcf663556127efe7277d0fe704e968fa517b52f872c'
)

prepare() {
    tar -xf inkstitch-fonts.tar.gz
    rm -r inkstitch-${pkgver}/fonts
    mv embroidery-fonts-${fonts_commit} inkstitch-${pkgver}/fonts
    # run in frozen/release mode and disable logging, avoids trying to write
    # logs into the read-only extension directory (see inkstitch#4002)
    cp "inkstitch-${pkgver}/DEBUG_template.toml" "inkstitch-${pkgver}/DEBUG.toml"
    sed -i 's/# disable_logging = true/disable_logging = true/g' "inkstitch-${pkgver}/DEBUG.toml"
    sed -i 's/# force_frozen = true/force_frozen = true/g' "inkstitch-${pkgver}/DEBUG.toml"
}

build() {
    cd "$srcdir/inkstitch-${pkgver}"
    GITHUB_REF="refs/tags/v${pkgver}" make PYTHON_EXECUTABLE=python inx
}

package() {
    cd "$srcdir/inkstitch-${pkgver}"
    install -dm755 "$pkgdir/usr/share/inkscape/extensions/inkstitch"
    cp -a DEBUG.toml inkstitch.py lib addons dbus fonts icons locales palettes symbols tiles \
          print inx VERSION LICENSE "$pkgdir/usr/share/inkscape/extensions/inkstitch/"
    find "$pkgdir/usr/share/inkscape/extensions/inkstitch" -name '__pycache__' -type d -prune -exec rm -rf {} \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/inkstitch/LICENSE"
}