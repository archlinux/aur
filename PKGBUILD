# Maintainer: alrayyes <alrayyes@users.noreply.github.com>
#
# Builds for real from the tagged release tarball, against Arch's own
# python-* packages — not the frozen-binary approach the .deb/.rpm
# path uses. AUR convention expects a real build the same way Nix's
# flake.nix does, and Arch's python-* packages track upstream closely
# enough that the naming/version-skew problem the .deb/.rpm path
# sidesteps with a frozen binary doesn't apply here. See
# openspec/changes/archive/2026-09-01-add-os-packaging/design.md for the
# full reasoning.
#
# Lives in this repo only for reference/review — the actual AUR
# package is maintained in its own git repo
# (ssh://aur@aur.archlinux.org/movie-planner.git), pushed there by
# the release job, not from here.
pkgname=movie-planner
pkgver=1.37.6
pkgrel=1
pkgdesc="CLI that logs watched movies and syncs them to a CalDAV calendar"
arch=('any')
url="https://github.com/alrayyes/movie-planner"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-caldav'
  'python-httpx'
  'python-icalendar'
  'python-questionary'
  'python-rapidfuzz'
  'python-tomlkit'
  'python-typer'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-uv-build'
  'python-click-man'
)
_tag="movie-planner-v${pkgver}"
_srcdir="movie-planner-${_tag}"
# Arch's python-caldav 3.7.0 imports calendaring_config but doesn't depend on
# it, and no Arch or AUR package provides it (#491). A PKGBUILD can't depend
# on a package that doesn't exist, so the pinned wheel is bundled here and
# installed with the app. Remove this (source, checksum, install line, the
# PYTHONPATH addition) once Arch ships the dependency or an AUR package
# exists, since a bundled copy would then conflict with it.
_ccver=0.5.0
_ccwhl="calendaring_config-${_ccver}-py3-none-any.whl"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/alrayyes/movie-planner/archive/${_tag}.tar.gz"
  "https://files.pythonhosted.org/packages/5f/17/3e4e04e3a344b2260139e64f53d34e95163e02b128b6066753540d5df524/${_ccwhl}"
)
noextract=("${_ccwhl}")
sha256sums=(
  'eee0e0e722b02d879f13b1fc8b5e1f136fdc3e7d3eadbb716b09441c1f14d94d'
  'c5e1f6ffaf428a59b0e1373d951eb8e7fd9f49924912e65548cc2803e73a8646'
)

build() {
  cd "$_srcdir"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"
  python -m installer --destdir="$pkgdir" "$srcdir/${_ccwhl}" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # One man page per command and subcommand, generated from the
  # source tree rather than the installed package — this project's
  # runtime dependencies are already on the system by this point
  # (makepkg installs depends= before build()/package() run), so the
  # CLI is importable straight off PYTHONPATH without a separate
  # install step. Matches flake.nix's approach for the same reason
  # scripts/generate-man.sh doesn't work here either: that script
  # shells out to `uv run`, which isn't part of this build at all.
  local mandir
  mandir="$(mktemp -d)"
  local site
  site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  PYTHONPATH="src:${pkgdir}${site}" python -c "
import datetime
import typer.main
from click_man.core import write_man_pages
from movie_planner.cli import app
write_man_pages('movie-planner', typer.main.get_command(app), version='${pkgver}', target_dir='${mandir}', date=datetime.date.today())
"
  gzip -9 "$mandir"/*.1
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$mandir"/*.1.gz
  rm -rf "$mandir"
}
