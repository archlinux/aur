# Maintainer: Excalibur <saberconer@gmail.com>

_pkgname=ch9344
pkgname=${_pkgname}-dkms-git
pkgver=r49.4ea8973
pkgrel=1
url="https://github.com/WCHSoftGroup/ch9344ser_linux"
pkgdesc="Kernel module for CH9344/CH348 USB UART controller"
license=('unknown')
arch=('any')
depends=('dkms')
makedepends=('git' 'patch')
conflicts=("${_pkgname}" "ch9344ser-dkms-git")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=("${_pkgname}::git+${url}.git"
        'dkms.conf'
        'https://github.com/NixOS/nixpkgs/raw/refs/heads/master/pkgs/os-specific/linux/ch9344/fix-linux-6-12-build.patch')
sha512sums=('SKIP'
            '97da179595e157e43a23b98b0ab22f064efeb8da90d0690c3f8bf76e5d47e2e0d4e032142d91b8c4cbc2946976a9590c3cd302a0293ca4e3f48a74c1d5002dd5'
            '219b2f7aecef04baad802e6561f3f1194679904b506c17d973c4dcd1b02b7f2041b90416a5a00a129ac873db9b9646ed1af2a865d5270d9aa9dc6d039cc11a3f')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
  patch "${srcdir}/${_pkgname}/driver/ch9344.c" "${srcdir}/fix-linux-6-12-build.patch"
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
