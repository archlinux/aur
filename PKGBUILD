# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Rami Chowdhury <rami.chowdhury@gmail.com>
# Maintainer: cvnb
pkgname=gerbil-scheme
_pkgname=gerbil
pkgver=0.18.1
pkgrel=2
pkgdesc="Opinionated dialect of Scheme designed for systems programming, on the Gambit runtime."
arch=(x86_64 i686)
url="https://github.com/mighty-gerbils/gerbil"
license=('LGPLv2.1' 'Apache 2.0')
depends=('openssl' 'zlib' 'sqlite')
conflicts=('gerbil-scheme-git')
source=("git+$url#tag=v$pkgver" https://github.com/mighty-gerbils/gerbil/commit/2ce62e8f70f1ee1168715dcc11f141054ec03cdb.patch)
sha512sums=('SKIP'
            'f020003f21a18f4045892e57970d4cb92b455647890a21d33e6cb5f345cfe639559da901f0803ba50a5e251ccfdd872491394745a01294ae05fd6fb9068597c8')

prepare() {
    cd "$_pkgname"
    patch --forward --strip=1 --input=../../2ce62e8f70f1ee1168715dcc11f141054ec03cdb.patch
}

build() {
    cd "$_pkgname"

    echo "Configuring..."
    ./configure --prefix="/opt/gerbil"

    echo "Building..."
    make
}

package() {
    echo "Packaging..."

    cd "$_pkgname"
    make DESTDIR=${pkgdir} install

    mkdir -p ${pkgdir}/etc/profile.d/
    cat <<'EOF' > ${pkgdir}/etc/profile.d/gerbil-scheme.sh
export PATH=/opt/gerbil/bin:$PATH
EOF
}