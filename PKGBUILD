# Original Maintainer: Alexander Sharov <kvendingoldo@gmail.com>
# Maintainer: Nikolai Mishin <>
# Maintainer: Anastasiia Kozlova <>
pkgname=tofuenv
pkgver=1.0.2
pkgrel=2
epoch=
pkgdesc="OpenTofu version manager inspired by tfenv"
arch=("any")
url="https://github.com/tofuutils/tofuenv"
license=('MIT')
groups=()
depends=(bash unzip grep jq)
makedepends=()
checkdepends=()
optdepends=()
provides=("tofuenv" "tofu")
source=("https://github.com/tofuutils/tofuenv/archive/v${pkgver}.tar.gz")
validpgpkeys=()
install="${pkgname}.install"
conflicts=("tofu")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/tofuenv/libexec"
	mkdir -p "${pkgdir}/opt/tofuenv/lib"
	mkdir -p "${pkgdir}/opt/tofuenv/bin"

	# This patches tofuenv to use a separate dir for versions and the default version
	sed -i 's:${TOFUENV_CONFIG_DIR}/version:/var/lib/tofuenv/version:g' {libexec/tofuenv-*,lib/*.sh}
	sed -i 's:${TOFUENV_ROOT}/version:/var/lib/tofuenv/version:g' {libexec/tofuenv-*,lib/*sh}

	ln -s "/opt/tofuenv/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/tofuenv/bin/tofu" "${pkgdir}/usr/bin/tofu"
	install -m755 "bin/${pkgname}" "${pkgdir}/opt/tofuenv/bin/${pkgname}"
	install -m755 "bin/tofu" "${pkgdir}/opt/tofuenv/bin/tofu"
	install -m444 "CHANGELOG.md" "${pkgdir}/opt/tofuenv/CHANGELOG.md"
	for i in "${srcdir}/${pkgname}-${pkgver}/libexec/"*; do
		install -m555 "$i" "${pkgdir}/opt/tofuenv/libexec/$(basename "$i")"
	done
        for i in "${srcdir}/${pkgname}-${pkgver}/lib/"*; do
                install -m555 "$i" "${pkgdir}/opt/tofuenv/lib/$(basename "$i")"
        done

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}

sha512sums=(b529203eddbe4ab67d87cf1e98ea5db86364da4205b5abd72fbaa4e73b963b810cad497e94bef6944dc03ba1c6f405804fdda786470d938f8588a09bb4cc853d)
