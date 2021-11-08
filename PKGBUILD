# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jason Edson <jaysonedson@gmail.com>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.42.1
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686'
      'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.66.0'
         'gsettings-desktop-schemas')
makedepends=('git'
             'docbook-xsl'
             'libnautilus-extension'
             'gnome-shell'
             'meson'
             'yelp-tools')
optdepends=('gconf: for gnome-terminal-migration'
            'libnautilus-extension: for "Open Terminal Here" in GNOME Files')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')

# Fedora patches: https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/gnome-terminal'
_frepobranch='rawhide'
_fcommit='6ce4c343f37e66397e42a4c1bfded7e083fd1bea'
_fpatchfile100='gnome-terminal-cntr-ntfy-autottl-ts.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'

source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
	"${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=('c319b1405501b8c7693e616f48eced41695d2e786148ca5f9e27bc7d98f4aeb1'
            '0b6adf6f8ec31c88044c349fe0e6d10a3cfce96896fd8a655a547fd55ca33838'
            'a4a22834d6524fb697a8edf91c9489617d5ab2e513413fc84c6b8575320938f9')

prepare () {
    cd "${_pkgname}-${pkgver}"

    patch -p1 -i "../${_fpatchfile100}-${_fcommit}"
}

build() {
    arch-meson gnome-terminal-${pkgver} build \
        -D b_lto=false \
        -D docs=true \
        -Dnautilus_extension=true \
        -Dsearch_provider=true
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build

    install -Dm644 "../${_fgsoverridefile}-${_fcommit}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${_fgsoverridefile}"
}
