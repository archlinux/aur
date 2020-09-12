# Maintainer: Thiago França<tfsthiagobr98@outlook.com>

_pkgname=poetry
pkgname=python-poetry-git
pkgver=1.1.0b2.r41.g9fe44933
pkgrel=1
pkgdesc="Python dependency management and packaging made easy"
arch=('any')
url="https://python-poetry.org/"
license=('MIT')
_deps=('cachecontrol' 'cachy' 'cleo' 'clikit>=0.6.2' 'html5lib' 'jsonschema' 'lockfile'
       'pkginfo' 'pyparsing' 'pyrsistent' 'requests' 'requests-toolbelt'
       'shellingham' 'tomlkit' 'keyring' 'pexpect' 'poetry-core-git' 'virtualenv>=20.0.26')
depends=("${_deps[@]/#/python-}")
makedepends=('python-dephell')
checkdepends=('git' 'python-pytest' 'python-pytest-mock' 'python-httpretty')
provides=('poetry' 'python-poetry')
conflicts=('poetry' 'python-poetry')
replaces=('poetry')
source=("${_pkgname}"::"git+https://github.com/python-${_pkgname}/${_pkgname}.git"
        "0001-Suppress-dependency-versions-which-are-known-to-be-t.patch"
        "poetry-completions-generator")
sha256sums=('SKIP'
            '3f992187e7dfbbb5a8d0667ff40ff7b6c3056825291e8a675cf456f8c4fde1d0'
            '970225289188ea8dc49fbec8a2bfe0c891aee80ff56ba6e69bdd8afef8bccab6')
            
pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}"/${_pkgname}

    # fix various overly restrictive version pinning
    patch -p1 -i ../0001-Suppress-dependency-versions-which-are-known-to-be-t.patch

    dephell deps convert --level DEBUG --from pyproject.toml --to setup.py
}

build() {
    cd "${srcdir}"/${_pkgname}
    python setup.py build
}

# check() {
#     cd "${srcdir}"/${_pkgname}
    
#     pytest \
#         -vv \
#         -k 'not test_execute_executes_a_batch_of_operations' \
#         -k 'not test_default_with_excluded_data ' \
#         -k 'not test_builder_should_execute_build_scripts' \
#         -k 'not test_execute_executes_a_batch_of_operations' \
#         --ignore tests/packages/test_locker.py \
#         --ignore tests/console/commands/test_add.py \
#         --ignore tests/console/commands/test_export.py \
#         --ignore tests/console/commands/test_show.py
# }

package() {
    cd "${srcdir}"/${_pkgname}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    rm "${pkgdir}"/usr/lib/python3.*/site-packages/poetry/__init__.py
    rm "${pkgdir}"/usr/lib/python3.*/site-packages/poetry/__pycache__/__init__.cpython-*.opt-1.pyc
    rm "${pkgdir}"/usr/lib/python3.*/site-packages/poetry/__pycache__/__init__.cpython-*.pyc

    # install completions, which for some crazy reason hardcode the filename
    # used to invoke which is __main__.py if we use python -m poetry, and also
    # adds the full directory path???
    install -m755 "${srcdir}"/poetry-completions-generator ./poetry-completions-generator
    ./poetry-completions-generator completions bash | sed "\|${srcdir}|d" | \
        install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/poetry
    ./poetry-completions-generator completions zsh | sed "\|${srcdir}|d" | \
        install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_poetry
    ./poetry-completions-generator completions fish | \
        install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/poetry.fish
}
