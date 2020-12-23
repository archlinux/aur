# Obarun        : 66 init/supervisor
# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Obarun PkgSrc : https://framagit.org/pkg/obcore/p11-kit/
#----------------
# Contributor   : Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor   : Ionut Biru <ibiru@archlinux.org>
# Arch PkrSrc   : https://www.archlinux.org/packages/core/x86_64/p11-kit/
#-----------------------------------------------------------------------
# Website       : https://p11-glue.freedesktop.org/
#-----------------------------------------------------------------------
#--DESCRIPTION----------------------------------------------------------

pkgname=(p11-kit-nosystemd-minimal-git libp11-kit-nosystemd-minimal-git)

pkgdesc="Loads and enumerates PKCS#11 modules"

pkgver=0.23.22
pkgrel=1

arch=(x86_64)

url='https://github.com/p11-glue/p11-kit'

track="tag"
target="$pkgver"
source=("git+$url")

#--BUILD CONFIGURATION--------------------------------------------------

makedepends=(
#    'gtk-doc'
    'git'
    'meson'
    'libtasn1'
    'libffi')

#--BUILD PREPARATION----------------------------------------------------

pkgver() {
   cd p11-kit
   git describe --tags | sed 's/-/+/g'
}


prepare() {
    cd p11-kit
}

#--BUILD CONTROL--------------------------------------------------------

_flags=(
    -Dgtk_doc=false
    -Dman=false
    -Dsystemd=disabled
    -Dbash_completion=disabled
    -Dtrust_paths=/etc/ca-certificates/trust-source:/usr/share/ca-certificates/trust-source
)

#--BUILD----------------------------------------------------------------

build() {
    arch-meson p11-kit build --buildtype=release "${_flags[@]}"
    meson compile -C build
}

#--CHECK----------------------------------------------------------------

#check() {
#    meson test -C build --print-errorlogs
#}

#--SPLIT----------------------------------------------------------------

_pick() {
    local p="$1" f d; shift
    for f; do
      d="$srcdir/$p/${f#$pkgdir/}"
      mkdir -p "$(dirname "$d")"
      mv "$f" "$d"
      rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

#--PACKAGE--------------------------------------------------------------

package_p11-kit-nosystemd-minimal-git() {
    depends=('coreutils')

    provides=(p11-kit)
    conflicts=(p11-kit)

    DESTDIR="$pkgdir" meson install -C build
    ln -srf "$pkgdir/usr/bin/update-ca-trust" "$pkgdir/usr/lib/p11-kit/trust-extract-compat"

    ## Split libp11-kit
    _pick lib "$pkgdir"/usr/include
    _pick lib "$pkgdir"/usr/lib/{p11-kit-proxy.so,libp11-kit.*}
    _pick lib "$pkgdir"/usr/lib/{pkcs11,pkgconfig}
    _pick lib "$pkgdir"/usr/share/{locale,p11-kit}

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit/COPYING
}

package_libp11-kit-nosystemd-minimal-git() {
    pkgdesc+=" (library)"
    depends=('glibc' 'libtasn1' 'libffi')
    provides=('libp11-kit.so' 'libp11-kit')
    conflicts=('libp11-kit')

    mv lib/* "$pkgdir"

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit/COPYING
}

#--SECURITY AND LICENCE-------------------------------------------------
sha256sums=('SKIP')

license=(BSD)
