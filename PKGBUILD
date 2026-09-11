# Maintainer: Jonathan Wright <jon@than.io>
# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Former Maintainer: Eduard Tanase <eduard dot tanase1 at gmail dot com>
# Former Maintainer: froub (https://aur.archlinux.org/account/froub)
# Contributor: Sauyon Lee <me at sjl dot re>

pkgname=codeql
pkgver=2.27.0
pkgrel=1
pkgdesc="CLI tool for GitHub's CodeQL, including the standard query packs"
arch=(
	'aarch64'
	'x86_64'
)
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
depends=('zlib')
optdepends_x86_64=('lib32-glibc: tracing 32-bit x86 build processes')
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
source_aarch64=("${pkgname}-bundle-${pkgver}-aarch64.tar.zst::${_bundle_url}/releases/download/codeql-bundle-v${pkgver}/codeql-bundle-linux-arm64.tar.zst")
sha256sums_aarch64=('33518e42e98aaa5865877e11529757fc660c15b8e3ac84d6ba85ffc9fa222f51')
source_x86_64=("${pkgname}-bundle-${pkgver}-x86_64.tar.zst::${_bundle_url}/releases/download/codeql-bundle-v${pkgver}/codeql-bundle-linux64.tar.zst")
sha256sums_x86_64=('5e0f04bcb92c0c0973b6f5597e55316269051fa98bda3f725d8af9a85016721a')

check() {
	local codeql="${srcdir}/codeql/codeql"
	local suite
	local suite_path
	local resolved_queries
	local suites=(
		'cpp-code-scanning.qls'
		'cpp-security-extended.qls'
		'cpp-security-and-quality.qls'
	)

	"${codeql}" version

	for suite in "${suites[@]}"; do
		suite_path="$(find "${srcdir}/codeql" -type f -name "${suite}" -print -quit)"
		[[ -n "${suite_path}" ]] || {
			printf 'Missing CodeQL C++ query suite: %s\n' "${suite}" >&2
			return 1
		}

		resolved_queries="$("${codeql}" resolve queries --format=text -- "${suite_path}")"
		[[ -n "${resolved_queries}" ]] || {
			printf 'CodeQL C++ query suite resolves to no queries: %s\n' "${suite}" >&2
			return 1
		}
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
