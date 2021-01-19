# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Obarun PkgSrc : https://framagit.org/pkg/obmultilib/lib32-p11-kit
#----------------
# Contributor   : Florian Pritz <bluewind@xinu.at>
# Contributor   : Christoph Vigano <mail@cvigano.de>
# Arch PkgSrc   : https://www.archlinux.org/packages/multilib/x86_64/lib32-p11-kit
#----------------
# Website       : https://p11-glue.freedesktop.org/
#--------------------------------------------------------------------------------------

pkgname=lib32-p11-kit-nosystemd-minimal-git
pkgver=0.23.22
pkgrel=1
arch=(x86_64)
pkgdesc="Loads and enumerates PKCS#11 modules (32-bit library)"
license=(BSD)

track=tag
target=$pkgver
url="https://github.com/p11-glue/p11-kit"
source=("git+${url}")

provides=(
    'libp11-kit.so'
    'lib32-p11-kit')

conflicts=(lib32-p11-kit)

depends=(
    'lib32-glibc'
    'lib32-libtasn1'
    'lib32-libffi'
    'libp11-kit')

makedepends=(
    'git'
    'meson'
    'lib32-gcc-libs')

#--BUILDER-CONTROL---------------------------------------------------------------------

path=(
    --libdir=/usr/lib32
)

flags=(
    -Dbash_completion=disabled
    -Dsystemd=disabled
    -Dtrust_paths=/etc/ca-certificates/trust-source:/usr/share/ca-certificates/trust-source
)
#--------------------------------------------------------------------------------------

pkgver() {
   cd p11-kit
   git describe --tags | sed 's/-/+/g'
}


prepare() {
    cd "p11-kit"
}

build() {

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

    arch-meson p11-kit build --buildtype=release "${path[@]}" "${flags[@]}"        
    ninja $NINJAFLAGS -C build
}

#check() {
#    meson test -C build --print-errorlogs
#}

package() {
    DESTDIR="${pkgdir}" meson install -C build

    rm -rf "${pkgdir}"/etc "${pkgdir}"/usr/{bin,include,lib,share}

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s libp11-kit "${pkgdir}/usr/share/licenses/${pkgname}"
}

#--------------------------------------------------------------------------------------
sha512sums=('SKIP')
