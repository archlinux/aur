# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=git-changelog
pkgname=python-git-changelog
pkgver=2.9.7
pkgrel=1
pkgdesc="Automatic changelog generator using Jinja2 templates"
arch=('any')
url="https://github.com/pawamoy/git-changelog"
license=('ISC')
depends=(
    'git'
    'python>=3.10'
    'python-jinja>=3.0'
    'python-packaging>=26.0'
    'python-platformdirs>=4.4'
    'python-semver>=3.0'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-pdm-backend'
)
checkdepends=(
    'mkdocstrings>=0.29'
    'python-griffe>=2.0'
    'python-pytest>=8.2'
    'python-pytest-cov>=5.0'
    'python-pytest-gitconfig>=0.7'
    'python-pytest-randomly>=3.15'
    'python-pytest-xdist>=3.6'
    'python-tomli-w>=1.2'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pawamoy/git-changelog/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1192a29a8ab7c8d7c371ead7866912ce5716ec8d6aefb8ca7b1a186fb97a1beb')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    local _check_dir="$srcdir/_check"
    local _python_version
    local _site_packages
    local _smoke_repo="$srcdir/smoke-repo"
    local _smoke_output="$srcdir/smoke-changelog.md"

    _python_version="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
    _site_packages="$_check_dir/usr/lib/python$_python_version/site-packages"

    rm -rf "$_check_dir" "$_smoke_repo" "$_smoke_output"
    python -m installer --destdir="$_check_dir" dist/*.whl

    # Upstream runs tests from a Git checkout, while release archives omit
    # repository metadata. Recreate the checkout context expected by test_main.
    rm -rf .git
    git init -q -b main .
    git config user.name "Arch Linux"
    git config user.email "arch@example.invalid"
    git add -A
    git commit -q -m "chore: source archive"

    # Run upstream's complete test suite against the staged wheel.
    # Upstream itself skips inventory checks when its generated site/objects.inv
    # documentation artifact is not present in the release archive.
    PYTHONPATH="$_site_packages" pytest -c config/pytest.ini -n auto tests

    # Exercise both the installed Python API and CLI on a realistic Git history.
    git init -q -b main "$_smoke_repo"
    git -C "$_smoke_repo" config user.name "Arch Linux"
    git -C "$_smoke_repo" config user.email "arch@example.invalid"
    git -C "$_smoke_repo" remote add origin "https://github.com/example/widgets.git"
    git -C "$_smoke_repo" commit -q --allow-empty -m "chore: initial release"
    git -C "$_smoke_repo" tag 1.0.0
    git -C "$_smoke_repo" commit -q --allow-empty -m "feat: add widget support"
    git -C "$_smoke_repo" commit -q --allow-empty -m "fix: handle empty widgets"

    PYTHONPATH="$_site_packages" python - "$_smoke_repo" <<'PY'
import sys

from git_changelog import AngularConvention, Changelog, get_template

repository = sys.argv[1]
changelog = Changelog(repository, convention=AngularConvention, bump="auto")
assert changelog.versions_list[0].planned_tag == "1.1.0"
rendered = get_template("keepachangelog").render(changelog=changelog)
assert "add widget support" in rendered
assert "handle empty widgets" in rendered
PY

    PYTHONPATH="$_site_packages" "$_check_dir/usr/bin/git-changelog" \
        "$_smoke_repo" \
        --config-file no \
        --convention angular \
        --bump auto \
        --output "$_smoke_output"
    grep -q '## \[1.1.0\]' "$_smoke_output"
    grep -q 'add widget support' "$_smoke_output"
    grep -q 'handle empty widgets' "$_smoke_output"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
