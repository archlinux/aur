# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jason Edson <jaysonedson@gmail.com>

pkgbase=vte3-notification
pkgname=(${pkgbase} vte-notification-common)
pkgver=0.66.2
pkgrel=3
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
url='https://wiki.gnome.org/Apps/Terminal/VTE'
license=(LGPL)
arch=(i686
      x86_64)
depends=(fribidi
         gnutls
         gtk3
         pcre2
         systemd-libs)
makedepends=(git
             gobject-introspection
             gtk-doc
             meson
             vala
             gperf)
options=(!emptydirs)

# Fedora patches: https://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='rawhide'
_fpatchfile100='vte291-cntnr-precmd-preexec-scroll.patch'
_fcommit='77371af24cd2f8e911ec522cf38764f58f8925ec'

# VTE source ref
_vtetag=${pkgver}

source=(
    "git+https://gitlab.gnome.org/GNOME/vte#tag=$_vtetag"
    "${_fpatchfile100}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile100}"
)

sha256sums=('SKIP'
            'b732fbf452de5abd5d78e9126a87d87686ccb473dbabf34ef794b0a955c0f892')

prepare () {
    cd $srcdir/vte

    # Apply patches
    patch -p1 -i "../${_fpatchfile100}-${_fcommit}"
}

build() {
    arch-meson build vte \
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
    depends+=(vte-notification-common)
    provides=(vte3=${pkgver} libvte-2.91.so)
    conflicts=(vte3)

    meson install -C build --destdir "$pkgdir"

    _pick vte-common "$pkgdir"/etc/profile.d
    _pick vte-common "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
}

package_vte-notification-common() {
    depends=(sh)
    pkgdesc='Common files used by vte and vte3'
    arch=(any)
    provides=(vte-common=${pkgver})
    conflicts=(vte-common)

    mv vte-common/* "$pkgdir"
}
