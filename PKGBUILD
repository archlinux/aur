# Original Maintainer: Jonatan Bravo <zephrax@gmail.com>
# Maintainer: Hendrik "T4cC0re" Meyer <aur@t4cc0.re>
# Maintainer: Javier Herrera <javierherrera at posteo dot net>
pkgname=tfenv
pkgver=3.2.2
pkgrel=1
epoch=
pkgdesc="Terraform version manager inspired by rbenv"
arch=("any")
url="https://github.com/tfutils/tfenv"
license=('MIT')
groups=()
depends=(bash unzip)
makedepends=()
checkdepends=()
optdepends=()
provides=("tfenv" "terraform" "terragrunt-iac-provider")
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

sha512sums=(35aa7ab69e9e07947bb7cc70f3e388d47f7db2bb532b0d7518edf2cfcfac9f61bbd680fecc65e1a45b2d02695f24e167f23065d4b7fa8ca1ad579d66bbc86f3a)
