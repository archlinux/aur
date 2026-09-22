# Maintainer: Zack Fitch <zack@internetuniverse.org>
pkgname=claude-cowork-linux
pkgver=1.1.4010
pkgrel=14
pkgdesc="Anthropic Claude Desktop with Cowork (local agent) support for Linux"
arch=('x86_64')
url="https://github.com/johnzfitch/claude-cowork-linux"
license=('custom:proprietary')
depends=(
    'electron'
    'nodejs'
    'curl'
    'zstd'
)
# gnome-keyring is recommended but not required; launcher detects SecretService
# at runtime and falls back to --password-store=basic if unavailable
makedepends=(
    'p7zip'
    'asar'
    'curl'
    # build() runs `python "${_repo}/enable-cowork.py"` unconditionally, so this
    # is a hard build dependency. It was listed only in optdepends, which meant
    # a clean-chroot build (the way AUR packages are supposed to be built) had
    # no python and failed inside the patch loop -- and the recipe reported it
    # as "the bundle layout may have changed" rather than a missing dependency.
    'python'
)
optdepends=(
    'xdg-utils: for opening URLs'
    'bubblewrap: for sandbox isolation'
    'gnome-keyring: SecretService provider for secure credential storage'
    'kwallet: SecretService provider for KDE users'
    'python: for enable-cowork.py patch script'
)
provides=('claude-cowork' 'claude-desktop')
conflicts=(
    'claude-cowork'
    'claude-desktop'
    'claude-desktop-bin'
    'claude-desktop-native'
    'claude-desktop-appimage'
)
options=('!strip')

source=(
    "git+https://github.com/johnzfitch/claude-cowork-linux.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}"

    # Use Node.js to query the DMG API
    local version
    version=$(node "${srcdir}/claude-cowork-linux/fetch-dmg.js" 2>/dev/null \
        | awk '{print $1}')

    echo "${version:-1.1.4010}"
}

prepare() {
    cd "${srcdir}"

    # Fetch latest DMG URL via Node.js, download with curl
    echo "Fetching latest Claude Desktop DMG URL..."
    local dmg_url
    dmg_url=$(node "${srcdir}/claude-cowork-linux/fetch-dmg.js" --url)
    echo "Downloading DMG from CDN..."
    curl -fSL --progress-bar -o "${srcdir}/Claude.dmg" "$dmg_url"
}

build() {
    cd "${srcdir}"

    local _repo="${srcdir}/claude-cowork-linux"

    # Extract DMG with 7z
    echo "Extracting DMG..."
    local seven_z_exit=0
    7z x -y "${srcdir}/Claude.dmg" -o"${srcdir}/dmg-extracted" >/dev/null 2>&1 || seven_z_exit=$?
    # 7z exit 1 = warning (e.g. "Dangerous link path" for /Applications symlink)
    if [[ $seven_z_exit -gt 2 ]]; then
        echo "Error: Failed to extract DMG (7z exit code: $seven_z_exit)"
        return 1
    fi

    # Find Claude.app and app.asar
    local _claude_app
    _claude_app=$(find "${srcdir}/dmg-extracted" -name "Claude.app" -type d | head -1)
    if [[ -z "$_claude_app" ]]; then
        echo "Error: Claude.app not found in DMG"
        return 1
    fi

    local _app_asar="${_claude_app}/Contents/Resources/app.asar"
    if [[ ! -f "$_app_asar" ]]; then
        echo "Error: app.asar not found at: $_app_asar"
        return 1
    fi

    # Extract app.asar
    asar extract "$_app_asar" "${srcdir}/linux-app-extracted"

    # Copy unpacked native modules if present
    local _unpacked="${_claude_app}/Contents/Resources/app.asar.unpacked"
    if [[ -d "$_unpacked" ]]; then
        cp -r "$_unpacked"/* "${srcdir}/linux-app-extracted/" 2>/dev/null || true
    fi

    # Copy resources/ from DMG (i18n, icons, etc.) excluding the asar itself
    local _resources_dir="${_claude_app}/Contents/Resources"
    mkdir -p "${srcdir}/linux-app-extracted/resources"
    for item in "$_resources_dir"/*; do
        local name
        name=$(basename "$item")
        case "$name" in
            app.asar|app.asar.unpacked) continue ;;
        esac
        cp -r "$item" "${srcdir}/linux-app-extracted/resources/$name" 2>/dev/null || true
    done

    # Bake stubs into node_modules
    mkdir -p "${srcdir}/linux-app-extracted/node_modules/@ant/claude-swift/js"
    mkdir -p "${srcdir}/linux-app-extracted/node_modules/@ant/claude-native"
    cp -f "${_repo}/stubs/@ant/claude-swift/js/index.js" \
          "${srcdir}/linux-app-extracted/node_modules/@ant/claude-swift/js/index.js"
    # index.js plus every sibling helper it require()s. safe_fs.js landed with
    # the 1.22209.x safe-fs containment API and is require()d unconditionally at
    # the top of index.js, but this line still named index.js alone -- so the
    # package shipped a stub whose first require() throws MODULE_NOT_FOUND, four
    # months after the helper was added. install.sh and launch.sh both copy the
    # whole glob; this is the same copy-loop drift as #170, one directory over.
    cp -f "${_repo}"/stubs/@ant/claude-native/*.js \
          "${srcdir}/linux-app-extracted/node_modules/@ant/claude-native/"

    # Copy frame-fix files
    cp -f "${_repo}/stubs/frame-fix/frame-fix-entry.js" \
          "${srcdir}/linux-app-extracted/frame-fix-entry.js"
    cp -f "${_repo}/stubs/frame-fix/frame-fix-wrapper.js" \
          "${srcdir}/linux-app-extracted/frame-fix-wrapper.js"

    # Copy cowork orchestration modules
    mkdir -p "${srcdir}/linux-app-extracted/cowork"
    cp -f "${_repo}"/stubs/cowork/*.js \
          "${srcdir}/linux-app-extracted/cowork/"
    cp -f "${_repo}"/stubs/cowork/*.sh \
          "${srcdir}/linux-app-extracted/cowork/" 2>/dev/null || true

    # Linux port wiring (mirrors launch.sh; without these the renderer UI never appears).
    echo "Applying Linux port patches..."
    local _ext="${srcdir}/linux-app-extracted"
    local _pkgjson="${_ext}/package.json"
    local _indexjs="${_ext}/.vite/build/index.js"

    # Trampoline: override resourcesPath, then load frame-fix-entry.js.
    cat > "${_ext}/trampoline.js" <<'JSEOF'
Object.defineProperty(process, 'resourcesPath', {
    value: '/usr/lib/claude-cowork/resources',
    writable: true,
    configurable: true,
    enumerable: true,
});
require('./frame-fix-entry.js');
JSEOF

    # Repoint asar main → trampoline.js.
    if grep -q '"main":.*"\.vite/build/index\.pre\.js"' "$_pkgjson"; then
        sed -i 's|"main":.*"\.vite/build/index\.pre\.js"|"main": "trampoline.js"|' "$_pkgjson"
    else
        echo "WARN: asar entry-point patch skipped (target not found)"
    fi

    # Apply the main-process patch passes. The pass list itself lives in the
    # repo's patch-index.sh, which launch.sh sources too — one definition, so
    # the recipe cannot fall behind the launcher again. It did: build() applied
    # 3 of the 9 passes, and because /usr/bin/claude-cowork execs electron
    # directly against the packaged asar and never runs launch.sh, AUR users
    # silently lost the MCP node-host, resourcesPath, Handoff and --effort
    # fixes — most visibly as "MCP Filesystem: Node host not found" (#170).
    #
    # patch_index_apply_all discovers index.js plus every index*.chunk-*.js in
    # the build dir and leaves them in INDEX_TARGETS, which the enable-cowork.py
    # loop below reuses.
    local _build_dir="${_ext}/.vite/build"
    if [ ! -f "$_indexjs" ]; then
        echo "ERROR: main-process entry not found at $_indexjs" >&2
        echo "       The extracted Claude Desktop bundle layout may have changed;" >&2
        echo "       cannot locate the code to patch, so Cowork could not be enabled." >&2
        return 1
    fi
    if [ ! -f "${_repo}/patch-index.sh" ]; then
        echo "ERROR: patch-index.sh not found in ${_repo}" >&2
        echo "       It carries every main-process patch pass; packaging without" >&2
        echo "       it would ship an app with macOS titlebars, no local MCP" >&2
        echo "       servers, and a renderer shell that never loads." >&2
        return 1
    fi
    # shellcheck source=patch-index.sh
    source "${_repo}/patch-index.sh"
    # Fail the build on a chunk that no longer parses. launch.sh only warns --
    # refusing to start an app that would otherwise work is worse than a warning
    # -- but a package that opens a blank window should never leave the builder.
    PATCH_INDEX_STRICT_SYNTAX=1
    if ! patch_index_apply_all "$_build_dir"; then
        echo "ERROR: a patched main-process chunk failed node --check." >&2
        echo "       Packaging it would ship an app that opens a blank window." >&2
        return 1
    fi

    # Add linux branch to getHostPlatform() (without this, the minified
    # platform switch throws "Unsupported platform: linux-x64" and the
    # ClaudeCode.prepare IPC fails -- Cowork tasks fail in the UI with a
    # generic "Something went wrong" banner).
    # This inline pass targets index.js only: its insert hardcodes the arch
    # variable name (A), which is minifier-assigned and unsafe to splice into a
    # chunk where it may differ. On split-entry builds this switch lives in the
    # chunk, where enable-cowork.py's host-platform patch (run across all targets
    # below) handles it instead — so finding nothing here is expected, not a bug.
    if grep -q 'win32-arm64":"win32-x64";throw new Error' "$_indexjs"; then
        sed -i 's|win32-arm64":"win32-x64";throw new Error|win32-arm64":"win32-x64";if(process.platform==="linux")return A==="arm64"?"linux-arm64":"linux-x64";throw new Error|' "$_indexjs"
        echo "Patched getHostPlatform() linux branch in index.js"
    else
        echo "Note: inline getHostPlatform patch not applied to index.js (handled by enable-cowork.py on split-entry builds)"
    fi

    # Duplicate i18n JSONs into resources/i18n/ (bundle reads from both paths).
    if ls "${_ext}/resources/"*.json >/dev/null 2>&1; then
        mkdir -p "${_ext}/resources/i18n"
        cp "${_ext}/resources/"*.json "${_ext}/resources/i18n/"
    fi

    # Allow bash/sh in cowork orchestrator allowlist (upstream gap -- the SDK
    # calls vm.spawn("bash", ...) which the allowlist currently rejects).
    # Guard matches either quote style so this no-ops once stubs/cowork/
    # session_orchestrator.js is patched upstream. Remove this whole block
    # after that fix lands.
    local _orch="${_ext}/cowork/session_orchestrator.js"
    if grep -q '} else if (allowedPrefixes\.some' "$_orch" \
       && ! grep -qE "commandBasename === [\"']bash[\"']" "$_orch"; then
        sed -i 's#^    } else if (allowedPrefixes\.some#    } else if (commandBasename === "bash" || commandBasename === "sh") {\n      hostCommand = "/usr/bin/" + commandBasename;\n      trace("Translated shell command: " + normalizedCommand + " -> " + hostCommand);\n    } else if (allowedPrefixes.some#' "$_orch"
    else
        echo "WARN: bash/sh allowlist patch skipped (target not found or already patched)"
    fi

    # Apply cowork patch. On split-entry builds the platform gate, IPC origin
    # guards, and host-platform code live in the chunk (not index.js), so run
    # enable-cowork.py across index.js plus every discovered chunk. The script is
    # idempotent (marker-guarded) and exits non-zero when a file lacks the
    # platform gate (expected for the shim and chunks without it). Capture each
    # run's output: print it when the file was patched, but suppress the script's
    # "Platform-gate function not found" noise for the expected misses so a
    # successful build log stays clean. Require at least one target to patch;
    # otherwise fail the build loudly — surfacing the stashed output to diagnose
    # a bundle-layout change — rather than ship a package with Cowork disabled.
    #
    # --sweep declares that this loop covers every discovered target, which tells
    # enable-cowork.py its per-file misses are expected. Without it the script
    # reports a miss as the stale-recipe error of #189 -- correct for a recipe
    # that patches index.js alone, wrong and alarming here. Passed AFTER the
    # path: an older copy of the script reads argv[1] as the target and ignores
    # the rest, so the argument degrades instead of breaking.
    echo "Applying cowork patch to ${#INDEX_TARGETS[@]} file(s)..."
    local _t _out _any_patched="" _miss_log=""
    for _t in "${INDEX_TARGETS[@]}"; do
        if _out="$(python "${_repo}/enable-cowork.py" "$_t" --sweep 2>&1)"; then
            _any_patched=1
            [ -n "$_out" ] && printf '%s\n' "$_out"
        else
            echo "  Skipped ${_t##*/} (no platform gate; patched in another target)"
            _miss_log+="--- ${_t##*/} ---"$'\n'"$_out"$'\n'
        fi
    done
    if [ -z "$_any_patched" ]; then
        echo "ERROR: cowork platform gate not found in index.js or any index*.chunk-*.js" >&2
        echo "       Claude Desktop's bundle layout may have changed; Cowork would not be enabled." >&2
        echo "       enable-cowork.py output follows:" >&2
        printf '%s' "$_miss_log" >&2
        return 1
    fi
    echo "Cowork patches applied"

    # Re-check syntax before packing. patch_index_apply_all already ran this,
    # but three things rewrite these files AFTER it: the inline getHostPlatform
    # sed above, and enable-cowork.py's own passes (several of which are
    # markerless and substitute globally). Without this second call the
    # "never ship a blank window" guarantee stops at the sed passes and misses
    # the patcher entirely.
    if ! PATCH_INDEX_STRICT_SYNTAX=1 patch_index_verify_syntax; then
        echo "ERROR: a main-process chunk failed node --check after enable-cowork.py." >&2
        echo "       Packaging it would ship an app that opens a blank window." >&2
        return 1
    fi

    # Repack into app.asar
    echo "Repacking app.asar..."
    asar pack "${srcdir}/linux-app-extracted" "${srcdir}/app.asar"
}

package() {
    cd "${srcdir}"

    # Install repacked app.asar
    install -Dm644 "${srcdir}/app.asar" \
                   "${pkgdir}/usr/lib/claude-cowork/app.asar"

    # Resources in our namespace (avoid /usr/lib/electronNN/, foreign-owned).
    # i18n in BOTH root and i18n/ -- bundle reads from both paths.
    install -d "${pkgdir}/usr/lib/claude-cowork/resources/i18n"
    install -m644 "${srcdir}/linux-app-extracted/resources/"*.json \
        "${pkgdir}/usr/lib/claude-cowork/resources/"
    install -m644 "${srcdir}/linux-app-extracted/resources/i18n/"*.json \
        "${pkgdir}/usr/lib/claude-cowork/resources/i18n/"
    install -m755 "${srcdir}/linux-app-extracted/cowork/cowork-plugin-shim.sh" \
        "${pkgdir}/usr/lib/claude-cowork/resources/cowork-plugin-shim.sh"

    # Disclaimer stub: exists so the asar's path check passes.
    # Exec calls are intercepted in-process by frame-fix-wrapper.
    install -Dm755 /dev/stdin "${pkgdir}/usr/lib/claude-cowork/Helpers/disclaimer" <<'EOF'
#!/bin/sh
CMD="$1"
shift
case "$CMD" in
  *claude.app/Contents/MacOS/claude|*claude.app/Contents/MacOS/Claude)
    for c in \
      "$HOME/.local/bin/claude" \
      "$HOME/.local/share/mise/shims/claude" \
      "$HOME/.asdf/shims/claude" \
      "/usr/local/bin/claude" \
      "/usr/bin/claude"; do
      [ -x "$c" ] && exec "$c" "$@"
    done
    exit 127
    ;;
esac
exec "$CMD" "$@"
EOF

    # Install launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/claude-cowork" <<'EOF'
#!/bin/bash
# Claude Cowork Linux launcher

if [[ -n "$WAYLAND_DISPLAY" ]] || [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

# Detect password store backend
PW_STORE="gnome-libsecret"
if ! dbus-send --session --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus \
     org.freedesktop.DBus.NameHasOwner string:"org.freedesktop.secrets" 2>/dev/null \
     | grep -q "boolean true"; then
    PW_STORE="basic"
fi

# Register claude:// protocol handler if not already set
if command -v xdg-mime >/dev/null 2>&1; then
    _current_handler="$(xdg-mime query default x-scheme-handler/claude 2>/dev/null || true)"
    if [[ -z "$_current_handler" ]]; then
        xdg-mime default claude-cowork.desktop x-scheme-handler/claude 2>/dev/null || true
    fi
fi

# Sandbox: prefer Chromium sandbox when user namespaces are available
_sandbox_flag="--no-sandbox"
if [[ -f /proc/sys/kernel/unprivileged_userns_clone ]]; then
    [[ "$(cat /proc/sys/kernel/unprivileged_userns_clone 2>/dev/null)" == "1" ]] && _sandbox_flag=""
elif [[ -f /proc/sys/user/max_user_namespaces ]]; then
    _max_ns="$(cat /proc/sys/user/max_user_namespaces 2>/dev/null)"
    [[ "$_max_ns" -gt 0 ]] 2>/dev/null && _sandbox_flag=""
fi

exec electron /usr/lib/claude-cowork/app.asar \
    ${_sandbox_flag} \
    --disable-gpu \
    --class=Claude \
    --password-store="$PW_STORE" \
    --enable-features=GlobalShortcutsPortal,WaylandWindowDecorations "$@"
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/claude-cowork.desktop" <<EOF
[Desktop Entry]
Name=Claude Cowork
Comment=Anthropic Claude Desktop with local agent support
Exec=claude-cowork %U
Icon=claude-cowork
Type=Application
Categories=Development;Utility;
MimeType=x-scheme-handler/claude;
StartupWMClass=Claude
EOF

    # Extract icon from DMG's Claude.app if available
    local _claude_app
    _claude_app=$(find "${srcdir}/dmg-extracted" -name "Claude.app" -type d 2>/dev/null | head -1)
    if [[ -n "$_claude_app" ]]; then
        local _icns="${_claude_app}/Contents/Resources/AppIcon.icns"
        # Try to convert .icns to png (icns2png from libicns)
        if [[ -f "$_icns" ]] && command -v icns2png &>/dev/null; then
            icns2png -x -s 256 "$_icns" -o "${srcdir}/" 2>/dev/null || true
            local _icon
            _icon=$(ls -S "${srcdir}/"*.png 2>/dev/null | head -1)
            if [[ -n "$_icon" ]]; then
                install -Dm644 "$_icon" \
                    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/claude-cowork.png"
            fi
        fi
    fi

    # Install license notice
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Claude Desktop is proprietary software by Anthropic PBC.
This package provides a Linux compatibility layer for the macOS app.
See https://www.anthropic.com/legal/consumer-terms for terms of service.
EOF
}
