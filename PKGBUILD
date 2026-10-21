# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Michal Wojdyla <micwoj9292@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>

_pkgname='beartype'
pkgname="python-${_pkgname}"
pkgver=0.23.1
pkgrel=1
pkgdesc='Unbearably fast near-real-time hybrid runtime-static type-checking in pure Python'
arch=('any')
url="https://github.com/beartype/${_pkgname}"
license=('MIT')
depends=('python>=3.10')
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
)
checkdepends=(
	'mypy'
	'nuitka>=1.2.6'
	'pyinstaller'
	'pyright>=1.1.370'
	'python-click'
	'python-coverage'
	'python-docutils>=1:0.22.0'
	'python-jax'
	'python-jaxtyping'
	'python-langchain'
	'python-langchain-core'
	'python-numba'
	'python-numpy'
	'python-polars'
	'python-polars-runtime-compat'
	'python-poetry'
	'python-pydantic'
	'python-pygments'
	'python-pytest'
	'python-pytorch'
	'python-redis'
	'python-rich-click'
	'python-sqlalchemy'
	'python-typer'
	'python-typing_extensions'
	'python-xarray'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('800fdfa4511ba00f3fe683e83df49e663c583948de0c99159d56acfba104027c1a5926da69b9d0ce15998779d72c371ecf67b591069b907bcf27169cc7cf7f90')

build() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	rm -rf -- "${srcdir}/test-install"

	python -m installer --destdir="${srcdir}/test-install" dist/*.whl

	local site_packages=("${srcdir}/test-install"/usr/lib/python*/site-packages)
	if (( ${#site_packages[@]} != 1 )) || [[ ! -d "${site_packages[0]}" ]]; then
		printf 'Expected exactly one installed site-packages directory, got %s\n' "${#site_packages[@]}" >&2
		return 1
	fi

	# Keep the tested wheel ahead of the test suite; do not let pytest prepend the source tree.
	local test_pythonpath="${site_packages[0]}:${PWD}"
	local import_log="${srcdir}/test-import.log"
	if ! PYTHONPATH="${test_pythonpath}" python -P -m pydoc beartype >"${import_log}" 2>&1; then
		cat -- "${import_log}" >&2
		return 1
	fi
	if ! grep -Fxq -- "    ${site_packages[0]}/beartype/__init__.py" "${import_log}"; then
		printf 'beartype was not imported from the installed test wheel.\n' >&2
		grep -A 1 '^FILE$' "${import_log}" >&2 || true
		return 1
	fi
	printf 'Verified wheel import from %s\n' "${site_packages[0]}/beartype/__init__.py"

	# These AUR integration dependencies are currently unbuildable in a clean chroot:
	# FastMCP requires python-beartype through python-py-key-value-aio;
	# Celery depends on a failing Kombu build and a cyclic pytest-celery dependency.
	# Verify the exact upstream test nodes before excluding them.
	local excluded_tests=(
		'beartype_test/a90_func/a40_claw/external/test_claw_celery.py::test_claw_celery'
		'beartype_test/a90_func/a40_claw/external/test_claw_fastmcp.py::test_claw_fastmcp'
	)
	local collection_log="${srcdir}/test-excluded-collection.log"
	if ! PYTHONPATH="${test_pythonpath}" pytest --collect-only -qq --import-mode=append "${excluded_tests[@]}" >"${collection_log}" 2>&1; then
		cat -- "${collection_log}" >&2
		return 1
	fi

	local excluded_test
	local pytest_options=()
	for excluded_test in "${excluded_tests[@]}"; do
		if ! grep -Fxq -- "${excluded_test}" "${collection_log}"; then
			printf 'Excluded integration test no longer exists: %s\n' "${excluded_test}" >&2
			cat -- "${collection_log}" >&2
			return 1
		fi
		pytest_options+=("--deselect=${excluded_test}")
	done

	# Run all remaining tests against the installed wheel, including the PEP 561 type checkers.
	local test_log="${srcdir}/test-pytest.log"
	if ! PYTHONPATH="${test_pythonpath}" pytest -v -ra --import-mode=append "${pytest_options[@]}" >"${test_log}" 2>&1; then
		cat -- "${test_log}"
		return 1
	fi
	cat -- "${test_log}"

	if ! grep -Eq '[,[:space:]]2 deselected([,[:space:]]|$)' "${test_log}"; then
		printf 'Expected exactly two excluded integration tests.\n' >&2
		return 1
	fi

	local required_test
	for required_test in \
		'beartype_test/a90_func/a90_pep/test_pep561_mypy.py::test_pep561_mypy' \
		'beartype_test/a90_func/a90_pep/test_pep561_pyright.py::test_pep561_pyright_self' \
		'beartype_test/a90_func/a90_pep/test_pep561_pyright.py::test_pep561_pyright_others'; do
		if ! grep -F -- "${required_test}" "${test_log}" | grep -Eq '[[:space:]]+PASSED'; then
			printf 'Required integration test did not pass: %s\n' "${required_test}" >&2
			return 1
		fi
	done

	# CrossHair and Pandera are not available as usable stable Arch packages.
	# Both Sphinx tests are explicitly disabled upstream regardless of Sphinx availability.
	# All other missing test integrations must cause an error, not a silent skip.
	local missing_skips="${srcdir}/test-missing-dependency-skips.log"
	if grep -E '^SKIPPED.*(could not import|Command .* not found)' "${test_log}" |
		grep -Ev "could not import '(crosshair|pandera)'" |
		grep -vF 'beartype_test/a90_func/a50_external/a00_sphinx/test_sphinx.py:' >"${missing_skips}"; then
		printf 'Unexpected missing integration test dependencies:\n' >&2
		cat -- "${missing_skips}" >&2
		return 1
	fi
}

package() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 0 --compile-bytecode 2 dist/*.whl
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
