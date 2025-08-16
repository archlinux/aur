pkgname=chesspilot
pkgver=1.1.0
pkgrel=5
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

  # create LD_PRELOAD shim source
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

  static const char *target_path = "/usr/bin/engine_config.txt";

  static const char *get_replacement(void) {
    const char *env = getenv("CHESSPILOT_CONFIG");
    if (env && env[0]) return env;

    const char *xdg = getenv("XDG_CONFIG_HOME");
    if (xdg && xdg[0]) {
      static char buf[1024];
      snprintf(buf, sizeof(buf), "%s/chesspilot/engine_config.txt", xdg);
      return buf;
    }
    const char *home = getenv("HOME");
    if (home && home[0]) {
      static char buf2[1024];
      snprintf(buf2, sizeof(buf2), "%s/.config/chesspilot/engine_config.txt", home);
      return buf2;
    }
    return target_path; /* fallback */
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

  int open(const char *pathname, int flags, ...) {
    init_real();
    va_list ap;
    mode_t mode = 0;
    if (flags & O_CREAT) { va_start(ap, flags); mode = va_arg(ap, mode_t); va_end(ap); }

    if (strcmp(pathname, target_path) == 0) {
      const char *rp = get_replacement();
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

    if (pathname && strcmp(pathname, target_path) == 0) {
      const char *rp = get_replacement();
      if (flags & O_CREAT) return real_openat(dirfd, rp, flags, mode);
      return real_openat(dirfd, rp, flags);
    }
    if (flags & O_CREAT) return real_openat(dirfd, pathname, flags, mode);
    return real_openat(dirfd, pathname, flags);
  }

  FILE *fopen(const char *pathname, const char *mode) {
    init_real();
    if (strcmp(pathname, target_path) == 0) {
      const char *rp = get_replacement();
      return real_fopen(rp, mode);
    }
    return real_fopen(pathname, mode);
  }
EOF

  gcc -fPIC -shared -o redirect_open.so redirect_open.c -ldl
}

package() {
  # place the main binary in /usr/lib so we can install a wrapper at /usr/bin
  install -Dm755 "$srcdir/ChessPilot-${pkgver}-linux-x86_64" \
    "$pkgdir/usr/lib/chesspilot/chesspilot.bin"

  # install the desktop file, icon and license (same as before)
  install -Dm644 "$srcdir/chesspilot.desktop" \
    "$pkgdir/usr/share/applications/chesspilot.desktop"

  install -Dm644 "$srcdir/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/chesspilot.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install default engine_config to a read-only data path
  # create directory and copy the default (you must include it in the source or generate it)
  install -Dm644 "engine_config.txt" "$pkgdir/usr/share/chesspilot/engine_config.txt"

  # install the LD_PRELOAD shim
  install -Dm644 redirect_open.so "$pkgdir/usr/lib/chesspilot/redirect_open.so"

  # wrapper script: sets per-user config path and LD_PRELOAD, then execs the real binary
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/chesspilot" <<'EOF'
#!/bin/sh
# wrapper for chesspilot: ensure per-user config exists and preload redirection library

CHESSPILOT_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/chesspilot/engine_config.txt"
export CHESSPILOT_CONFIG

# ensure dir exists
mkdir -p "$(dirname "$CHESSPILOT_CONFIG")"

# copy default if missing (best-effort)
if [ ! -f "$CHESSPILOT_CONFIG" ]; then
  cp /usr/share/chesspilot/engine_config.txt "$CHESSPILOT_CONFIG" 2>/dev/null || true
fi

export LD_PRELOAD="/usr/lib/chesspilot/redirect_open.so"
exec /usr/lib/chesspilot/chesspilot.bin "$@"
EOF
}
