# Maintainer: komex <kolchenko at ptsecurity dot com>
# Contributor: komex <kolchenko at ptsecurity dot com>

pkgname=llm-stats-git
_pkgname=llm-stats
pkgver=r157.3d2753f
pkgrel=2
pkgdesc="Anthropic/OpenAI passthrough proxy with Prometheus metrics, structured logging and SSE streaming (env-only config)"
arch=('x86_64')
url="https://gitlab.com/komex/llm-stats"
license=('MIT')
depends=()
makedepends=('go' 'git')
optdepends=(
    'promtail: log shipping to Loki (recommended for production observability)'
    'prometheus: metrics scraping'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

# Post-install hook: prints env-based next steps. See llm-stats.install.
install=llm-stats.install

# Dynamic pkgver from upstream git history.
# Uses 'git describe' when at least one tag is reachable; otherwise falls
# back to "r<count>.g<shortsha>".
pkgver() {
    cd "${_pkgname}" || exit 1
    local _desc
    # `git describe` exits non-zero when no tag is reachable; capture both
    # stdout and the exit status into _desc without aborting the shell.
    _desc="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
    if [[ -n "$_desc" ]]; then
        printf '%s' "$_desc" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "${_pkgname}"

    export CGO_ENABLED=0

    # build:release applies -trimpath + -ldflags "-s -w" via Taskfile.yml so
    # the same flags are documented in one place and easy to extend later
    # (-X main.version=..., etc). BINARY override places the artefact at the
    # repo root instead of bin/llm-stats so package() can install it directly.
    go tool task build:release BINARY="${_pkgname}"
}

check() {
    cd "${_pkgname}"

    # -race requires cgo; build() sets CGO_ENABLED=0, so reset here.
    export CGO_ENABLED=1

    go tool task test-fresh
}

package() {
    cd "${_pkgname}"

    install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # AUR-maintained systemd unit: env-only модель (binary не принимает
    # --config после passthrough-рефактора upstream). Upstream
    # packaging/llm-stats.service по-прежнему дёргает --config и
    # /etc/llm-stats/config.yaml — НЕ используем, поставляем свой.
    install -Dm0644 "${srcdir}/../${_pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    install -Dm0644 ../../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# Нет backup=(): конфиг env-only, всё настраивается через Environment=
# / EnvironmentFile= в systemd drop-in. /etc/llm-stats/ НЕ создаётся
# (см. llm-stats.install post_install).
