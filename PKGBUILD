# Maintainer: lightjunction <lightjunction.me@gmail.com>

pkgname=astrbot-git
_pkgname=astrbot
_srcname=AstrBot
pkgver=4.27.2.r26.ga9bb8a64c
pkgrel=1

pkgver() {
    # shellcheck disable=SC2154 # makepkg provides srcdir.
    cd "$srcdir/$_srcname" || return 1
    # Keep VCS versions reproducible across clone configurations and Git versions.
    local _ver
    if _ver=$(git describe --long --tags --abbrev=9 2>/dev/null); then
        # Normalize git describe output like v4.22.2-66-gaa279f0c4 -> 4.22.2.r66.gaa279f0c4
        printf '%s' "$_ver" | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
    else
        # No tags reachable — use commit count + short hash
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
    fi
}

pkgdesc="Agentic IM Chatbot infrastructure with systemd multi-instance support"
arch=('any')
url="https://github.com/AstrBotDevs/AstrBot"
license=('AGPL-3.0-only')

depends=('python>=3.12' 'uv' 'util-linux')
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
    "no-dashboard-password-in-startup-log.patch"
)

sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'd5081794e8b9bdf1330a4227c9b8aa492c15a88bef930afac4301006ed703663')

install=astrbot-git.install

prepare() {
    # shellcheck disable=SC2154 # makepkg provides srcdir.
    cd "$srcdir/$_srcname" || return 1

    local target="astrbot/dashboard/server.py"
    local preimage_hash="728780b66a7a154694461d968c30dbcc5c034991b83796b70a547d3073a5be89"
    local postimage_hash="0d7a205df0854dbacef3efc8b2308028f30e40bd7666b1f75e9e558908a76845"
    local observed_hash

    _dashboard_credentials_hash() {
        python - "$1" <<'PY'
import ast
import hashlib
import pathlib
import sys

source = pathlib.Path(sys.argv[1]).read_bytes()
tree = ast.parse(source.decode("utf-8"))
matches = [
    node for node in ast.walk(tree)
    if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef))
    and node.name == "_build_dashboard_credentials_display"
]
if len(matches) != 1:
    raise SystemExit("expected one dashboard credential-display function")
node = matches[0]
lines = source.splitlines(keepends=True)
separator = lines[node.end_lineno:node.end_lineno + 1]
if separator != [b"\n"]:
    raise SystemExit("credential-display function must retain one reviewed separator line")
reviewed_span = b"".join(lines[node.lineno - 1:node.end_lineno + 1])
print(hashlib.sha256(reviewed_span).hexdigest())
PY
    }

    _assert_dashboard_credentials_postimage() {
        python - "$1" <<'PY'
import ast
import pathlib
import sys

tree = ast.parse(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
matches = [node for node in ast.walk(tree) if isinstance(node, ast.FunctionDef)
           and node.name == "_build_dashboard_credentials_display"]
if len(matches) != 1:
    raise SystemExit("expected one dashboard credential-display function")
node = matches[0]
if any(
    isinstance(part, ast.FormattedValue)
    and isinstance(part.value, ast.Name)
    and part.value.id == "generated_password"
    for part in ast.walk(node)
):
    raise SystemExit("generated dashboard password is still rendered")
clear_at = next((
    index for index, statement in enumerate(node.body)
    if isinstance(statement, ast.Expr)
    and isinstance(statement.value, ast.Call)
    and isinstance(statement.value.func, ast.Attribute)
    and statement.value.func.attr == "__setattr__"
    and len(statement.value.args) >= 2
    and isinstance(statement.value.args[1], ast.Constant)
    and statement.value.args[1].value == "_generated_dashboard_password"
), None)
if clear_at is None or not any(isinstance(statement, ast.Return) for statement in node.body[clear_at + 1:]):
    raise SystemExit("generated dashboard password is not cleared before the displayed return")
if not any(
    isinstance(part, ast.Constant)
    and isinstance(part.value, str)
    and "it is not logged" in part.value
    for part in ast.walk(node)
):
    raise SystemExit("password-free startup notice is missing")
PY
    }

    observed_hash="$(_dashboard_credentials_hash "$target")" || return 1
    case "$observed_hash" in
    "$preimage_hash")
        patch --dry-run --batch --forward --fuzz=0 -p1 -i "$srcdir/no-dashboard-password-in-startup-log.patch" || return 1
        patch --batch --forward --fuzz=0 -p1 -i "$srcdir/no-dashboard-password-in-startup-log.patch" || return 1
        ;;
    "$postimage_hash")
        git diff --quiet -- "$target" && {
            error "dashboard credential postimage is clean upstream code; review before accepting it"
            return 1
        }
        patch --reverse --dry-run --batch --forward --fuzz=0 -p1 -i "$srcdir/no-dashboard-password-in-startup-log.patch" || {
            error "dashboard credential postimage is not reversibly produced by the reviewed patch"
            return 1
        }
        ;;
    *)
        error "dashboard credential-display function has an unreviewed preimage"
        return 1
        ;;
    esac

    [ "$(_dashboard_credentials_hash "$target")" = "$postimage_hash" ] || {
        error "dashboard credential patch did not produce the reviewed postimage"
        return 1
    }
    _assert_dashboard_credentials_postimage "$target"
}

check() {
    # shellcheck disable=SC2154 # makepkg provides srcdir.
    cd "$srcdir/$_srcname" || return 1
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
    if grep -Fq 'Initial password: {generated_password}' astrbot/dashboard/server.py; then
        echo "❌ dashboard credential patch did not remove password interpolation"
        _errcnt=$((_errcnt + 1))
    fi

    [ "$_errcnt" -eq 0 ] || {
        echo "❌ check() failed with $_errcnt error(s)"
        exit 1
    }
}

package() {
    # shellcheck disable=SC2154 # makepkg provides pkgdir.
    install -dm755 "$pkgdir/opt/astrbot"

    # The VCS source extracts to AstrBot/, while the package name stays lowercase.
    # Use dotglob so hidden files are included in the application payload.
    shopt -s dotglob
    cp -a "$srcdir"/"$_srcname"/* "$pkgdir/opt/astrbot/"
    shopt -u dotglob

    # Runtime payload is package-managed; do not ship VCS history or alternates.
    rm -rf "$pkgdir/opt/astrbot/.git"

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
