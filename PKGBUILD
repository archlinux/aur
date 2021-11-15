# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Rami Chowdhury <rami.chowdhury@gmail.com>
pkgname=gerbil-scheme
pkgver=0.16
pkgrel=1
pkgdesc="Gerbil is an opinionated dialect of Scheme designed for systems programming, with a state of the art macro and module system on top of the Gambit runtime."
arch=(x86_64 i686)
url="https://github.com/vyzo/gerbil"
license=('LGPLv2.1' 'Apache 2.0')
groups=()
depends=('openssl' 'zlib' 'sqlite' 'gambit-c>=4.9.3')
# makedepends=('git')
optdepends=('libxml' 'libyaml' 'mysql' 'lmdb' 'leveldb')
conflicts=('gerbil-scheme-git')
install=
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('46782b4b71a3b437501b825f2f164e53b285d3a4cdba8f04485edaaa589d8500535c06a47a1464fc537ab7546413dde37c8d6a16a5e076a99ccf255905ed105d')

noextract=()
#generate with 'makepkg -g'

TARGET_DIR="/opt/gerbil-scheme"

pkg_installed() {
    pacman -Qq $1 >/dev/null 2>&1
}

build() {
    export GERBIL_BUILD_CORES=$(nproc)

    # The compile process expects `gsc` to be the Gambit compiler,
    # but the Arch package doesn't install that binary (it belongs
    # to Ghostscript). So hack around it
    msg "Creating hacky gerbil-bin..."
    if [ ! -d /tmp/gerbil-bin ]; then
        mkdir -p /tmp/gerbil-bin
        ln -s /usr/bin/gambitc /tmp/gerbil-bin/gsc
    fi
    export PATH=/tmp/gerbil-bin:$PATH

    cd "$srcdir/gerbil-$pkgver/src"
    msg "Looking for optional dependencies..."

    _enabled_features=""
    if pkg_installed libxml2; then
        _enabled_features+=" --enable-libxml"
    fi
    if pkg_installed libyaml; then
        _enabled_features+=" --enable-libyaml"
    fi
    if pkg_installed mysql; then
        _enabled_features+=" --enable-mysql"
    fi
    if pkg_installed lmdb; then
        _enabled_features+=" --enable-lmdb"
    fi
    if pkg_installed leveldb; then
        _enabled_features+=" --enable-leveldb"
    fi

    msg "Configuring..."
    ./configure \
        --prefix="${pkgdir}${TARGET_DIR}" \
        $_enabled_features
    # --with-gambit=/usr/bin/gambitc

    msg "Building..."
    ./build.sh

    msg "Cleaning up gerbil-bin..."
    if [ -d /tmp/gerbil-bin ]; then
        rm -rf /tmp/gerbil-bin
    fi
}

package() {
    msg "Installing..."
    cd "$srcdir/gerbil-$pkgver/src"
    mkdir -p "${pkgdir}/${TARGET_DIR}"
    ./install

    mkdir -p ${pkgdir}/etc/profile.d/
    cat <<EOF >${pkgdir}/etc/profile.d/gerbil-scheme.sh
#!/bin/bash
export GERBIL_HOME=${TARGET_DIR}
export PATH=${TARGET_DIR}/bin:$PATH
EOF
}
