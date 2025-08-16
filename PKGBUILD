pkgname=chesspilot
pkgver=1.1.0
pkgrel=6
pkgdesc="A fully offline chess autoplayer and position evaluator powered by ONNX and Stockfish"
arch=('x86_64')
url="https://github.com/OTAKUWeBer/ChessPilot"
license=('MIT')
depends=('stockfish' 'tk')
makedepends=('gcc')    # for building the small shim
options=('!strip' '!debug')

source=(
  "https://github.com/OTAKUWeBer/ChessPilot/releases/download/v${pkgver}/ChessPilot-${pkgver}-linux-x86_64"
  "chesspilot.desktop"
  "https://raw.githubusercontent.com/OTAKUWeBer/ChessPilot/main/assets/logo.png"
  "LICENSE"
)

noextract=("ChessPilot-${pkgver}-linux-x86_64")

sha256sums=(
  '422fc569a598061a43785279e40e90d76a6b49e3e3940c7b4e430a1dba294e2b'  # Binary
  'SKIP'                                                               # Desktop file
  '8d304ed8f25461f6fc69d0144e0de68403f239b8583b5120fbb5f859254c74d9'  # Logo image
  'abd5c13a78e8a7ab78960805c9230d653155f1ef84413d3182d3aa56d0b09eda'  # LICENSE
)

build() {
  cd "$srcdir"

  # LD_PRELOAD shim: redirect engine_config and stockfish writes to user locations
  cat > redirect_open.c <<'EOF'
#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

static const char *cfg_target = "/usr/bin/engine_config.txt";
static const char *engine_target = "/usr/bin/stockfish";

/* returns replacement path for config */
static const char *get_cfg_replacement(void) {
    const char *env = getenv("CHESSPILOT_CONFIG");
    if (env && env[0]) return env;

    const char *xdg = getenv("XDG_CONFIG_HOME");
    static char buf[1024];
    if (xdg && xdg[0]) {
        snprintf(buf, sizeof(buf), "%s/chesspilot/engine_config.txt", xdg);
        return buf;
    }
    const char *home = getenv("HOME");
    if (home && home[0]) {
        snprintf(buf, sizeof(buf), "%s/.config/chesspilot/engine_config.txt", home);
        return buf;
    }
    return cfg_target;
}

/* returns replacement path for engine binary file (where to download) */
static const char *get_engine_replacement(void) {
    const char *env = getenv("CHESSPILOT_ENGINEFILE");
    if (env && env[0]) return env;

    const char *xdg = getenv("XDG_DATA_HOME");
    static char buf[1024];
    if (xdg && xdg[0]) {
        snprintf(buf, sizeof(buf), "%s/chesspilot/stockfish", xdg);
        return buf;
    }
    const char *home = getenv("HOME");
    if (home && home[0]) {
        snprintf(buf, sizeof(buf), "%s/.local/share/chesspilot/stockfish", home);
        return buf;
    }
    return engine_target;
}

typedef int (*open_t)(const char *, int, ...);
typedef int (*openat_t)(int, const char *, int, ...);
typedef FILE *(*fopen_t)(const char *, const char *);

static open_t real_open = NULL;
static openat_t real_openat = NULL;
static fopen_t real_fopen = NULL;

static void init_real(void) {
    if (!real_open) real_open = (open_t)dlsym(RTLD_NEXT, "open");
    if (!real_openat) real_openat = (openat_t)dlsym(RTLD_NEXT, "openat");
    if (!real_fopen) real_fopen = (fopen_t)dlsym(RTLD_NEXT, "fopen");
}

/* helper: choose replacement if pathname matches one of the targets */
static const char *maybe_replace(const char *pathname) {
    if (!pathname) return pathname;
    if (strcmp(pathname, cfg_target) == 0) return get_cfg_replacement();
    if (strcmp(pathname, engine_target) == 0) return get_engine_replacement();
    return pathname;
}

int open(const char *pathname, int flags, ...) {
    init_real();
    va_list ap;
    mode_t mode = 0;
    if (flags & O_CREAT) { va_start(ap, flags); mode = va_arg(ap, mode_t); va_end(ap); }

    const char *rp = maybe_replace(pathname);
    if (rp != pathname) {
        /* ensure containing dir exists when creating */
        if (flags & O_CREAT) {
            /* best-effort: create parent dir */
            char tmp[1024]; strncpy(tmp, rp, sizeof(tmp)); tmp[sizeof(tmp)-1]=0;
            char *p = strrchr(tmp, '/');
            if (p) { *p = '\0'; mkdir(tmp, 0755); } /* ignore errors */
            return real_open(rp, flags, mode);
        }
        if (flags & O_CREAT) return real_open(rp, flags, mode);
        return real_open(rp, flags);
    }

    if (flags & O_CREAT) return real_open(pathname, flags, mode);
    return real_open(pathname, flags);
}

int openat(int dirfd, const char *pathname, int flags, ...) {
    init_real();
    va_list ap;
    mode_t mode = 0;
    if (flags & O_CREAT) { va_start(ap, flags); mode = va_arg(ap, mode_t); va_end(ap); }

    /* only handle absolute targets here */
    if (pathname && pathname[0] == '/') {
        const char *rp = maybe_replace(pathname);
        if (rp != pathname) {
            if (flags & O_CREAT) {
                char tmp[1024]; strncpy(tmp, rp, sizeof(tmp)); tmp[sizeof(tmp)-1]=0;
                char *p = strrchr(tmp, '/');
                if (p) { *p = '\0'; mkdir(tmp, 0755); } /* ignore errors */
                return real_openat(dirfd, rp, flags, mode);
            }
            if (flags & O_CREAT) return real_openat(dirfd, rp, flags, mode);
            return real_openat(dirfd, rp, flags);
        }
    }

    if (flags & O_CREAT) return real_openat(dirfd, pathname, flags, mode);
    return real_openat(dirfd, pathname, flags);
}

FILE *fopen(const char *pathname, const char *mode) {
    init_real();
    const char *rp = maybe_replace(pathname);
    if (rp != pathname) {
        /* ensure dir exists if opening for write/create */
        if (strchr(mode, 'w') || strchr(mode, 'a') || strchr(mode, '+')) {
            char tmp[1024]; strncpy(tmp, rp, sizeof(tmp)); tmp[sizeof(tmp)-1]=0;
            char *p = strrchr(tmp, '/');
            if (p) { *p = '\0'; mkdir(tmp, 0755); } /* ignore errors */
        }
        return real_fopen(rp, mode);
    }
    return real_fopen(pathname, mode);
}
EOF

  # compile shim
  gcc -fPIC -shared -o redirect_open.so redirect_open.c -ldl
}

package() {
  # place the real bundled binary in /usr/lib so we can install a wrapper at /usr/bin
  install -Dm755 "$srcdir/ChessPilot-${pkgver}-linux-x86_64" \
    "$pkgdir/usr/lib/chesspilot/chesspilot.bin"

  # desktop, icon, license (unchanged)
  install -Dm644 "$srcdir/chesspilot.desktop" \
    "$pkgdir/usr/share/applications/chesspilot.desktop"

  install -Dm644 "$srcdir/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/chesspilot.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # keep a packaged default config in /usr/share for reference, but DO NOT auto-copy it into user config
  # (the wrapper will not copy, so the app's downloader still runs if it decides to)
  install -d "$pkgdir/usr/share/chesspilot"
  cat > "$pkgdir/usr/share/chesspilot/engine_config.txt" <<'EOF'
# Packaged default engine_config (reference only)
/# leave engine_path blank so bundled app can choose to download engine if it wants
EOF

  # install the LD_PRELOAD shim
  install -Dm644 redirect_open.so "$pkgdir/usr/lib/chesspilot/redirect_open.so"

  # wrapper script: export locations for shim, but DO NOT force-copy the packaged default config.
  # The wrapper creates user dirs so the shim can redirect writes (allowing downloads to succeed)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/chesspilot" <<'EOF'
#!/bin/sh
# wrapper for chesspilot: set per-user config and engine paths, preload redirection library

# user config path
CHESSPILOT_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/chesspilot/engine_config.txt"
export CHESSPILOT_CONFIG

# where to place/download the engine binary for the user
CHESSPILOT_ENGINEFILE="${XDG_DATA_HOME:-$HOME/.local/share}/chesspilot/stockfish"
export CHESSPILOT_ENGINEFILE

# ensure directories exist (best-effort)
mkdir -p "$(dirname "$CHESSPILOT_CONFIG")"
mkdir -p "$(dirname "$CHESSPILOT_ENGINEFILE")"

# do NOT copy default config into user config automatically — leave it to the app or user
# (this allows the app's downloader to run if it prefers to download an engine)

# preload redirection shim (only affects targeted paths)
export LD_PRELOAD="/usr/lib/chesspilot/redirect_open.so"

exec /usr/lib/chesspilot/chesspilot.bin "$@"
EOF
}

