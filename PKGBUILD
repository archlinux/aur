# Maintainer: Mads Ravn <https://github.com/madsravn>
# Maintainer: Lenin Garizabalo <https://github.com/IGUNUBLUE/>
pkgname=relagit
pkgver=r1081.78fc85e
pkgrel=1
pkgdesc="The elegant solution to graphical version control."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
provides=("RelaGit")
source=("git+$url.git")
sha256sums=('SKIP')
depends=('nodejs>=18.0'
         'pnpm'
         'git')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -i "121 c\               target: []," builder.cjs
    pnpm i
    pnpm build
    pnpm make
}

package() {
    install -Dm 755 "${srcdir}/${pkgname}/out/linux-unpacked/relagit" "${pkgdir}/opt/relagit/relagit"
    cp -r "${srcdir}/${pkgname}"/out/linux-unpacked/* "${pkgdir}/opt/relagit"
    echo "/opt/relagit/relagit" > relagit.sh
    install -Dm 755 relagit.sh "${pkgdir}/usr/bin/relagit"
}
