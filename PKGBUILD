# Maintainer: 0zitro <94910351+0zitro@users.noreply.github.com>
#
# namebind runs host-native processes -- ordinary binaries on the host, not
# container images -- each inside its own per-app network namespace, so every
# app gets a stable IP and its services are reached by name
# (`<svc>.<app>.<domain>`) instead of by remembered port numbers. podman owns
# the per-app pod (the shared netns + bridge IP + refcounted lifecycle); the
# host process is `nsenter`'d into it and dropped back to the caller's identity.
#
# Ships the `namebind` CLI (Python/Typer) and the systemd pod-template unit that
# backs the per-app pod lifecycle.

_pkgname=namebind
pkgname="${_pkgname}"
pkgver=0.36.1
pkgrel=1
pkgdesc="Per-app network namespaces; reach host services by name, not port number"
arch=('any')  # pure Python + console script + a systemd unit

# Using the public org because my profile is set to limited visibility,
#   so anyone who is not on Disroot cannot even read the repo
#   and this would also require you having SSH to your account configured for machine access.
# I had set up a push mirror from my main account, `0zitro` to this public org so that
#   this repo is accessible and buildable by anyone with a Git-capable machine, without
#   needing to set up SSH keys or a Codeberg account.
_url="git.disroot.org/0zitro-public/namebind"
url="https://${_url}"
license=('Elastic-2.0')   # Elastic License 2.0; not in `licenses`, shipped below

# Prints /usr/share/namebind/post-install.txt (shipped from the repo's assets/).
# Stable shim: the message it shows is in the repo, so this never changes with it.
install="${_pkgname}.install"

depends=(
  'python'
  'python-typer'              # the CLI framework (also a wheel runtime dependency)
  'python-kdl-py'             # KDL parser for the central config (wheel runtime dep)
  'python-pydantic'           # validated config + boundary models (Settings, Docker JSON)
  'python-pydantic-settings'  # the env+KDL Settings source (wheel runtime dep)
  'podman'         # the per-app pod == the network namespace + bridge IP (rootful)
  'nftables'       # nft: the portless DNAT rules + the kernel egress masquerade
  'passt'          # pasta: the default (userspace) host egress
  'sudo'           # the CLI elevates its one privileged call (systemd-run/podman)
)
# `nsenter` + `setpriv` + `kill` (util-linux), `ip` (iproute2; also ipvlan/veth), `sleep`
# (coreutils; the create-anchor's idle payload) and `systemctl` + `systemd-run` + `busctl`
# (systemd; busctl creates the leash scope) are part of `base` and assumed present.
optdepends=(
  'dnsmasq: resolve <svc>.<app>.<domain> names by watching /var/lib/namebind/hosts.d'
  'docker: join Docker containers to the fabric via the libnetwork driver (namebind-docker.service)'
  'iptables-nft: kernel host egress (egress "host" via="kernel") -- reads the FORWARD policy, inserts the DOCKER-USER accept'
  'iputils: arping for the managed-egress external-ip duplicate-address check (best-effort)'
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
  'python-hypothesis'     # property tests for the address-derivation permutation
)

# provides=("${_pkgname}=${pkgver}-${pkgrel}")
# conflicts=("${_pkgname}-git")

# _repo_git_url="ssh://git@${_url}.git"  # If you have SSH configured for Codeberg
_repo_git_url="https://${_url}.git"  # Anonymous machine-ready access
source=("${_pkgname}::git+${_repo_git_url}?signed#tag=v${pkgver}"
# To build a checkout instead of a published tag,
#   either use `namebind-git` for the master,
#   or use a local checkout (where you may or may not have done any changes) ::
#
#   > source=("$pkgname::git+file://$(git -C CONTEXT rev-parse --show-toplevel)#commit=<commit-ish of our choice>")
#
#   where CONTEXT is any path within the repo including the root itself.
# The entire `-C CONTEXT` option is optional if your current directory
#   (from `makepkg`'s PoV) is already somewhere inside the repo.
       )

sha256sums=('1ef298804e5978a28868e94dde7ca1121ffd9d9e698b23fdc501bad0009af608'
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

  # Install the committed static assets (the systemd pod template, etc.) into the
  # staging root. @NAMEBIND@ resolves to the packaged /usr/bin/namebind (the
  # script's default --bindir). The pod template is instantiated on demand as
  # namebind-pod@<app>.service and refcounted by the per-run member units.
  bash scripts/install-assets.sh --destdir "${pkgdir}"

  # Ship the licence (Elastic-2.0 is not in the `licenses` package).
  install -Dm644 LICENCE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE.md"
}
