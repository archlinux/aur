# Maintainer : silverhikari
# Contributor: Elijah Gregg <lovetocode999@ctrl-c.club>
# Contributor: Alexandros Theodotou <alex@zrythm.org>
pkgname=zrythm-git
pkgver=4.13.31.r9.g472e168fc
pkgrel=1
epoch=2
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('lilv' 'libx11' 'libsndfile' 'libsamplerate' 'alsa-lib' 'fftw'
         'suil' 'breeze-icons' 'lv2' 'rubberband' 'python-sphinx-furo' 'python-sphinx-copybutton' 'python-sphinxcontrib-svg2pdfconverter'
         'xxhash' 'vamp-plugin-sdk' 'carla-git' 'gtk4' 'guile' 'libadwaita' 'gtksourceview5' 'pcre' 'libpulse' 'curl' 'libaudec' 'json-glib' 'libcyaml' 'reproc' 'libpanel' 'boost' 'lsp-dsp-lib' 'zstd' 'zix-git')
makedepends=('python' 'gettext' 'sed' 'python-sphinx-intl'
             'meson' 'ninja' 'help2man' 'python-sphinx'
             'ladspa' 'lv2' 'cmake' 'sassc')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs'
            'jack: for jack backend'
            'graphviz: process graph export'
            'sdl2: audio backend')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=('!strip')
source=("zrythm::git+https://gitlab.zrythm.org/zrythm/zrythm")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v1.0.0.beta.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    meson setup build --prefix=/usr -Dmanpage=true -Dcarla=enabled
    ninja -C build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    ninja -C build test
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -vDm 644 AUTHORS CONTRIBUTING.md CHANGELOG.md README.md THANKS TRANSLATORS \
        -t "${pkgdir}/usr/share/doc/${pkgname}/"
    DESTDIR="${pkgdir}/" ninja -C build install
}
