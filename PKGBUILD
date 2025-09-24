# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stdatamodels
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=4.1.0
pkgrel=1
pkgdesc="Core support for DataModel classes used in calibration pipelines"
arch=('any')
url="https://stdatamodels.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-asdf'
             'graphviz')  # wheel required by new setuptools
checkdepends=('python-pytest-doctestplus'
              'python-pytest-asdf-plugin'
#             'python-pytest-xdist'
              'python-asdf-astropy'
#             'python-jwst'
              'python-psutil'
              'python-requests')   # asdf, astropy, already in makedepends
#              'python-crds'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e21eabc1cc34426a8e816ae95ebf3502')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # Lots of tests need jwst
#   CRDS_PATH=".crds" \
    PYTHONPATH="build/lib" pytest \
        --ignore=src/stdatamodels/jwst/datamodels \
        --ignore=src/stdatamodels/jwst/_tests/test_schemas.py \
        --ignore=src/stdatamodels/jwst/transforms/converters/tests/test_models.py \
        --ignore=src/stdatamodels/jwst/transforms/extensions.py \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_compare.py::test_eng_qual \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_dmd.py::test_found[keyword_list0] \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_dmd.py::test_found[keyword_list1] \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_dmd.py::test_found[keyword_list2] \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_against_mast.py::test_report \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_compare.py::test_obs_id \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_compare.py::test_title \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/coords-0.7.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/coords-0.7.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/coords-1.1.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/coords-1.0.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/coords-1.1.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/coords-1.0.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/grating_equation-0.7.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/grating_equation-1.1.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/grating_equation-0.7.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/grating_equation-1.1.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/grating_equation-1.0.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/logical-0.7.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/grating_equation-1.0.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/logical-1.0.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/logical-1.0.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/logical-1.1.0.yaml::test_example_1 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/logical-1.1.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/rotation_sequence-1.0.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/rotation_sequence-1.1.0.yaml::test_example_0 \
        --deselect=src/stdatamodels/jwst/transforms/resources/schemas/stsci.edu/jwst_pipeline/v23tosky-0.7.0.yaml::test_example_0 \
        --deselect=docs/source/jwst/datamodels/metadata.rst::metadata.rst \
        --deselect=docs/source/jwst/datamodels/models.rst::models.rst \
        --deselect=src/stdatamodels/jwst/_kwtool/_tests/test_cli.py::test_cli || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-stdatamodels() {
    depends=('python>=3.11'
             'python-asdf>=3.3.0'
             'python-asdf_transform_schemas>=0.6.0'
             'python-asdf-astropy>=0.6.0'
             'python-astropy>=6.1')
    optdepends=('python-stdatamodels-doc: Documentation for STDataModel')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stdatamodels-doc() {
    pkgdesc="Documentation for Python STDataModel"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
