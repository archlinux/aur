# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.1.0
pkgrel=2
pkgdesc="OpenPGP crypto tool and gui frontend for modern GnuPG"
arch=('x86_64')
url="https://github.com/saturneric/GpgFrontend"
license=('GPL3')
depends=('gnupg' 'gpgme' 'libarchive' 'libassuan' 'libconfig' 'libgpg-error' 'qt6-base' 'qt6-5compat')
makedepends=('cmake' 'ninja' 'git' 'boost')
source=("${pkgname}::git+${url}#tag=v${pkgver}"
        "git+https://git.bktus.com/GpgFrontend/json.git"
        "git+https://git.bktus.com/GpgFrontend/Qt-AES.git"
        "git+https://git.bktus.com/GpgFrontend/spdlog.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
_cherry_picks=(
    # fix: unlfs for github
    'e60faa7569b3188f59f358a8c94a030ed6ba4272')

prepare() {
    cd "$pkgname"

    git reset --hard
    git cherry-pick --abort || true

    for cp in "${_cherry_picks[@]}"; do
        git cherry-pick --no-commit "$cp"
    done

    git submodule init
    git config submodule.third_party/json.url "$srcdir/json"
    git config submodule.third_party/qt-aes.url "$srcdir/Qt-AES"
    git config submodule.third_party/spdlog.url "$srcdir/spdlog"

    # https://bugs.archlinux.org/task/76255
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"

    cmake \
        -G Ninja \
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DGPGFRONTEND_GENERATE_LINUX_INSTALL_SOFTWARE=ON
    ninja -C build
}

package() {
    cd "$pkgname"

    DESTDIR="$pkgdir" ninja -C build install
}
