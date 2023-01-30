# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=3.8.0
pkgrel=1
pkgdesc='Extra colorization and configuration loading for Click.'
url='https://kdeldycke.github.io/click-extra/'
makedepends=(python-build python-installer python-wheel python-poetry-core python-sphinx-furo bump2version)
depends=(python python-boltons python-click python-click-log python-cli_helpers python-cloup python-commentjson python-graphviz python-mergedeep python-pygments python-pygments-ansi-color python-yaml python-regex python-requests python-tabulate python-tomli 'python-xmltodict<0.14' python-wcmatch)
checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases mypy python-pytest-mypy)
license=('GPL2')
arch=('any')
source=("https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('deee0ef66664240926679d648f88742528cc879fe5fd47c7a525e1d474d805b12d3f8506d90fe84199835739039eadd255b9fd542ead74aa36e69aea6f2cbbd6')

build() {
    # Poetry has a bug where .gitignore files in any parent directory is used in excluding files to build, resulting in an empty package.
    cd "$srcdir/$_name-$pkgver"
    GIT_DIR="$srcdir/$_name-$pkgver" python -m build --wheel --no-isolation
}

check() {
    # Making the tests similar to https://github.com/kdeldycke/click-extra/blob/37720e0357892c8b62f85a8f2cf0289aac42b139/.github/workflows/tests.yaml#L135-L166
    # because of several bugs.
    cd "$srcdir/$_name-$pkgver"
    poetry run pytest --randomly-seed=2892842890 --cov-config=pyproject.toml --cov=./ --cov-report=xml \
          click_extra/tests/test_colorize.py \
          click_extra/tests/test_version.py
    poetry run pytest --randomly-seed=1927446530 --cov-config=pyproject.toml --cov=./ --cov-report=xml \
          click_extra/tests/test_commands.py
    poetry run pytest --randomly-seed=498379502 --cov-config=pyproject.toml --cov=./ --cov-report=xml \
          click_extra/tests/test_config.py
    poetry run pytest --randomly-seed=3568961045 --cov-config=pyproject.toml --cov=./ --cov-report=xml \
          click_extra/tests/test_logging.py
    poetry run pytest --cov-config=pyproject.toml --cov=./ --cov-report=xml \
          click_extra/tests/test_platforms.py \
          click_extra/tests/test_pygments.py \
          click_extra/tests/test_run.py \
          click_extra/tests/test_tabulate.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
