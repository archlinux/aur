# Maintainer: zitro <0 ät zitro fullstop id>


# ezgb is the Python face of git-bug: a bug is a set of git objects, and this library reads them
#   directly through pygit2 while routing every write through the `git bug` CLI, which keeps the
#   operation DAG and the Lamport clocks consistent. b4's bug browser is what a user reaches it
#   through; the library itself installs no command.

# Environment used for packaging source overrides ::
#
# - REPO_COORDS__PYTHON_EZGB_GIT: `${'branch' | 'tag' | 'commit'}=${any}${string}` -- for the branch/tag/commit git coordinate
# - REPO_USE_SSH__PYTHON_EZGB_GIT: boolean -- for using SSH to retrieve the source
# - REPO_LOCAL__PYTHON_EZGB_GIT: UnixPath -- for overriding to a local git checkout

# To build from a local checkout instead of the remote master -- e.g. to test
#   changes you have committed locally -- do NOT edit this source= line.
# Point the build at your clone with the REPO_LOCAL__PYTHON_EZGB_GIT environment variable,
#   which may be any path inside the repo (a file is reduced to its `dirname`, and
#   `git rev-parse --show-toplevel` normalises it to the repo root), e.g. ::
#
#   > env REPO_LOCAL__PYTHON_EZGB_GIT="$(pwd)" makepkg -fis
#
# The commit-ish built is governed by `_repo_git_coords` at the top of this
#   file (default `branch=master`; a local build re-pins it to a concrete SHA);
#   REPO_USE_SSH__PYTHON_EZGB_GIT=1 selects the SSH remote when no local path is given.

#region Config
#region Config::Packaging
_pkgbase_stem=$'ezgb'
_pkgname_stems=(
  $'ezgb'
)
_pkgdesc=$'A standalone Python library for working with git-bug repositories.'
#epoch=0
pkgrel=1
_homepage_url=$'https://git.kernel.org/pub/scm/utils/ezgb/ezgb.git'
_global_conflicts=()

#region Config::Packaging::Technical
# This base carries one Python library, so the naming scheme's prefix is `python-`: the stem states
#   the distribution's own name and the suffix marks the git build of that name.
_pkgname_prefix=$'python-'
_pkgname_suffix=$'-git'
_pkgdesc_prefix=$''
_pkgdesc_suffix=$' (git version)'

# The release build of the same distribution, under the Arch name that prefix produces: this
#   package provides it and replaces it, and its `-debug` variant is replaced too, so machines with
#   options=($'debug') receive the prompt.
_other_known_providers=($'python-ezgb')
#endregion Config::Packaging::Technical
#endregion Config::Packaging

#region Config::Source
_repo_uri=$'git.kernel.org/pub/scm/utils/ezgb/ezgb.git'
_repo_git_coords=$'branch=master'
# `branch=<branch_name>` (not `commit=<branch_name>`) for a moving tip: makepkg resolves `branch=`
#   to `origin/<x>`, which `git fetch` keeps fresh, whereas `commit=<branch>` resolves a bare name
#   that a reused working copy leaves stale.
# A local build (`$REPO_LOCAL`) re-pins this to a concrete SHA below.

license=('GPL-2.0-or-later')
# Upstream signs its release tags with Konstantin Ryabitsev's key, but the branch tip is not signed.
#   A moving checkout therefore has no `?signed` object to verify and no `validpgpkeys` to verify it
#   against: the HTTPS transport is the integrity boundary, and a tag-pinned build is where the
#   signature would apply.
arch=('any')  # pure-Python wheel: the same files on every architecture

#region Config::Source::Deps
# Bind the interpreter to the system Python by absolute path. makepkg does not
# scrub the caller's environment (only the devtools chroot builders do), so a bare
# `python` would resolve through an inherited PATH and hit an activated in-project
# .venv -- which lacks python-build/installer and breaks build(). /usr/bin/python
# has no adjacent pyvenv.cfg, so it ignores any leaked VIRTUAL_ENV and PATH order.
_python=${REPO_PYTHON:-$'/usr/bin/python'}
_python_package=${REPO_PYTHON_PACKAGE:-'python'}

# Upstream declares one hard dependency (`pygit2`) and reaches for `git bug` on every write, so
#   git-bug is an optional dependency rather than a hard one: reads fall back to the native git
#   objects when it is absent. The package states both in its own function, as the split machinery
#   does. `check()` imports the distribution -- and therefore `pygit2` -- and makepkg resolves only
#   the top-level arrays before `build()` and `check()`, so that dependency is repeated in
#   `checkdepends` to reach the test environment.
depends=()
makedepends=(
  'python-build'        # build() builds the wheel through the project's setuptools backend
  'python-installer'    # package() unpacks the wheel with it
  'python-setuptools'   # the build backend pyproject.toml names
  'python-wheel'        # the wheel command that backend drives
  'git'                 # the source
)
checkdepends=(
  'python-pytest'            # the suite
  'python-typing_extensions' # conftest.py imports `override` from it
  'git-bug'                  # the integration tests drive the CLI, and skip when it is absent
  'python-pygit2'            # conftest.py imports it; the suite cannot collect without it
)
#endregion Config::Source::Deps
#endregion Config::Source
#endregion Config


# ------------------------------------------------------------------------------


#region Derivations

# Map :: _pkgnames_with_prefix_and_suffix := forall _pkgname_stem in _pkgname_stems.
#          "${_pkgname_prefix}${_pkgname_stem}${_pkgname_suffix}"
_pkgnames_with_suffix=("${_pkgname_stems[@]/%/"${_pkgname_suffix}"}")
_pkgnames_with_prefix_and_suffix=("${_pkgnames_with_suffix[@]/#/"${_pkgname_prefix}"}")

# All other providers suffixed with `-debug`, so that machines with options=($'debug')
#   will receive a prompt to replace that as well
_debugsyms_conflicts=("${_other_known_providers[@]/%/$'-debug'}")

# Map :: _stem_by_pkgname := forall _pkgname_stem in _pkgname_stems, the package name it builds
#          -> the stem it is named for.
#   makepkg greps a package function's `provides`/`conflicts` lines and evaluates them with only the
#   toplevel of this file in scope, so those lines cannot name a variable the function sets itself.
#   This map is derived from the two arrays the package names are derived from, so a function names
#   its stem by the package being built and there is no per-function index to keep in step.
declare -gA _stem_by_pkgname=()
for _pkgname_index in "${!_pkgnames_with_prefix_and_suffix[@]}"; do
  _stem_by_pkgname["${_pkgnames_with_prefix_and_suffix[${_pkgname_index}]}"]="${_pkgname_stems[${_pkgname_index}]}"
done
unset _pkgname_index

#region Derivations::Packaging
pkgbase="${_pkgname_prefix}${_pkgbase_stem}${_pkgname_suffix}"
pkgname=("${_pkgnames_with_prefix_and_suffix[@]}")
# Map :: _release_pkgname := the Arch name the release build of this distribution is installed
#          under : "${_pkgname_prefix}${_pkgbase_stem}". The prefix belongs to the package name and
#          the stem is the distribution's own, so the release name is the two together.
_release_pkgname="${_pkgname_prefix}${_pkgbase_stem}"
# The release the tip is at; `pkgver()` adds the commit count and SHA when makepkg resolves the
#   checkout, so this is the value `.SRCINFO` states rather than the last one built.
pkgver=0.2.1.r0.g55634c6
pkgdesc="${_pkgdesc_prefix}${_pkgdesc}${_pkgdesc_suffix}"
url="${_homepage_url}"

conflicts=("${_global_conflicts[@]}")
#endregion Derivations::Packaging

#region Derivations::GitCoords
# Ordering: config -> ssh override -> local checkout override (last set wins)

_pkg_cfg_key="$(printf '%s' "${pkgbase@U}" | LC_ALL=C tr -c 'A-Z0-9' '_')"
# Remap the per-package envs to locally-NSd names
declare -n REPO_COORDS="REPO_COORDS__${_pkg_cfg_key}"
declare -n REPO_USE_SSH="REPO_USE_SSH__${_pkg_cfg_key}"
declare -n REPO_LOCAL="REPO_LOCAL__${_pkg_cfg_key}"

if ((REPO_PACKAGING_DEBUG)); then
  msg2 'REPO_COORDS = %s\n' "${REPO_COORDS}" >&2;
  msg2 'REPO_USE_SSH = %s\n' "${REPO_USE_SSH}" >&2;
  msg2 'REPO_LOCAL = %s\n' "${REPO_LOCAL}" >&2;
fi

_repo_git_coords="${REPO_COORDS:-"${_repo_git_coords}"}"
_repo_git_url="https://${_repo_uri}"  # upstream serves this repository publicly over HTTPS

if ((REPO_USE_SSH)); then
  _repo_git_url="ssh://git@${_repo_uri}"  # kernel.org serves the same repository over SSH
fi

_repo_git_path=""
if [[ -n "${REPO_LOCAL:-}" && (-d "${REPO_LOCAL}" || -f "${REPO_LOCAL}") ]]; then
  _repo_param="${REPO_LOCAL}"
  if [[ -f "${REPO_LOCAL}" ]]; then
    _repo_param="$(dirname -- "${REPO_LOCAL}")"
  fi
  _repo_git_path="$(git -C "${_repo_param}" rev-parse --show-toplevel)"
  _repo_git_url="file://${_repo_git_path}"  # Local checkout

  # Pin the coords to a concrete commit resolved in the local repo. makepkg reuses its git
  #   working copy across builds and `git fetch` only advances origin/*, so a `commit=<branch>`
  #   fragment resolves the STALE same-named local branch there (makepkg's git.sh does
  #   `ref=${fragment##*=}` for commit=, a bare name -- observed building the previous tag).
  # A full SHA is not a branch name, so makepkg checks out exactly that object once fetched;
  #   the `#*=` strip makes this uniform whether the coords say commit=/branch=/tag=/HEAD.
  _sha="$(git -C "${_repo_git_path}" rev-parse --verify --quiet "${_repo_git_coords#*=}^{commit}")" \
    && _repo_git_coords="commit=${_sha}"
fi
#endregion Derivations::GitCoords

#region Derivations::Source
source=("${pkgbase}::git+${_repo_git_url}#${_repo_git_coords}")
# One source and no other: nothing is fetched beyond the checkout, and a moving branch tip carries
#   no signature -- so there is no `?signed` to append and no second sum to pin.
sha256sums=('SKIP')

if ((REPO_PACKAGING_DEBUG)); then
  msg2 'source[%s] = %s\n' "${source[@]@k}" >&2;
fi
#endregion Derivations::Source
#endregion Derivations

pkgver() {
  cd "${pkgbase}" || return 1;
  git describe --long --tags | sed -r 's/^v([0-9]+(\.[0-9]+)*)-([0-9]+)-/\1.r\3./';
}

prepare() {
  # makepkg reuses the VCS working copy across builds, so the last version's artifacts -- `build/`,
  #   `src/*.egg-info/`, `dist/` -- survive into the next one, and setuptools carries whatever the
  #   tree still holds into the new wheel. `git clean` removes everything the checkout does not
  #   track, which is exactly those artifacts.
  git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
  cd "${pkgbase}" || return 1;

  # One wheel, into this checkout's dist/. `prepare()` cleaned the tree; clearing dist/ as well
  #   keeps the package glob unambiguous even when the build is re-run with `--noprepare`.
  # `--no-isolation` states the fact that the build backend is an input of the package
  #   (`makedepends`) rather than something resolved from a package index: a build that reaches for
  #   the network is a build whose inputs changed.
  rm -rf dist
  "${_python}" -m build --wheel --no-isolation
}

check() {
  cd "${pkgbase}" || return 1;

  # The suite imports the distribution from the source tree -- no installed copy exists at check
  #   time -- which is what `src/` on PYTHONPATH is for; the pytest settings come from
  #   pyproject.toml. The tests build their repositories under tmpdir, so nothing is fetched, and
  #   the integration half runs for real because `git-bug` is a check dependency.
  PYTHONPATH="${srcdir}/${pkgbase}/src" "${_python}" -m pytest
}

# b4's bug browser is the consumer; ezgb is the library it calls. The package carries the
#   distribution, its typing marker and the licence, and nothing else -- there is no entry point to
#   install and no man page to place.
package_python-ezgb-git() {
  #region Derivations::Packaging::Replacing
  _pkgname_stem="${_stem_by_pkgname[${pkgname}]}"
  pkgdesc="${_pkgdesc_prefix}${_pkgdesc}${_pkgdesc_suffix}"

  # makepkg doesn't eval the whole `package_` fn, it only evaluates the toplevel
  #   and greps the provides/conflicts LINES.
  # Hence we inline here. Ugly.
  depends=(
    "${_python_package}"
    'python-pygit2'   # the only hard dependency pyproject.toml declares
  )
  optdepends=(
    'git-bug: for write operations and the cached bug listing'
  )
  provides=("${_release_pkgname}=${epoch:+"${epoch}:"}${pkgver}-${pkgrel}")
  conflicts=("${_release_pkgname}" "${_debugsyms_conflicts[@]}")
  #endregion Derivations::Packaging::Replacing

  cd "${pkgbase}" || return 1;
  "${_python}" -m installer --destdir="${pkgdir}" dist/ezgb-*.whl
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname_stem}/COPYING"
}
