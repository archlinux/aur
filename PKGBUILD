# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=greenboost
pkgver=3.2
pkgrel=1
pkgdesc="CUDA memory orchestrator for NVIDIA GPUs — unified VRAM + System RAM + SSD pool"
arch=('x86_64')
url="https://gitlab.com/IsolatedOctopi/greenboost"
license=('GPL-2.0-or-later')
depends=(
    'dkms'
    'python'
    'python-numpy'
    'python-yaml'
    'python-aiohttp'
    'python-mcp'
    'python-rich'
    'python-prompt_toolkit'
    'python-httpx'
    'python-openai'
    'python-huggingface-hub'
)
makedepends=('uv')
optdepends=(
    'cuda: for TurboQuant KV cache compression'
    'lib32-glibc: needed if 32-bit audit library is shipped (built automatically when multilib is present)'
    'python-pytorch-cuda: for quantization and ML tools'
    'python-scipy: for advanced quantization algorithms'
    'python-transformers: for HuggingFace model tools'
)
provides=('greenboost')
conflicts=('greenboost-git')
install=greenboost.install
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('79147851e8d348df7065eb0816b2488650676b77ec058b93b93f4dcaa35bb97c')

build() {
    cd "$srcdir/${pkgname}-v${pkgver}"

    local _relro="-Wl,-z,relro -Wl,-z,now"

    # ── C libraries ────────────────────────────────────────────────────
    msg2 "Building CUDA shim..."
    make shim \
        SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so \
        SHIM_LDFLAGS="-Wl,--gc-sections -lzstd -Wl,--as-needed ${_relro}"

    msg2 "Building LD_AUDIT injector..."
    make audit \
        SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so

    msg2 "Building 32-bit audit library (skipped if multilib missing)..."
    make audit32 SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so 2>/dev/null || true

    msg2 "Building network daemon..."
    make netd SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so

    msg2 "Building VMM override (Blackwell support)..."
    make vmm_override

    # ── Python CLI venv ────────────────────────────────────────────────
    msg2 "Creating CLI virtual environment..."
    uv venv --system-site-packages --clear cli-venv
    # shellcheck disable=SC1091
    source cli-venv/bin/activate
    uv pip install "./greenboost-cli" --no-build-isolation
}

package() {
    cd "$srcdir/${pkgname}-v${pkgver}"

    # ── DKMS source tree ──────────────────────────────────────────────
    local _dkms_dir="$pkgdir/usr/src/${pkgname}-${pkgver}"
    install -dm755 "$_dkms_dir"
    install -m644 greenboost.c \
                   greenboost_ioctl.h \
                   Kbuild \
                   Makefile \
                   dkms.conf \
                   "$_dkms_dir/"
    cp -r features "$_dkms_dir/"

    sed -i \
        -e 's|M=\${build_dir}|M=\${dkms_tree}/${PACKAGE_NAME}/${PACKAGE_VERSION}/build|g' \
        -e '/^MAKE\[0\]=/ s/modules"/KCFLAGS=-Wno-error=ignored-optimization-argument &/' \
        "$_dkms_dir/dkms.conf"

    # ── Userspace libraries ────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/lib"
    install -m755 libgreenboost_cuda.so   "$pkgdir/usr/lib/"
    install -m755 libgreenboost_audit.so  "$pkgdir/usr/lib/"

    if [[ -f libgreenboost_audit32.so ]]; then
        install -dm755 "$pkgdir/usr/lib32"
        install -m755 libgreenboost_audit32.so \
            "$pkgdir/usr/lib32/libgreenboost_audit.so"
    fi

    install -m755 libgreenboost_netd_capture.so "$pkgdir/usr/lib/"
    install -m755 libgreenboost_vmm_override.so "$pkgdir/usr/lib/"

    # ── System binaries ────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    install -m755 greenboost-netd "$pkgdir/usr/bin/"

    # greenboost-run: LD_PRELOAD shim wrapper
    cat > "$pkgdir/usr/bin/greenboost-run" <<'WRAPEOF'
#!/bin/sh
LD_PRELOAD="/usr/lib/libgreenboost_cuda.so" exec "$@"
WRAPEOF
    chmod 755 "$pkgdir/usr/bin/greenboost-run"

    # greenboost: Python tool dispatcher
    cat > "$pkgdir/usr/bin/greenboost" <<'GBEOF'
#!/bin/bash
_GB_LIBDIR="/usr/share/greenboost/lib"
export PYTHONPATH="${_GB_LIBDIR}:${PYTHONPATH}"

cmd="$1"
shift 2>/dev/null || true

case "${cmd}" in
    "")
        echo "GreenBoost v$(cat /usr/share/greenboost/dkms-version 2>/dev/null)"
        echo "Usage: greenboost <command> [args]"
        echo ""
        echo "Commands:"
        echo "  status         Show tiering status"
        echo "  dataflux-ui    Launch dataflux web UI"
        echo "  monitor        Show live telemetry"
        echo "  pilot          Show evidence-backed tuning advice"
        echo "  mcp            Start MCP server"
        echo "  faults         Show memory migration activity"
        echo "  top            Show per-buffer residency (hottest first)"
        echo "  residency      Show hot/warm/cold byte breakdown"
        echo "  capabilities   Show installed feature manifest"
        echo "  profile create Create hardware profile for DDR speed detection"
        echo "  run <cmd>      Wrap command with shim (alias: greenboost-run)"
        echo ""
        echo "Cluster commands:"
        echo "  cluster         Manage cluster feeders"
        echo "  connect <ip>    Connect to a feeder machine"
        ;;
    run)
        LD_PRELOAD="/usr/lib/libgreenboost_cuda.so" exec "$@"
        ;;
    status)
        cat /sys/class/greenboost/greenboost/status 2>/dev/null \
            || echo "GreenBoost module not loaded (try: sudo modprobe greenboost)"
        ;;
    dataflux-ui)
        exec python3 "${_GB_LIBDIR}/gb_dataflux.py" serve "$@"
        ;;
    monitor)
        exec python3 "${_GB_LIBDIR}/gb_monitor.py" "$@"
        ;;
    pilot)
        exec python3 "${_GB_LIBDIR}/gb_pilot.py" "$@"
        ;;
    mcp)
        exec python3 "${_GB_LIBDIR}/gb_mcp.py" "$@"
        ;;
    dataflux-mcp)
        exec python3 "${_GB_LIBDIR}/gb_dataflux_mcp.py" "$@"
        ;;
    cluster)
        exec python3 "${_GB_LIBDIR}/gb_cluster.py" "$@"
        ;;
    faults|top|residency|capabilities)
        exec python3 "${_GB_LIBDIR}/gb_monitor.py" "${cmd}" "$@"
        ;;
    profile)
        case "${1:-}" in
            create)
                if [ "$(id -u)" -ne 0 ]; then
                    echo "root required to read DDR speed from dmidecode"
                    echo "Try: sudo greenboost profile create"
                    exit 1
                fi
                install -d /etc/greenboost/profiles 2>/dev/null || mkdir -p /etc/greenboost/profiles
                {
                    echo "# GreenBoost hardware profile"
                    echo "# Generated: $(date -Is)"
                    echo ""
                    dmidecode --type memory 2>/dev/null | grep -E 'Speed|Type|Manufacturer' | head -10
                } > /etc/greenboost/profiles/default.md
                echo "Profile written to /etc/greenboost/profiles/default.md"
                ;;
            *)
                echo "Usage: greenboost profile create"
                exit 1
                ;;
        esac
        ;;
    help|--help|-h)
        echo "See: https://gitlab.com/IsolatedOctopi/greenboost"
        echo "Full docs: /usr/share/doc/greenboost/"
        ;;
    *)
        echo "Unknown command: ${cmd}"
        echo "Run 'greenboost' for usage."
        exit 1
        ;;
esac
GBEOF
    chmod 755 "$pkgdir/usr/bin/greenboost"

    # ── Python library scripts ─────────────────────────────────────────
    local _libdir="$pkgdir/usr/share/${pkgname}/lib"
    install -dm755 "$_libdir"
    install -m755 gb_*.py "$_libdir/"
    install -m755 lib/gb_*.sh "$_libdir/"

    # ── CLI venv ───────────────────────────────────────────────────────
    local _cli_optdir="$pkgdir/opt/${pkgname}/cli-venv"
    install -dm755 "$(dirname "$_cli_optdir")"
    cp -r cli-venv "$_cli_optdir"

    # Relocate venv paths from build dir to install path
    find "$_cli_optdir" -type f \( -name '*.cfg' -o -name 'activate*' -o -name '*.nu' \
        -o -name '*.bat' -o -name '*.csh' -o -name '*.fish' \) \
        -exec sed -i "s|${srcdir}/${pkgname}-v${pkgver}/cli-venv|/opt/${pkgname}/cli-venv|g" {} + 2>/dev/null || true
    sed -i "s|${srcdir}/${pkgname}-v${pkgver}/cli-venv|/opt/${pkgname}/cli-venv|g" \
        "$_cli_optdir/bin"/* 2>/dev/null || true

    # Clean up caches and srcdir references
    rm -rf "$_cli_optdir/cache"
    find "$_cli_optdir" -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null || true
    find "$_cli_optdir" -name 'direct_url.json' -delete 2>/dev/null || true

    # CLI wrapper scripts
    for _cli_cmd in gb greenboost-cli; do
        cat > "$pkgdir/usr/bin/${_cli_cmd}" <<'CLIEOF'
#!/bin/bash
exec /opt/greenboost/cli-venv/bin/python -m greenboost_cli.__main__ "$@"
CLIEOF
        chmod 755 "$pkgdir/usr/bin/${_cli_cmd}"
    done

    # ── Version stamp ──────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/$pkgname"
    echo "$pkgver" > "$pkgdir/usr/share/$pkgname/dkms-version"

    # ── Documentation ──────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/"
    for doc in ARCHITECTURE.md DOCUMENTATION.md CONTAINER_VM_MODE.md \
               GREENBOOST_COMMANDS.md GREENBOOST_PROTON.md; do
        [[ -f "$doc" ]] && install -m644 "$doc" "$pkgdir/usr/share/doc/$pkgname/"
    done

    # ── udev rule ──────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    cat > "$pkgdir/usr/lib/udev/rules.d/99-greenboost.rules" <<'RULEEOF'
SUBSYSTEM=="greenboost", MODE="0660", GROUP="video"
RULEEOF
    chmod 644 "$pkgdir/usr/lib/udev/rules.d/99-greenboost.rules"

    # ── License ────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
