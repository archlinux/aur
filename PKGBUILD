# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jason Edson <jaysonedson@gmail.com>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.38.1
pkgrel=5
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686'
      'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.62.3'
         'gsettings-desktop-schemas')
makedepends=('git'
             'appstream-glib'
             'docbook-xsl'
             'intltool'
             'itstool'
             'libnautilus-extension'
             'gnome-shell'
             'vala'
             'yelp-tools')
optdepends=('gconf: for gnome-terminal-migration'
            'libnautilus-extension: for "Open Terminal Here" in GNOME Files')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')

# Fedora patches: https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/gnome-terminal'
_frepobranch='f34'
_fcommit='9bd5071a07c839d3ab0571e361be1bcadea4a70a'
_fpatchfile100='0001-build-Don-t-treat-warnings-as-errors.patch'
_fpatchfile101='gnome-terminal-cntr-ntfy-autottl-ts.patch'
_fpatchfile000='gnome-terminal-backports-from-upstream.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'

source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
	"${_fpatchfile101}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile101}"
	"${_fpatchfile000}-${_fcommit}::${_frepourl}/raw/${_frepobranch}/f/${_fpatchfile000}"
	"${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=('d998d4824f38847fdd74bad6b5f09cc8e11b9de8e2a284a439af290714ddf3d1'
            '672615edf1f8e5ede72bdfa2e671ad35d355a1df64f349762899ad7bc7254769'
            '4ef6493b604505cb2005a851b152d7bfece167bb1262e1ea2bcbddda1cec977f'
            'a93ae654da28fa8ee3dbda9d0231a22dc670e3a9891e2a7bf0406559f47898bf'
            'a4a22834d6524fb697a8edf91c9489617d5ab2e513413fc84c6b8575320938f9')

prepare () {
    cd "${_pkgname}-${pkgver}"

    patch -p1 -i "../${_fpatchfile000}-${_fcommit}"
    patch -p1 -i "../${_fpatchfile101}-${_fcommit}"
    patch -p1 -i "../${_fpatchfile100}-${_fcommit}"

    NOCONFIGURE=1 autoreconf -fvi
}

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --libexecdir=/usr/lib/${_pkgname} \
                --disable-silent-rules \
                --disable-static \
                --with-nautilus-extension
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd "${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    install -Dm644 "../${_fgsoverridefile}-${_fcommit}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${_fgsoverridefile}"
}
