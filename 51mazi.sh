#!/bin/bash
set -euo pipefail

export APPDIR=/opt/51mazi-bin
export PATH="${APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/usr/lib:${LD_LIBRARY_PATH:-}"

OZONE_ARGS=()

# User override via MAZI_OZONE_PLATFORM=wayland|x11|auto
if [ -n "${MAZI_OZONE_PLATFORM:-}" ]; then
    OZONE_ARGS=("--ozone-platform=${MAZI_OZONE_PLATFORM}")
# Pure Wayland (no XWayland) → force native Wayland
elif [ -n "${WAYLAND_DISPLAY:-}" ] && [ -z "${DISPLAY:-}" ]; then
    OZONE_ARGS=("--ozone-platform=wayland")
fi

exec "${APPDIR}/51mazi" --no-sandbox "${OZONE_ARGS[@]}" "$@"
