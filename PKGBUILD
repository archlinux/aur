# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Yaron de Leeuw <me@jarondl.net>

_pyname=isort
pkgname=python38-$_pyname
pkgver=5.10.1
pkgrel=6
pkgdesc='A Python utility / library to sort Python imports'
arch=(any)
url="https://github.com/PyCQA/$_pyname"
license=(MIT)
_pydeps=(toml
         tomli)
depends=(python38
         "${_pydeps[@]/#/python38-}")
makedepends=(python38-{build,installer,wheel}
             python38-poetry-core)
_pycheckdeps=(black
              hypothesis
              hypothesis-auto
              hypothesmith
              libcst
              natsort
              ## deps that make it harder not easier to tell if things work
              # pip
              # pip-api
              # pipreqs
              pytest
              pytest-mock
              requirementslib)
# Besides the overflowing plethora of specific test problems as noted in the
# check() function --dselects, the switch from dephell to poetry broke a whole
# batch more tests related to output formatting. There are a bunch of lines where
# the expected output has whitespace and the actual output does not any more.
# checkdepends=(git
#               pylama
#               "${_pycheckdeps[@]/#/python38-}")
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('7f3a99bb1e93e58ae10737b8a31d45aa03a096b1c4cbbbd55f05226e40089cf7')

prepare() {
	cd "$_archive"

	# Devendor toml
	rm -r isort/_vendored
	sed -i 's/from ._vendored //' isort/settings.py

	## Skipping example integration tests
	# for _plugin in example_*; do
	#     pushd $_plugin
	#     dephell deps convert --from pyproject.toml --to setup.py
	#     popd
	# done
}

build() {
	cd "$_archive"
	python3.8 -m build -wn
}

# check() {
#     cd "$_archive"
#     ## Skipping example integration tests
#     # python setup.py install --root="$PWD/tmp_install" --optimize=1
#     # for _plugin in example_*; do
#     #     pushd $_plugin
#     #     python setup.py install --root="$srcdir/isort-$pkgver/tmp_install" --optimize=1
#     #     popd
#     # done
#     # PYTHONPATH="$PWD/example_isort_formatting_plugin:$PWD/example_shared_isort_profile:$PWD/tmp_install/usr/lib/python3.8/site-packages" PATH="$PWD/tmp_install/usr/bin:$PATH" \
#     python3.8 -m pytest -p no:warnings \
#         --deselect tests/unit/test_deprecated_finders.py::TestRequirementsFinder::test_requirements_dir $(: having pip in ruins other tests ) \
#         --deselect tests/unit/test_deprecated_finders.py::test_requirements_finder $(: having pip in ruins other tests ) \
#         --deselect tests/unit/test_deprecated_finders.py::test_pipfile_finder $(: having pip in ruins other tests ) \
#         --deselect tests/unit/test_isort.py::test_settings_path_skip_issue_909 $(: example integrations ) \
#         --deselect tests/unit/test_isort.py::test_skip_paths_issue_938 $(: example integrations ) \
#         --deselect tests/unit/test_ticketed_features.py::test_isort_supports_shared_profiles_issue_970 $(: example integrations ) \
#         --deselect tests/unit/test_literal.py::test_value_assignment_list $(: unknown) \
#         --deselect tests/unit/test_ticketed_features.py::test_isort_supports_formatting_plugins_issue_1353 $(: unknown) \
#         --deselect tests/unit/test_ticketed_features.py::test_isort_literals_issue_1358 $(: unknown ) \
#         --deselect tests/unit/test_ticketed_features.py::test_sort_configurable_sort_issue_1732 $(: unknown ) \
#         --deselect tests/integration/test_setting_combinations.py $(: unknown ) \
#         --deselect tests/integration/test_projects_using_isort.py::test_typeshed $(: requires network ) \
#         --deselect tests/test_importable.py::test_importable $(: just weird ) \
#         --deselect tests/benchmark/test_api.py $(: no benchmarks thanks )
# }

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
