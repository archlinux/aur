# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: moormaster < user on aur.archlinux.org >
# Contributor: juliosueiras <juliosueiras [at] gmail [dot] com>
# Contributor: dmrz < user on aur.archlinux.org >

_reponame='ansible'
pkgname="${_reponame}-docs-git"
pkgdesc='HTML documentation of Ansible'
pkgver=2.11.0b4.r1444.g3fa377387e0
pkgrel=1
epoch=1
arch=('any')
url="https://github.com/${_reponame}/${_reponame}"
license=('GPL3')

makedepends=(
    'git'
    'python'
)

# # Not using repo or AUR packages because the needed versions can change rapidly
# # or be too new or too old compared to the versions provided there.
# makedepends+=(
#     'python-aiofiles'
#     'python-aiohttp'
#     'python-aiosignal'
#     'python-async-timeout'
#     'python-attrs'
#     'python-babel'
#     'python-certifi'
#     'python-charset-normalizer'
#     'python-click'
#     'python-frozenlist'
#     'python-imagesize'
#     'python-markupsafe'
#     'python-multidict'
#     'python-packaging'
#     'python-pydantic'
#     'python-pygments'
#     'python-pyparsing'
#     'python-pytz'
#     'python-requests'
#     'python-semantic-version'
#     'python-sh'
#     'python-snowballstemmer'
#     'python-sphinx'
#     'python-sphinx_rtd_theme'
#     'python-sphinxcontrib-applehelp'
#     'python-sphinxcontrib-devhelp'
#     'python-sphinxcontrib-htmlhelp'
#     'python-sphinxcontrib-jsmath'
#     'python-sphinxcontrib-qthelp'
#     'python-sphinxcontrib-serializinghtml'
#     'python-straight.plugin'
#     'python-typing_extensions'
#     'python-urllib3'
#     'python-wheel'
#     'python-yaml'
#     'python-yarl'
# )
# # makedepends+=('rstcheck') # Repo version too new, also buggy (lacks mandatory depends 'types-docutils')
# 
# # The following "hidden" makedepends are not in Arch repos as of this commit,
# # so I'm adding them here as a reference.
# _makedepends_nonrepo=(
#     'python-alabaster'
#     'python-ansible-pygments'
#     'python-antsibull-core'
#     'python-antsibull-docs'
#     'python-asyncio-pool'
#     'python-jinja2'
#     'python-perky'
#     'python-sphinx-ansible-theme'
#     'python-sphinx-notfound-page'
#     'python-sphinx-intl'
#     'python-twiggy'
# )
# # Exposing the missing or AUR-only makedepends as optdepends. If they are present at
# # build-time, they will be used instead of letting pip download them from PyPI.
# optdepends=(
#     "${_makedepends_nonrepo[@]/%/: use this installed package during (the next) build}"
# )

provides=("${pkgname%-git}=${pkgver}")
options=('!strip')
source=("git+${url}.git")
b2sums=('SKIP')
_py_venv_dir=("venv-${pkgname%-git}")

pkgver() {
    cd "${_reponame}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 2.11.0b4.r1444.g3fa377387e0
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

prepare() {
    cd "${_reponame}"

    echo "Setting up Python venv dir: ${srcdir}/${_py_venv_dir}"
    echo '# We need this because Arch and AUR are missing a lot of needed makedepends.'
    # Disabled venv option: --system-site-packages, because Arch/AUR packages likely mismatch
    # too much compared to the versions needed by build's actual requirements.
    python -m 'venv' \
        --upgrade-deps \
        "${srcdir}/${_py_venv_dir}"

    echo "Activating Python venv in dir: ${srcdir}/${_py_venv_dir}"
    source "${srcdir}/${_py_venv_dir}/bin/activate"

    echo "Installing Python modules missing from root to venv dir \"${_py_venv_dir}\"..."
    pip install wheel       # this needs to be installed first
    pip install \
        --compile \
        --require-virtualenv \
        --upgrade \
        --upgrade-strategy eager \
        --requirement 'docs/docsite/requirements.txt' \
        'types-docutils'    # seems it is not declared but needed

    echo "Deactivating Python venv in dir: ${srcdir}/${_py_venv_dir}"
    deactivate
}

build() {
    cd "${_reponame}"

    echo "Activating Python venv in dir: ${srcdir}/${_py_venv_dir}"
    source "${srcdir}/${_py_venv_dir}/bin/activate"

    local templates="${srcdir}/tmp"
    echo "Creating template stubs in ${templates}"
    mkdir -p ${templates}
    touch "${templates}/version_chooser.html"

    echo "Building ${pkgname%-git} from source..."
    local cleanup_flags="\
      -D templates_path=${templates}\
      -D html_context.version=${pkgver}\
      -D html_theme_options.display_version=1\
      -D html_theme_options.show_rtd_ethical_ads=0\
      -D html_theme_options.hubspot_id=''\
      -D html_theme_options.topbar_links=0\
      -D html_theme_options.satellite_tracking=0\
      -D html_theme_options.swift_id=''\
      -D html_theme_options.tag_manager_id=''\
    "
    make -C 'docs/docsite' 'all' O="${cleanup_flags}" CPUS=1

    echo "Deactivating Python venv in dir: ${srcdir}/${_py_venv_dir}"
    deactivate
}

package() {
    install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}/html"
    cp --recursive --dereference --target-directory="${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${_reponame}/docs/docsite/_build/html" 
}
