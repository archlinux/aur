# Maintainer: Ryan Kes <ryan@andthensome.nl>
#
# Builds for real from the tagged release tarball, against Arch's own
# python-* packages — not the frozen-binary approach the .deb/.rpm path
# uses. AUR convention expects a real build the same way Nix's
# flake.nix does, and Arch's python-* packages track upstream closely
# enough that the naming/version-skew problem the .deb/.rpm path
# sidesteps with a frozen binary doesn't apply here.
#
# Lives in this repo only for reference/review — a real AUR package for
# a project stamped from this template is maintained in its own git repo
# (ssh://aur@aur.archlinux.org/<pkgname>.git), pushed there by the
# release job, not from here. `pkgver`/`sha256sums` below track this
# template repo's own dev placeholder until a project stamped from it
# renames the package and cuts its first real release.
pkgname=scaffold-python-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="GitHub template for a Python/uv/Typer command-line tool"
arch=('any')
url="https://github.com/alrayyes/scaffold-python-cli"
# No standard licence chosen for this template itself — see LICENSE. A
# project stamped from it names its own licence here once it picks one.
license=('custom')
depends=(
  'python'
  'python-platformdirs'
  'python-tomli-w'
  'python-typer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-uv-build'
  'python-click-man'
)
_tag="scaffold-python-cli-v${pkgver}"
_srcdir="scaffold-python-cli-${_tag}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alrayyes/scaffold-python-cli/archive/${_tag}.tar.gz")
# No release has been tagged yet — nothing at this URL for a real
# checksum to pin. The release job's own "Bump pkgver and the
# release-tarball checksum" step (see .github/workflows/release.yml)
# overwrites this with a real one against the actual tag before it
# builds and pushes to the AUR; SKIP only matters for this committed
# reference copy until the first release cuts.
sha256sums=('5fe80ecf501788d36e58067c886631166e666a846b8e944e755b0bcf8a4e9b24')

build() {
  cd "$_srcdir"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # One man page per command and subcommand, generated from the source
  # tree rather than the installed package — this project's runtime
  # dependencies are already on the system by this point (makepkg
  # installs depends= before build()/package() run), so the CLI is
  # importable straight off PYTHONPATH without a separate install step.
  # Matches flake.nix's approach for the same reason
  # scripts/generate-man.sh doesn't work here either: that script shells
  # out to `uv run`, which isn't part of this build at all.
  local mandir
  mandir="$(mktemp -d)"
  PYTHONPATH="src" python -c "
import datetime
import typer.main
from click_man.core import write_man_pages
from scaffold_python_cli.cli import app
write_man_pages('scaffold-python-cli', typer.main.get_command(app), version='${pkgver}', target_dir='${mandir}', date=datetime.date.today())
"
  gzip -9 "$mandir"/*.1
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$mandir"/*.1.gz
  rm -rf "$mandir"
}
