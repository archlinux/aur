# Maintainer: wyf9661 <wyf9661@gmail.com>

_pkgname=ch9344
_reponame=${_pkgname}ser_linux
pkgbase=${_reponame}-dkms
pkgname=${pkgbase}-git
pkgver=r55.e0a38c4
pkgrel=1
url="https://github.com/WCHSoftGroup/ch9344ser_linux"
pkgdesc="linux serial driver of kernel module for CH9344/CH348 USB UART controller"
license=('unknown')
arch=('any')
depends=('dkms')
makedepends=('git' 'patch')
conflicts=("ch9344-dkms-git" "ch9344ser-dkms-git")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=("${_pkgname}::git+${url}.git"
        'dkms.conf'
        "fix_unaligned_header.patch::https://github.com/WCHSoftGroup/${_reponame}/pull/34/commits/74db2b926948364d09f52b91fb69c09721ebcc77.patch"
        '0001-fix_del_timer.patch'
        '0002-fix-uninitialized-condition.patch')
sha1sums=('SKIP'
          'eb54d5f0ba8a99dd31f3be168b5ff5ee27ae2d32'
          '91b7bd64597cb9d62a4d898f0243fc6da9d09786'
          'd94d74dd91d6b47cb8e70d5dea7b2fba39de2395'
          'dec97fad5e49155ece2cfc7af25987268100a279')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}"
    git clean -dfx

    for p in $srcdir/*.patch; do
        echo "Patching with ${p}"
        patch --no-backup-if-mismatch -p1 -N -i $p
    done
}

build() {
    :
}

package() {
    dir_name="${_pkgname}-${pkgver}"
    install -d "${pkgdir}"/usr/src/${dir_name}/
    install -Dm644 "$srcdir/dkms.conf" "$srcdir/${_pkgname}/driver/"* "${pkgdir}/usr/src/${dir_name}/"

    sed -e "s/@_PKGNAME@/${_pkgname}/g" \
        -e "s/@PKGVER@/${pkgver}/g" \
        -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
