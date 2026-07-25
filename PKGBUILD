# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
_srcname=AstrBot
pkgver=4.26.7.r17.gf9c6129b9
pkgrel=1

pkgver() {
    cd "$srcdir/$_srcname"
    # Fetch all tags from origin/dev to support describe on all release tags
    git fetch --tags origin dev 2>/dev/null || true
    # Try annotated tags first; fall back to commit-based versioning
    local _ver
    if _ver=$(git describe --long --tags 2>/dev/null); then
        # Normalize git describe output like v4.22.2-66-gaa279f0c4 -> 4.22.2.r66.gaa279f0c4
        printf '%s' "$_ver" | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
    else
        # No tags reachable — use commit count + short hash
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

pkgdesc="Agentic IM Chatbot infrastructure with systemd multi-instance support"
arch=('any')
url="https://github.com/AstrBotDevs/AstrBot"
license=('AGPL-3.0-only')

depends=('python>=3.12' 'uv')
makedepends=('git')
optdepends=('certbot: HTTPS certificate helper for astrbotctl certbot')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "git+https://github.com/AstrBotDevs/AstrBot.git#branch=master"
    "astrbotctl"
    "astrbotctl.functions"
    "astrbot@.service"
    "tmpl.conf"
)

sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

install=astrbot-git.install

check() {
    cd "$srcdir/$_srcname"
    local _errcnt=0
    local _prompt_file="astrbot/core/astr_main_agent_resources.py"

    if [ -f astrbot/core/tools/prompts.py ]; then
        _prompt_file="astrbot/core/tools/prompts.py"
    fi

    # Syntax check: compile all .py files in key modules
    python -m py_compile astrbot/core/astr_main_agent_resources.py || _errcnt=$((_errcnt + 1))
    python -m py_compile astrbot/dashboard/server.py || _errcnt=$((_errcnt + 1))
    python -m py_compile astrbot/core/astr_agent_tool_exec.py || _errcnt=$((_errcnt + 1))
    python -m py_compile "$_prompt_file" || _errcnt=$((_errcnt + 1))
    python -m py_compile astrbot/core/core_lifecycle.py || _errcnt=$((_errcnt + 1))
    python -m py_compile astrbot/core/db/sqlite.py || _errcnt=$((_errcnt + 1))

    # Symbol checks (曾炸过的 import 路径)
    grep -q "class AstrBotDashboard" astrbot/dashboard/server.py || _errcnt=$((_errcnt + 1))
    if grep -R --include="*.py" -q "BACKGROUND_TASK_WOKE_USER_PROMPT" astrbot/core; then
        grep -q "BACKGROUND_TASK_WOKE_USER_PROMPT" "$_prompt_file" || _errcnt=$((_errcnt + 1))
    fi
    if grep -R --include="*.py" -q "CONVERSATION_HISTORY_INJECT_PREFIX" astrbot/core; then
        grep -q "CONVERSATION_HISTORY_INJECT_PREFIX" "$_prompt_file" || _errcnt=$((_errcnt + 1))
    fi
    grep -q "class AstrBotCoreLifecycle" astrbot/core/core_lifecycle.py || _errcnt=$((_errcnt + 1))

    [ "$_errcnt" -eq 0 ] || {
        echo "❌ check() failed with $_errcnt error(s)"
        exit 1
    }
}

package() {
    install -dm755 "$pkgdir/opt/astrbot"

    # The VCS source extracts to AstrBot/, while the package name stays lowercase.
    # Use dotglob so hidden files are included in the application payload.
    shopt -s dotglob
    cp -a "$srcdir"/"$_srcname"/* "$pkgdir/opt/astrbot/"
    shopt -u dotglob

    # Store version inside the application directory
    echo "$pkgver" >"$pkgdir/opt/astrbot/.version"

    if [ -f "$pkgdir/opt/astrbot/LICENSE" ]; then
        install -Dm644 "$pkgdir/opt/astrbot/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    else
        install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    install -Dm644 "$srcdir/tmpl.conf" "$pkgdir/etc/astrbot/tmpl.conf"
    install -Dm755 "$srcdir/astrbotctl" "$pkgdir/usr/bin/astrbotctl"
    install -Dm644 "$srcdir/astrbotctl.functions" \
        "$pkgdir/usr/bin/astrbotctl.functions"
    install -Dm644 "$srcdir/astrbot@.service" \
        "$pkgdir/usr/lib/systemd/system/astrbot@.service"
}
