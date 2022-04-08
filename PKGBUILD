# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.0.5
pkgrel=1
pkgdesc="OpenPGP crypto tool and gui frontend for modern GnuPG"
arch=('x86_64')
url="https://github.com/saturneric/GpgFrontend"
license=('GPL3')
depends=('boost' 'gnupg' 'gpgme' 'libassuan' 'libconfig' 'libgpg-error' 'qt5-base')
makedepends=('cmake' 'ninja' 'git')
source=("${pkgname}::git+${url}#tag=v${pkgver}"
        "git+https://github.com/saturneric/vmime"
        "git+https://github.com/saturneric/json"
        "git+https://github.com/saturneric/easyloggingpp"
        "git+https://github.com/saturneric/Qt-AES"
        "git+https://github.com/saturneric/SmtpClient-for-Qt"
        "git+https://github.com/saturneric/libarchive"
        "git+https://github.com/saturneric/libconfig"
        "0000-link-against-shared.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'bd55e8ac0ad3786df12c1a7e8223e5d1b1bb6d7155d31b9597fcd703a9b92589')

prepare() {
    cd "$pkgname"

    git submodule init
    git config submodule.third_party/vmime.url "$srcdir/vmime"
    git config submodule.third_party/json.url "$srcdir/json"
    git config submodule.third_party/easyloggingpp.url "$srcdir/easyloggingpp"
    git config submodule.third_party/Qt-AES.url "$srcdir/Qt-AES"
    git config submodule.third_party/SmtpClient-for-Qt.url "$srcdir/SmtpClient-for-Qt"
    git config submodule.third_party/libarchive.url "$srcdir/libarchive"
    git config submodule.third_party/libconfig.url "$srcdir/libconfig"
    git submodule update

    patch -Np1 -i ../0000-link-against-shared.patch
}

build() {
    cd "$pkgname"

    cmake \
        -G Ninja \
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DGPGFRONTENT_GENERATE_LINUX_INSTALL_SOFTWARE=ON
    ninja -C build
}

package() {
    cd "$pkgname"

    # TODO: ninja has no install target currently, check if will be added in future release
    cp -dr --no-preserve='ownership' \
        "build/release/gpgfrontend/usr" \
        "$pkgdir/usr"
}
