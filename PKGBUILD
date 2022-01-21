# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Rami Chowdhury <rami.chowdhury@gmail.com>
pkgname=gerbil-scheme
pkgver=0.17
pkgrel=1
pkgdesc="Opinionated dialect of Scheme designed for systems programming, on the Gambit runtime."
arch=(x86_64 i686)
url="https://github.com/vyzo/gerbil"
license=('LGPLv2.1' 'Apache 2.0')

depends=('openssl' 'zlib' 'sqlite' 'gambit-c>=4.9.3')
# makedepends=('git')
optdepends=('libxml2: XML / HTML support'
            'libyaml: YAML serialization support'
            'mysql: additional SQL database support'
            'lmdb: key/value store support'
            'leveldb: key/value store support')
conflicts=('gerbil-scheme-git')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "install.patch")
sha512sums=('c23d5ead0b23991181c977b9fe5784df5ba9ee46221b44a3f3a194d7669b7fb1268b9bfa310f5cfd1c994036f2fbee2f8611c9bce556f1c235e17babc31ce43d'
            'ea220f3f0d8c23e8a859d4ce119dd4685f45730775d9f3be841deddc70345313f84d841e78bfe79d8fffd413a2b4408d19e65ca50c041a248f912deba4f9ce2a')

pkg_installed() {
    pacman -Qq $1 >/dev/null 2>&1
}

prepare() {
    cd "gerbil-$pkgver"
    patch --fuzz=3 --strip=2 < "${srcdir}/install.patch"
}

build() {
    export GERBIL_BUILD_CORES=$(nproc)
    # The compile process expects `gsc` to be the Gambit compiler,
    # but the Arch package doesn't install that binary (it belongs
    # to Ghostscript).
    export GERBIL_GSC=gambitc

    cd "$srcdir/gerbil-$pkgver/src"
    echo "Looking for optional dependencies..."

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

    echo "Configuring..."
    ./configure \
        --prefix="${pkgdir}/opt/gerbil-scheme" \
        $_enabled_features

    echo "Building..."
    ./build.sh
}

package() {
    echo "Installing..."

    cd "$srcdir/gerbil-$pkgver/src"
    mkdir -p "${pkgdir}/opt/gerbil-scheme"
    ./install

    mkdir -p ${pkgdir}/etc/profile.d/
    cat <<EOF >${pkgdir}/etc/profile.d/gerbil-scheme.sh
#!/bin/bash
export GERBIL_GSC=/usr/bin/gambitc
export GERBIL_HOME=/opt/gerbil-scheme
export PATH=/opt/gerbil-scheme/bin:\$PATH
EOF
    chmod +x ${pkgdir}/etc/profile.d/gerbil-scheme.sh
}
