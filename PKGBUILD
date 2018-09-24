# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

pkgname=epiphany-pantheon
pkgver=3.28.0.1+1ubuntu1+r21.dbc305d50
pkgrel=1
pkgdesc="GNOME web browser based on the WebKit rendering engine (with elementary OS patches)"
url="https://gitlab.gnome.org/GNOME/epiphany/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('webkit2gtk>=2.19.4' gcr libhttpseverywhere libdazzle gst-libav)
makedepends=(meson docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools autoconf-archive appstream-glib git)
groups=(pantheon)
replaces=(epiphany-pantheon-bzr)
provides=(epiphany="${pkgver}" epiphany-sync)
conflicts=(epiphany)
source=("git+https://github.com/elementary/os-patches.git#branch=epiphany-browser-bionic-patched"
        epiphany-sync{,.service})
sha256sums=('SKIP'
            'cf90f3ea93fff8c61f82da40c8d07d5db2f33dc9a0d91408a6ffc4142bbedd20'
            'ce1ac321d7bf9d88638634a141dfcb99119fc59ee44c4892e0874608e85006ba')

pkgver() {
    cd "os-patches"

    printf "3.28.0.1+1ubuntu1+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "os-patches"
    [ -d build ] && rm -rf build
    arch-meson build -Denable_https_everywhere=true
    ninja -C build
}

package() {
    cd "os-patches"
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm 755 {"${srcdir}","${pkgdir}"/usr/bin}/epiphany-sync
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/epiphany-sync.service
}
