# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rkbin-git
pkgname=rkbin-git
pkgver=r1826.a2a0b89
pkgrel=7
epoch=
pkgdesc="Rockchip Firmware and Tool Binarys"
arch=('x86_64')
url="https://github.com/rockchip-linux/rkbin"
license=('Commercial')
groups=()
depends=(
    'bash'
    'gcc-libs'
    'glibc'
    'libusb')
makedepends=('git')
checkdepends=()
optdepends=()
provides=(rkbin)
conflicts=(rkbin)
replaces=(rkbin)
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {

    install -dm0755 "${pkgdir}/opt/rockchip/"

    cp -r ${srcdir}/${pkgname} "${pkgdir}/opt/rockchip/"
    rm -rf ${pkgdir}/opt/rockchip/${pkgname}/.*

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname}.csh" <<EOF
setenv PATH "${PATH}:/opt/rockchip/${pkgname}/tools/"
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname}.sh" <<EOF
#!/bin/sh
# rkbin

[ -d /opt/rockchip/rkbin/tools/ ] && append_path '/opt/rockchip/rkbin/tools/'

export PATH
EOF
}
