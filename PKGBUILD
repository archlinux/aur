# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_pkgname=lightning_utilities
pkgver=0.15.3
pkgrel=2
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=(
	'python-pytest'
	'python-requests'
	'python-tomlkit'
)
optdepends=(
	'python-requests: documentation retrieval helpers (lightning_utilities.docs)'
	'python-jsonargparse: command-line interface utilities (lightning_utilities.cli)'
	'python-tomlkit: command-line interface utilities (lightning_utilities.cli)'
)
_archive="utilities-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('215ad92587cea75977bd52b9cb17aab70178a9868b02dc0abd3d89be2a249f9b3976f0f88e53a975f9a22fc55260cdba66d5e11bfe1558d789bdeea157957df6')

build() {
	cd "${_archive}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_archive}"

	local _check="${srcdir}/_check"
	local _site
	rm -rf "${_check}"
	python -m installer --destdir="${_check}" dist/*.whl
	_site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

	# Run the complete core/install/test utility suite against the staged wheel.
	# The two online documentation tests require Internet access. The command-line
	# integration module requires the optional jsonargparse[signatures] extra,
	# which is intentionally not part of the core package.
	PYTHONPATH="${_check}${_site}" pytest -v -m 'not online' \
		--ignore=tests/unittests/cli/test_command_line.py \
		tests/unittests

	# Exercise nested collection transforms and installed requirement inspection,
	# two core workflows consumed throughout the Lightning ecosystem.
	PYTHONPATH="${_check}${_site}" python - <<'PY'
from dataclasses import dataclass

from lightning_utilities.core.apply_func import apply_to_collection
from lightning_utilities.core.imports import RequirementCache


@dataclass
class Batch:
    values: list[int]
    epoch: int


batch = Batch(values=[1, 2, 3], epoch=4)
scaled = apply_to_collection(batch, int, lambda value: value * 10)
assert scaled == Batch(values=[10, 20, 30], epoch=40)
assert RequirementCache("packaging>=22")
assert not RequirementCache("definitely-missing-arch-validation-package>=1")
PY
}

package() {
	cd "${_archive}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
