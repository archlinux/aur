# Original Maintainer: Jonatan Bravo <zephrax@gmail.com>
# Maintainer: Hendrik "T4cC0re" Meyer <aur@t4cc0.re>
# Maintainer: Javier Herrera <javierherrera at posteo dot net>
pkgname=tfenv
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc="Terraform version manager inspired by rbenv"
arch=("any")
url="https://github.com/tfutils/tfenv"
license=('MIT')
groups=()
depends=(bash)
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
	sed -i 's:${TFENV_CONFIG_DIR}/version:/var/lib/tfenv/version:g' {libexec/tfenv-*,lib/*.sh}
	sed -i 's:${TFENV_ROOT}/version:/var/lib/tfenv/version:g' {libexec/tfenv-*,lib/*sh}

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

sha512sums=(ea4e72616e9be3613c9bddbeb860736fac241f576a5137408364a826f18503bb9964b9d4a230a0eb1b5d147264000904362e72ace53922fa28aa6c039faaa97c)
