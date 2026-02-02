# Maintainer: Tom Hale  Tom at the rate of "hale" point "ee"

# MAINTAINER WANTED
# I vibe coded this to try to get litellm-proxy working.
# https://www.perplexity.ai/search/create-pkgbuild-for-fastapi-ss-2eYG_wrTRoWwZ4U.ViGkrQ#7
# You could do better than perplexity.  Your community needs YOU! 👇

pkgname=python-fastapi-sso-git
_pkgname=fastapi-sso
pkgver=0.19.0
pkgrel=1
pkgdesc="FastAPI plugin to enable SSO to most common providers (latest tagged version)"
arch=('any')
url="https://github.com/tomasvotava/fastapi-sso"
license=('MIT')
depends=('python' 'python-fastapi' 'python-httpx' 'python-oauthlib' 'python-pydantic' python-pyjwt python-typing_extensions python-starlette)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
provides=("python-fastapi-sso=${pkgver}")
conflicts=('python-fastapi-sso')
source=("git+https://github.com/tomasvotava/fastapi-sso.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Get the latest tag (sorted by version number), ignoring 'v' prefix
    git -c 'versionsort.suffix=-' \
        tag --sort=-v:refname | head -n1 | sed 's/^v//'
}

prepare() {
    cd "$_pkgname"
    # Dynamically checkout the latest tag found in pkgver
    # We use the raw tag from git, not the sanitized pkgver variable
    local _latest_tag
    _latest_tag=$(git -c 'versionsort.suffix=-' tag --sort=-v:refname | head -n1)

    msg2 "Checking out latest tag: ${_latest_tag}"
    git checkout "${_latest_tag}" .
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license if available
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
