# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jason Edson <jaysonedson@gmail.com>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.40.1
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686'
      'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.64.0'
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
_frepobranch='rawhide'
_fcommit='6a2bc659a7e17400c8b3346cff6fbf669b84e1a5'
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
sha256sums=('0770cc7320d737fb2eaf9e4cf5ecc6a741f120b17b192f061f683e14b869d8e4'
            '672615edf1f8e5ede72bdfa2e671ad35d355a1df64f349762899ad7bc7254769'
            '5e3bd6238c1e33038ed5c43f130a14ad60e118e0f6a2fb29a119fbf6b441f992'
            '71e32b4db4c07dc3db0d8884f4f818abc6c9ada8f5f3609b0a2d3f8cd8919299'
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
