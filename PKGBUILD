# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: bbyte <bbyte@mailbox.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

_pkgname='languagetool'
pkgname="${_pkgname}-snapshot"
_revision='6.9'
_date='20260906'
pkgver="${_revision}.${_date}"
pkgrel=1
pkgdesc='Grammar and style checker (daily snapshot)'
arch=('any')
url='https://github.com/languagetool-org/languagetool'
license=('LGPL-2.1-or-later')
depends=('java-runtime-headless>=17')
makedepends=('unzip')
optdepends=(
	'java-runtime>=17: GUI support'
	'libxtst: GUI support'
	'gtk3: GTK style for the GUI'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
	"https://languagetool.org/download/snapshots/LanguageTool-${_date}-snapshot.zip"
	'languagetool.sh'
	'languagetool.service'
)
noextract=("LanguageTool-${_date}-snapshot.zip")
b2sums=(
	'3b88d34fecd9149eb4907e38c4fdb38c925ec9c6c4a7557bcbc7e630c57733ea65e4caa746edb047af01f7490abe58b5ebb0fda124ea4efbc41bfa36fe831350'
	'3f8367e3e6e2c95741824804f061d1ce5a8267567576db4005c7e2538ccd793c79e5ea70b4e74cfb34f1fca7a175eb5de264542431ac4cc91f5f5a33bc9d4aa3'
	'78d16d615b5af43eb50f49e91dfc4089432a6af6f9892c1e623ca596e27aa12a2375c705351750f89f99477e6478d5fa39e92b33c9e8dac1c86ab37a616a98da'
)

package() {
	local _archive="${srcdir}/LanguageTool-${_date}-snapshot.zip"
	local _snapshot_dir="LanguageTool-${_revision}-SNAPSHOT"

	install -d -- "${pkgdir}/usr/share/java/${_pkgname}/libs"
	unzip -q -- "${_archive}" -d "${pkgdir}/usr/share"
	mv -- "${pkgdir}/usr/share/${_snapshot_dir}" "${pkgdir}/usr/share/${_pkgname}"

	cd -- "${pkgdir}/usr/share/${_pkgname}" || return 1
	mv -- ./*.jar "${pkgdir}/usr/share/java/${_pkgname}"
	mv -- ./libs/*.jar "${pkgdir}/usr/share/java/${_pkgname}/libs"
	rmdir -- ./libs

	install -Dm755 -- "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 -- "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
