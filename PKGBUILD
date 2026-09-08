# Maintainer: Jonathan Wright <jon@than.io>
# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Former Maintainer: Eduard Tanase <eduard dot tanase1 at gmail dot com>
# Former Maintainer: froub (https://aur.archlinux.org/account/froub)
# Contributor: Sauyon Lee <me at sjl dot re>

pkgname=codeql
pkgver=2.26.4
pkgrel=2
pkgdesc="CLI tool for GitHub's CodeQL, including the standard query packs"
arch=('x86_64')
url='https://github.com/github/codeql-cli-binaries'
_bundle_url='https://github.com/github/codeql-action'
license=(
	'LicenseRef-GitHub-CodeQL'
	'Apache-2.0'
	'Apache-2.0 WITH LLVM-exception'
	'BSD-2-Clause'
	'BSD-3-Clause'
	'CC0-1.0'
	'CDDL-1.1 OR GPL-2.0-only WITH Classpath-exception-2.0'
	'EPL-1.0 OR MPL-2.0'
	'EPL-2.0'
	'GPL-2.0-only WITH Classpath-exception-2.0'
	'LGPL-2.1-only'
	'MIT'
	'OLDAP-2.8'
	'PSF-2.0'
	'LicenseRef-PMD-BSD-Style'
	'LicenseRef-Public-Domain'
	'Zlib'
)
optdepends=(
	'gradle: Java/Kotlin projects using Gradle without gradlew'
	'java-environment: Java and Kotlin extraction'
	'maven: Java/Kotlin projects using Maven without mvnw'
	'nodejs>=14: TypeScript extraction'
	'python: Python extraction'
	'rustup: Rust extraction with a configured Rust toolchain'
)
conflicts=('codeql-cli-bin')
replaces=('codeql-cli-bin')
options=('!strip')
source=("${pkgname}-bundle-${pkgver}.tar.zst::${_bundle_url}/releases/download/codeql-bundle-v${pkgver}/codeql-bundle-linux64.tar.zst")
b2sums=('7f3705c3025a39fb94dde46531952286c9e8a355745623f80bba2eb64e72d4af207b7e2ce92dd97057825437cee65c8cdcd8b202431bf9543ae80c3174efcc40')

check() {
	local codeql="${srcdir}/codeql/codeql"
	local suite
	local suite_path
	local suites=(
		'cpp-code-scanning.qls'
		'cpp-security-extended.qls'
		'cpp-security-and-quality.qls'
		'cpp-code-quality.qls'
		'cpp-code-quality-extended.qls'
	)

	"${codeql}" version

	for suite in "${suites[@]}"; do
		suite_path="$(find "${srcdir}/codeql" -type f -name "${suite}" -print -quit)"
		[[ -n "${suite_path}" ]] || {
			printf 'Missing CodeQL C++ query suite: %s\n' "${suite}" >&2
			return 1
		}

		"${codeql}" resolve queries --format=text -- "${suite_path}" >/dev/null
	done
}

package() {
	local component
	local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	local components=(
		'actions'
		'cpp'
		'csharp'
		'csv'
		'go'
		'html'
		'java'
		'javascript'
		'properties'
		'python'
		'ruby'
		'rust'
		'swift'
		'xml'
		'yaml'
	)

	install -dm755 "${license_dir}"
	install -m644 "${srcdir}/codeql/LICENSE.md" "${license_dir}/LICENSE.md"
	cp -a -- "${srcdir}/codeql/Open-Source-Notices" "${license_dir}/"

	for component in "${components[@]}"; do
		install -Dm644 "${srcdir}/codeql/${component}/LICENSE" "${license_dir}/${component}/LICENSE"
		if [[ -f "${srcdir}/codeql/${component}/COPYRIGHT" ]]; then
			install -Dm644 "${srcdir}/codeql/${component}/COPYRIGHT" "${license_dir}/${component}/COPYRIGHT"
		fi
	done
	install -Dm644 "${srcdir}/codeql/python/tools/LICENSE-PSF.md" "${license_dir}/python/tools/LICENSE-PSF.md"

	install -dm755 "${pkgdir}/opt"
	cp -a -- "${srcdir}/codeql" "${pkgdir}/opt/${pkgname}"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "../../opt/${pkgname}/codeql" "${pkgdir}/usr/bin/codeql"
}

# vim:set ts=2 sw=2 et:
