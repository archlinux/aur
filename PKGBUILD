# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: Nissar Chababy <funilrys at outlook dot com>
# Contributer: Jeroen Bollen <jbinero at gmail dot comau>

pkgname="ckbcomp-bin"
pkgver="1.205"
pkgrel=1
pkgdesc="Compile a XKB keyboard description to a keymap suitable for loadkeys or kbdcontrol"
arch=(any)
url="http://anonscm.debian.org/cgit/d-i/console-setup.git/"
license=('GPL2')
depends=('perl')
source=("http://ftp.debian.org/debian/pool/main/c/console-setup/console-setup_${pkgver}_all.deb")
sha512sums=('SKIP')
provides=("ckbcomp")

prepare(){
    while read -r pkg; do
        dir="${srcdir}/$(basename "${pkg}" | cut -d "." -f 1)"
        mkdir -p "${dir}"
        tar -x -v -f "${pkg}" -C "${dir}"
    done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -name "*.tar*" -printf "%p\n")
}

package() {
    while read -r file; do
        echo "Installing ${file}" >&2
        mkdir -p "$(dirname "${pkgdir}/${file}")"
        cp -ad "${srcdir}/data/${file}" "${pkgdir}/${file}"
    done < <(find "${srcdir}/data" -type f -o -type l 2> /dev/null | sed "s|${srcdir}/data||g")
}
