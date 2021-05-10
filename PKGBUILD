# Original Maintainer: Jonatan Bravo <zephrax@gmail.com>
# Maintainer: Hendrik "T4cC0re" Meyer <aur@t4cc0.re>
pkgname=tfenv
pkgver=2.2.2
pkgrel=1
epoch=
pkgdesc="Terraform version manager inspired by rbenv"
arch=("x86_64")
url="https://github.com/tfutils/tfenv"
license=('MIT')
groups=()
depends=("unzip")
makedepends=()
checkdepends=()
optdepends=()
provides=("tfenv" "terraform")
source=("https://github.com/tfutils/tfenv/archive/v${pkgver}.tar.gz")
validpgpkeys=()
install="${pkgname}.install"
conflicts=("terraform")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/tfenv/libexec"
	mkdir -p "${pkgdir}/opt/tfenv/lib"
	mkdir -p "${pkgdir}/opt/tfenv/bin"

	# This patches tfenv to use a separate dir for versions and the default version
	sed -i 's:${TFENV_ROOT}/version:/var/lib/tfenv/version:g' libexec/tfenv-*

	ln -s "/opt/tfenv/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/tfenv/bin/terraform" "${pkgdir}/usr/bin/terraform"
	install -m755 "bin/${pkgname}" "${pkgdir}/opt/tfenv/bin/${pkgname}"
	install -m755 "bin/terraform" "${pkgdir}/opt/tfenv/bin/terraform"
	install -m444 "CHANGELOG.md" "${pkgdir}/opt/tfenv/CHANGELOG.md"
	for i in "${srcdir}/${pkgname}-${pkgver}/libexec/"*; do
		install -m555 "$i" "${pkgdir}/opt/tfenv/libexec/$(basename "$i")"
	done
        for i in "${srcdir}/${pkgname}-${pkgver}/lib/"*; do
                install -m555 "$i" "${pkgdir}/opt/tfenv/lib/$(basename "$i")"
        done

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}

sha512sums=(7307680efe939aaef744339eccab0b85e74d98d4ef845ab44c40e1fc46afed5d2736e9f2701b9403cc90eb08e5ac3fc2ff02c93992f0c3a38caab01bbae1480a)
