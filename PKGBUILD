# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jason Edson <jaysonedson@gmail.com>

pkgbase='vte3-notification'
pkgname=("${pkgbase}" 'vte-notification-common')
pkgver=0.66.0
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal/VTE'
license=('LGPL')
depends=('fribidi'
         'gnutls'
         'gtk3'
         'pcre2'
         'systemd-libs')
makedepends=('git'
             'gobject-introspection'
             'gtk-doc'
             'meson'
             'vala'
             'gperf')
options=('!emptydirs')

# Fedora patches: https://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='rawhide'
_fpatchfile100='vte291-cntnr-precmd-preexec-scroll.patch'
_fpatchfile101='vte-0.66.0-prompt-command.patch'
_fcommit='a2cb2d3c99d080b0a89103d383d6a898c9d647ff'

# VTE source ref
_vtetag=${pkgver}

source=(
    "git+https://git.gnome.org/browse/vte#tag=$_vtetag"
    "${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
    "${_fpatchfile101}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile101}"
)

sha256sums=('SKIP'
            '58acc72f083a48fea11b04c29b254e7ea411996a3ecda1621002a4730fde6c08'
            'ea8b5384374817a00940cd3c3a64f2da08b55a995a3f992caa0089e98d42b3e3')

prepare () {
    cd "vte"

    patch -p1 -i "../${_fpatchfile101}-${_fcommit}"
    patch -p1 -i "../${_fpatchfile100}-${_fcommit}"
}

build() {
    arch-meson vte build \
        -D b_lto=false \
        -D docs=true
    meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_vte3-notification(){
    depends+=('vte-notification-common')
    provides=("vte3=${pkgver}")
    conflicts=('vte3')

    DESTDIR="${pkgdir}" meson install -C build

    _pick vte-common "$pkgdir"/etc/profile.d
    _pick vte-common "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
}

package_vte-notification-common() {
    depends=('sh')
    pkgdesc='Common files used by vte and vte3'
    arch=('any')
    provides=("vte-common=${pkgver}")
    conflicts=('vte-common')

    mv vte-common/* "$pkgdir"
}
