# Maintainer: jinzhongjia <mail@nvimer.org>

# Scope: the KDE Plasma 6 applet only. Upstream also ships a Hyprland/Quickshell
# shell and a terminal frontend; neither is packaged or supported here.

_gitname=kde-ai-usage
# KPlugin.Id from package/metadata.json — the plasmoid install dir, the icon
# name and the kpackagetool6 removal id all derive from it.
_plasmoid=org.muddyblack.aiUsageWidget

pkgname=plasma6-applets-ai-usage
pkgver=2.1.0
pkgrel=1
pkgdesc="KDE Plasma 6 panel widget tracking AI usage quotas across 11 AI providers"
arch=('any')
url="https://github.com/Muddyblack/kde-ai-usage"
license=('MIT')
# The backend is stdlib-only Python driven by bash launchers; the widget reaches
# it through plasma5support's executable DataEngine.
depends=('libplasma' 'plasma5support' 'python' 'hicolor-icon-theme')
optdepends=(
    'claude-code: Claude subscription windows and local activity stats'
    'codex-bin: Codex/ChatGPT plan limits and account status for the OpenAI tab'
    'kiro: Kiro monthly credit tracking'
    'antigravity: Antigravity/Google AI Studio quota tracking'
    'nodejs: run the antigravity-usage CLI for richer Antigravity data'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ad0aec4f51a348ef2839224ad833c04deb0e38287703a43bc60f216f9b631363')

check() {
    cd "${_gitname}-${pkgver}"
    # Contract tests for the backend the widget shells out to. They are pure
    # fixture replays — no network, no credentials — so they are safe in a
    # clean chroot. tests/ai-usage-cli.test.sh is skipped on purpose: it covers
    # the terminal frontend, which this package does not ship.
    ./tests/get-ai-usage.test.sh
    ./tests/python-interp.test.sh
    ./tests/get-codex-stats.test.sh
    ./tests/get-codex-rate-limits.test.sh
}

package() {
    cd "${_gitname}-${pkgver}"

    local _root="${pkgdir}/usr/share/plasma/plasmoids/${_plasmoid}"

    install -dm755 "${_root}"
    cp -r package/. "${_root}/"

    # cp carries the tarball's group-writable bits over; normalise, then put the
    # exec bit back on the launchers. main.qml drives get-ai-usage,
    # export-snapshot and history-io through the executable DataEngine;
    # ai-usage-cli is left runnable because the widget's own settings page
    # prints its in-package path, and a 644 file there would just fail for
    # anyone who follows that hint. python-interp.sh stays 644 — it is sourced,
    # never executed.
    find "${_root}" -type d -exec chmod 755 {} +
    find "${_root}" -type f -exec chmod 644 {} +
    chmod 755 "${_root}"/contents/tools/sh/{ai-usage-cli,get-ai-usage,export-snapshot,history-io}

    # plasmashell inherits the systemd user session's PATH, not a login shell's
    # — a `python3` that only exists via a shell rc file makes every provider
    # render "python3 missing". Pin the distro interpreter so the installed
    # widget is self-contained. $PYTHON3 (and the widget's Settings -> Advanced
    # -> Python field) still win, and the PATH candidates further down in
    # python-interp.sh still act as fallbacks. Patched here rather than in
    # prepare() so check() gets to run the suite against pristine sources: its
    # "no interpreter" case assumes the unpinned default.
    grep -q '^PY_DEFAULT="python3"$' "${_root}/contents/tools/sh/python-interp.sh"
    sed -i 's|^PY_DEFAULT="python3"$|PY_DEFAULT="/usr/bin/python3"|' \
        "${_root}/contents/tools/sh/python-interp.sh"

    # Plasma's Widget Explorer looks the icon up by name in the icon theme, not
    # inside the plasmoid, so it has to be registered in hicolor as well.
    install -Dm644 "package/contents/icons/${_plasmoid}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_plasmoid}.svg"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/provider-contract.md \
        "${pkgdir}/usr/share/doc/${pkgname}/provider-contract.md"
}
