# Maintainer: zitro <0 ät zitro full-stop id>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

_pkgname=b4
pkgname="${_pkgname}"-git
pkgver=0.16.0.r168.gce4c115
pkgrel=1
pkgdesc='Helper utility to work with patches made available via a public-inbox archive like lore.kernel.org. (git version)'
license=('GPL-2.0-or-later')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# makepkg does not scrub the caller's environment, so a bare `python` would resolve through an
# inherited PATH and could hit an activated virtualenv; bind the system interpreter by path.
_python=/usr/bin/python

makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-shtab'
    'python-wheel'
)
checkdepends=(
    'python-ezgb'    # the bug-tracking tests run when the optional extra is present
    'python-pynacl'  # the patatt and tofu signing tests skip without PyNaCl
    'python-pytest'
    'python-pytest-asyncio'
)
depends=(
    'git'               # every b4 operation shells out to git
    'patatt'            # message attestation; imported by b4 at import time
    'python'            # the package installs a module and a console script
    'python-dkim'       # DKIM verification; imported by b4 at import time
    'python-dnspython'  # resolver for DKIM and attestation; imported at import time
    'python-liblore'    # public-inbox client (python-liblore-git provides it)
    'python-pygit2'     # libgit2 bindings for the prep and rewrite paths
    'python-requests'   # HTTP client for lore.kernel.org
    'python-textual'    # the review and bug TUIs
)
optdepends=(
    'git-bug: for the experimental bug-tracking commands'
    'python-ezgb: for the experimental bug-tracking commands'
)
source=("${_pkgname}"::"git+https://git.kernel.org/pub/scm/utils/b4/b4.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}";
    git describe --long --tags | sed -r 's/^v([0-9]+(\.[0-9]+)*)-([0-9]+)-/\1.r\3./';
}

prepare() {
    cd "${_pkgname}";

    # A reused checkout carries the previous build's artifacts into the next one; an old wheel in
    # dist/ would then be installed alongside the new one by package()'s glob.
    git clean -dfx;

    # patatt, liblore and ezgb are packaged separately and installed as dependencies, so the
    # submodules are neither initialised nor wanted. makepkg leaves their directories empty, and
    # an empty directory on the import path reads as a namespace package, so drop the directories
    # and the .gitmodules that claims them.
    rm -f .gitmodules;
    rm -rf liblore ezgb patatt;
}

build() {
    cd "${_pkgname}";

    "${_python}" -m build --wheel --no-isolation

    misc/tc-generate.sh bash > _bash
    misc/tc-generate.sh zsh > _zsh
}

check() {
    cd "${_pkgname}"/src/tests

    # b4 is not installed at check time, and parts of the suite probe importability from a
    # subprocess, so the checkout has to be on PYTHONPATH for those children as well.
    # Arch's pytest-gitconfig plugin defaults init.defaultBranch to `main`, which breaks a test that
    # builds a repository and checks out its `master`; upstream does not use that plugin, so keep it
    # out of the run.
    PYTHONPATH="${srcdir}/${_pkgname}/src" "${_python}" -m pytest -p no:gitconfig -k 'not test_trailers'
}

package() {
    cd "${_pkgname}";
    local python_version=$("${_python}" -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

    "${_python}" -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 src/b4/man/b4.1 "$pkgdir/usr/share/man/man1/b4.1"
    rm -rf "$pkgdir/usr/lib/python$python_version/site-packages/b4/man/"

    install -Dm 644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

    install -Dm 644 _bash "$pkgdir/usr/share/bash-completion/completions/b4"
    install -Dm 644 _zsh "$pkgdir/usr/share/zsh/site-functions/_b4"
}
