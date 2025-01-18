# Maintainer: zeakz <zeakz@protonmail.com>
pkgname=nvidia-all-git
pkgver=1.0.0.r349.6c4ad5b
pkgrel=1
pkgdesc="TKG nvidia-all"
arch=('x86_64')
url="https://github.com/Frogging-Family/nvidia-all"
license=('MIT')
depends=('git' 'base-devel')
makedepends=('git')
install=${pkgname}.install

source=("git+https://github.com/Frogging-Family/nvidia-all.git#branch=master")

sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/nvidia-all"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/nvidia-all"
    # Ensure the repository is up to date
    git pull --rebase || true
}

build() {
    cd "${srcdir}/nvidia-all"
    # Run makepkg within the cloned repository
    makepkg -f
}

package() {
    cd "${srcdir}/nvidia-all"
    # Package the resulting files after build
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    
    # Copy the built packages and build files
    find . -name "*.pkg.tar.zst" -exec cp {} "${pkgdir}/usr/share/${pkgname}/" \;
    cp PKGBUILD "${pkgdir}/usr/share/${pkgname}/"
    [[ -d patches ]] && cp -r patches "${pkgdir}/usr/share/${pkgname}/"
    cp -r ./*.install "${pkgdir}/usr/share/${pkgname}/" 2>/dev/null || true
}
