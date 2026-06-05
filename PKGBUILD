# Maintainer: 0zitro <94910351+0zitro@users.noreply.github.com>
#
# Packages the xul-anchor-graft tool itself (the `xul-anchor-graft`/`xag` CLI and the
# xag_core/xag_graft/xag_pki/xag_system libraries). This is the package the generated
# browser-overlay packaging (`xag emit-packaging`) lists in its `depends`.

_pkgname=xul-anchor-graft
pkgname="${_pkgname}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Per-user add-on signing authority for libxul-family browsers"
arch=('any')

# Using the FFA because my profile is set to limited visibility,
#   so anyone who is not on Codeberg cannot even read the repo
#   and this would also require you having SSH to your account configured for machine access.
# I had set up a push mirror from my main account, `0zitro` to this "free for all" one,
#   at the time of writing, for this one repo.
_url="codeberg.org/0zitro-ffa/xul-anchor-graft"
url="https://${_url}"
license=('Elastic-2.0')   # Elastic License 2.0; not in `licenses`, shipped below

depends=(
  'python'
  'python-cryptography'   # X.509, PKCS#7, key custody
  'python-cbor2'          # the COSE_Sign add-on signature
  'python-typer'          # CLI
  'nss'                   # provides certutil, used by `provision-profile`
  'bubblewrap'            # provides bwrap, used by the launch overlay
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'    # the PEP 517 build backend
  'python-wheel'
  'git'
)
checkdepends=(
  'python-pytest'
  'python-hypothesis'     # property test for the same-length graft
)

# provides=("${_pkgname}=${pkgver}-${pkgrel}")
# conflicts=("${_pkgname}-git")

# _repo_git_url="ssh://git@${_url}.git"  # If you have SSH configured for Codeberg
_repo_git_url="https://${_url}.git"  # Anonymous machine-ready access
source=("${_pkgname}::git+${_repo_git_url}?signed#tag=v${pkgver}"
# To build a checkout instead of a published tag,
#   either use `xul-anchor-graft-git` for the master,
#   or use a local checkout (where you may or may not have done any changes) ::
#
#   > source=("$pkgname::git+file://$(git -C CONTEXT rev-parse --show-toplevel)#commit=<commit-ish of our choice>")
#
#   where CONTEXT is any path within the repo including the root itself.
# The entire `-C CONTEXT` option is optional if your current directory
#   (from `makepkg`'s PoV) is already somewhere inside the repo.
        "xag-extensions.hook"
       )

sha256sums=('SKIP'
            'fb653372e663638fbe85a12a9080281563d3a9bf1d61a7393688dc1b880e4f32'
           )
validpgpkeys=(
  "E627ACE54546B9DA33F31C47EA82A8B4E968D242"  # "0zitro <94910351+0zitro@users.noreply.github.com>"
)


build() {
  cd "${_pkgname}" || return 1;

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}" || return 1;

  # Tests import the src/ packages directly via [tool.pytest.ini_options] pythonpath;
  # no editable install is needed. Linting/typing (ruff, basedpyright) are dev-only and
  # intentionally not check-time gates here.
  python -m pytest
}

package() {
  cd "${_pkgname}" || return 1;

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Informational pacman hook: notes per-user that the shared extension drop changed. It signs
  # and installs nothing (those are per-user, behind the user's passphrase) -- see the file.
  install -Dm644 "${srcdir}"/xag-extensions.hook \
    "${pkgdir}/usr/share/libalpm/hooks/xag-extensions.hook"

  # Ship the licence (Elastic-2.0 is not in the `licenses` package).
  install -Dm644 LICENCE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE.md"
}
