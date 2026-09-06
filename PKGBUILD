# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='docling'
pkgver='2.126.0'
pkgrel=1
pkgdesc='Document processing toolkit for converting diverse formats into structured data'
url="https://github.com/docling-project/${pkgname}"
license=('MIT')
arch=('any')
depends=(
	"python-${pkgname}=${pkgver}"
	'python-numpy>=1.24.0'
	'python-pillow>=10.0.0'
	'python-rtree>=1.3.0'
	'python-scipy>=1.6.0'
	'python-pypdfium2>=4.30.2'
	'python-docling-parse>=7.16.0'
	'python-docling-ibm-models>=4.0.2'
	'python-pytorch>=2.2.2'
	'python-torchvision'
	'python-transformers>=5.4.0'
	'python-lxml'
	'python-defusedxml>=0.7.1'
	'python-typer026>=0.12.5'
	'python-rich>=13.0.0'
	'python-opencv>=4.6.0'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-hatchling'
	'python-wheel'
)
checkdepends=(
	'python-pytest'
	'python-httpx>=0.28'
	'python-websockets>=14.0'
)
optdepends=(
	'python-polyfactory>=2.22.2: document extraction support'
	'python-docx>=1.2.0: DOCX input support'
	'python-pptx>=1.0.2: PowerPoint input support'
	'python-openpyxl>=3.1.5: Excel input support'
	'python-beautifulsoup4>=4.12.3: HTML input support'
	'python-marko>=2.1.2: Markdown input support'
	'python-pylatexenc>=2.10: LaTeX input support'
	'python-odfdo>=3.22.0: OpenDocument input support'
	'python-mail-parser>=4.1.4: email input support'
	'python-oxmsg>=0.0.2: Outlook MSG input support'
	'python-rapidocr>=3.9.1: RapidOCR engine'
	'python-easyocr>=1.7: EasyOCR engine'
	'python-tesserocr>=2.7.1: Tesseract OCR engine'
	'python-playwright>=1.58.0: dynamic HTML rendering'
	'python-semchunk>=2.2.0: semantic chunking support'
	'python-tree-sitter>=0.25.0: semantic chunking support'
	'python-tree-sitter-python>=0.23.6: Python-aware semantic chunking'
	'python-tree-sitter-c>=0.23.4: C-aware semantic chunking'
	'python-tree-sitter-javascript>=0.23.1: JavaScript-aware semantic chunking'
	'python-tree-sitter-typescript>=0.23.2: TypeScript-aware semantic chunking'
	'python-httpx>=0.28: remote Docling service support'
	'python-websockets>=14.0: remote Docling service streaming'
	'python-dotenv>=1.0: load CLI configuration from .env files'
	'python-openai-whisper>=20250625: audio transcription support'
	'python-numba>=0.63.0: audio transcription support'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'slim_meta_package.patch'
)
b2sums=(
	'725266497a407ff5b5a7b05b1ec5c988fcb40c27b1a01dc68ea0fd158269339a80f5b67197f9efe851feb8befcb428bb5d4ed891f4bb3fc9f1c7cc37486e5895'
	'dbfecd410543a868a28bc9c7b3b22ac40620a3b8462657df1a400f62cc167947c25351b1d3d9205164fba4efb53d52640b78dc135a91951322ff41eac0e42185'
)

prepare() {
	cd -- "${pkgname}-${pkgver}" || return 1

	# Map the standard extra to Arch dependencies instead of Python extras.
	patch -Np1 -i "${srcdir}/slim_meta_package.patch"
}

build() {
	cd -- "${pkgname}-${pkgver}/packages/docling" || return 1
	python -m build --wheel --no-isolation
}

check() {
	local _python_version
	local _checkdir="${srcdir}/${pkgname}-check"

	_python_version=$(python --version)
	_python_version=${_python_version#Python }
	_python_version=${_python_version%.*}
	if [[ ! ${_python_version} =~ ^[0-9]+\.[0-9]+$ ]]; then
		printf 'Unable to determine Python major.minor version: %s\n' "${_python_version}" >&2
		return 1
	fi

	rm -rf -- "${_checkdir}"
	cd -- "${pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${_checkdir}" packages/docling/dist/*.whl

	PYTHONPATH="${_checkdir}/usr/lib/python${_python_version}/site-packages" \
		HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 python -m pytest -q \
			tests/test_cli.py::test_cli_help \
			tests/test_cli.py::test_cli_convert_help \
			tests/test_cli.py::test_cli_version \
			tests/test_cli.py::test_split_list_handles_none_and_delimiters \
			tests/test_cli.py::test_image_export_policy_covers_all_output_formats \
			tests/test_cli.py::test_cli_invalid_ocr_mode_is_rejected \
			tests/test_cli.py::test_cli_page_range_accepts_single_page \
			tests/test_cli.py::test_cli_invalid_page_range_is_rejected \
			tests/test_cli.py::test_cli_allow_external_plugins_reaches_asr_pipeline_options \
			tests/test_cli.py::test_cli_asr_pipeline_options_default_to_false \
			tests/test_cli.py::test_cli_native_pipeline_converts_pdf \
			tests/test_cli.py::test_cli_native_pipeline_defaults_to_pdf_only \
			tests/test_cli.py::test_cli_native_pipeline_rejects_invalid_input_or_backend \
			tests/test_cli.py::test_cli_native_pipeline_parser_threads \
			tests/test_cli_tools.py::test_tools_help_lists_models_subcommand \
			tests/test_cli_tools.py::test_tools_without_arguments_shows_help \
			tests/test_cli_tools.py::test_models_without_arguments_shows_help

	# Default PDF table structure uses TableFormer V1.
	python -m pydoc docling_ibm_models.tableformer.data_management.tf_predictor >/dev/null
}

package() {
	cd -- "${pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" packages/docling/dist/*.whl
	install -D -m644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
