# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Keith Hughitt <khughitt@umd.edu>

pkgname=python38-pandas
pkgver=1.5.1
pkgrel=1
pkgdesc='High-performance, easy-to-use data structures and data analysis tools for Python'
arch=(x86_64)
url="https://pandas.pydata.org/"
license=(BSD)
depends=('python38-numpy' 'python38-dateutil' 'python38-pytz' 'python38-setuptools')
makedepends=('cython')
optdepends=(
    'python38-pandas-datareader: pandas.io.data replacement (recommended)'
    'python38-numexpr: accelerating certain numerical operations (recommended)'
    'python38-bottleneck: accelerating certain types of nan evaluations (recommended)'
    'python38-matplotlib: plotting'
    'python38-jinja: conditional formatting with DataFrame.style'
    'python38-tabulate: printing in Markdown-friendly format'
    'python38-scipy: miscellaneous statistical functions'
    # 'python38-numba: alternative execution engine' (in the AUR)
    'python38-xarray: pandas-like API for N-dimensional data'
    'python38-xlrd: Excel XLS input'
    'python38-xlwt: Excel XLS output'
    'python38-openpyxl: Excel XLSX input/output'
    'python38-xlsxwriter: alternative Excel XLSX output'
    # 'python38-pyxlsb: XLSB input' (nowhere)
    'python38-beautifulsoup4: read_html function (in any case)'
    'python38-html5lib: read_html function (and/or python38-lxml)'
    'python38-lxml: read_xml, to_xml and read_html function (and/or python38-html5lib)'
    'python38-sqlalchemy: SQL database support'
    'python38-psycopg2: PostgreSQL engine for sqlalchemy'
    'python38-pymysql: MySQL engine for sqlalchemy'
    'python38-pytables: HDF5-based reading / writing'
    'python38-blosc: for msgpack compression using blosc'
    'zlib: compression for msgpack'
    # 'python38-fastparquet: Parquet reading / writing' (in the AUR)
    'python38-pyarrow: Parquet, ORC and feather reading/writing'
    # 'python38-pyreadstat: SPSS files reading' (in the AUR)
    'python38-fsspec: handling files aside from local and HTTP'
    # 'python38-gcsfs: Google Cloud Storage access' (in the AUR)
    # 'python38-pandas-gbq: Google BigQuery access' (nowhere)
    # 'python38-s3fs: Amazon S3 access' (in the AUR)
    'python38-pyqt5: read_clipboard function (only one needed)'
    'python38-qtpy: read_clipboard function (only one needed)'
    'xclip: read_clipboard function (only one needed)'
    'xsel: read_clipboard function (only one needed)'
    'python38-brotli: Brotli compression'
    'python38-snappy: Snappy compression'
    'python38-zstandard: Zstandard (zstd) compression'
)
checkdepends=(
    'python38-pytest'
    'python38-pytest-asyncio'
    'python38-pytest-xdist'
    'python38-hypothesis'
    'python38-pandas-datareader'
    'python38-numexpr'
    'python38-bottleneck'
    'python38-matplotlib'
    'python38-jinja'
    'python38-tabulate'
    'python38-scipy'
    # 'python38-numba' (in the AUR)
    'python38-xarray'
    'python38-xlrd'
    'python38-xlwt'
    'python38-openpyxl'
    'python38-xlsxwriter'
    # 'python38-pyxlsb' (nowhere)
    'python38-beautifulsoup4'
    'python38-html5lib'
    'python38-lxml'
    'python38-sqlalchemy'
    'python38-pytables'
    'python38-blosc'
    'zlib'
    # 'python38-fastparquet' (in the AUR)
    'python38-pyarrow'
    # 'python38-pyreadstat' (in the AUR)
    'python38-fsspec'
    # 'python38-gcsfs' (in the AUR)
    # 'python38-pandas-gbq' (nowhere)
    # 'python38-s3fs' (in the AUR)
    'python38-pyqt5'
    'python38-qtpy'
    'xclip'
    'xsel'
    'python38-brotli'
    'python38-snappy'
    'python38-zstandard'
)
# {My,Postgre}SQL tests try to access local DB to no avail
#    'python38-psycopg2'
#    'python38-pymysql'
# No test data in upstream crafted tarball
#source=(https://github.com/pandas-dev/pandas/releases/download/v${pkgver}/pandas-${pkgver}.tar.gz)
source=(https://github.com/pandas-dev/pandas/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b539bae7def51908a6ac90ce36e66e8e04ff26dd14b9422caedffebf08c98abc')

build() {
  cd pandas-${pkgver}
  python3.8 setup.py build_ext --inplace
  python3.8 setup.py build
}

check() {
  cd pandas-${pkgver}
  # raw clipboard access does not work in headless container
  pytest -vv --color=yes pandas -k 'not test_raw_roundtrip'
}

package() {
  cd pandas-${pkgver}
  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
