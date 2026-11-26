# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=filestash-git
pkgver=r2621.4623144d
pkgrel=1
pkgdesc="Universal file management platform / storage-agnostic Dropbox alternative"
arch=('x86_64' 'aarch64')
url="https://github.com/mickael-kerjean/filestash"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libwebp' 'libjpeg-turbo' 'libpng' 'giflib' 'brotli' 'libraw' 'ffmpeg')
makedepends=('git' 'go')
provides=('filestash')
conflicts=('filestash')
install=filestash.install
source=("filestash::git+${url}.git"
    'filestash.service'
    'filestash.service.user'
    'filestash.sysusers'
    'filestash.tmpfiles')
sha256sums=('SKIP'
            'c2ea7d9e607705436e69f4316085c4fca65f3eb6d9deccd28733ff9803a87c35'
            '82f43ff56e53648e837ed1e41d13978f9542ef5f407ad2ca9eaa0413c125f8ee'
            '5ada147680c5bcd4890117a6a2ea2cf3d3949917f845b65cf6adcc8148bbc8e7'
            '597a2eabf7f0465734400e38c69f4ebed1af2930246b673e3bfc90437b9fd6a2')

pkgver() {
    cd "${srcdir}/filestash"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/filestash"

    # NOTE: mirrors.aliyun.com serves corrupt zip bodies to non-CN clients (soft-block page cached as .zip) -> "zip: not a valid zip file". proxy.golang.org works from justhost.
    # (needed for go mod tidy / go generate network fetches in prepare)
    export GOPROXY="https://proxy.golang.org,direct"

    # Fix static library linking - convert to dynamic linking for Arch
    # Arch provides only .so shared libraries, not .a static libraries
    # Pattern: -l:lib{name}.a → -l{name}
    find server/plugin/plg_image_c -name "*.go" -type f -exec sed -i \
        's/-l:lib\([^.]*\)\.a/-l\1/g' \
        {} +

    # Video cache paths are upstream's job now: commit 96ca70c5 (2026-11-13)
    # turned them into `VIDEO_CACHE_PATH = filepath.Join(TMP_PATH, "video")`
    # (plg_video_transcoder/index.go) and `VideoCachePath = filepath.Join(
    # TMP_PATH, "video-thumbnail")` (plg_video_thumbnail/index.go), importing
    # "path/filepath" themselves. The old sed rules below them appended a second
    # "path/filepath" import -> "filepath redeclared in this block" plus
    # "imported and not used"; they are therefore removed.

    # FHS-compliant log/cache paths via env vars (the unit sets
    # FILESTASH_LOG_PATH / FILESTASH_CACHE_PATH). Upstream moved these constants
    # from server/common/constants.go to server/pkg/env/constants.go on
    # 2026-08-19 (9b11653a), which silently turned the old patch into a no-op.
    sed -i \
        -e 's|^\tLOG_PATH    = fromPath("state/log/")|\tLOG_PATH    = fromEnv("FILESTASH_LOG_PATH", fromPath("state/log/"))|' \
        -e 's|^\tTMP_PATH    = fromPath("cache/")|\tTMP_PATH    = fromEnv("FILESTASH_CACHE_PATH", fromPath("cache/"))|' \
        server/pkg/env/constants.go
    sed -i '/^func fromPath(p string) string {$/i\
func fromEnv(key, fallback string) string {\
\tif p := os.Getenv(key); p != "" {\
\t\treturn p\
\t}\
\treturn fallback\
}\
' server/pkg/env/constants.go
    # Fail loudly rather than silently losing the FHS split if upstream moves
    # these lines again.
    for pat in 'fromEnv("FILESTASH_LOG_PATH"' 'fromEnv("FILESTASH_CACHE_PATH"' '^func fromEnv(key, fallback string) string {$'; do
        if ! grep -q -- "$pat" server/pkg/env/constants.go; then
            echo "ERROR: constants.go patch did not apply (missing: $pat)" >&2
            return 1
        fi
    done

    # Upstream added delta sync (github.com/balena-os/librsync-go import in
    # server/pkg/files/handler_save.go) on 2026-07-14 without updating go.mod.
    # Resolve missing modules so the build does not fail with:
    # "no required module provides package github.com/balena-os/librsync-go"
    # NOTE: `go mod tidy` additionally resolves *test* deps of deps and dies on
    # "zip: not a valid zip file" (otel sdk/instrumentation is not a module);
    # a targeted `go get` avoids that.
    go get github.com/balena-os/librsync-go@latest

    # Generate Go code - must run from repository root where go.mod is
    go generate -x ./server/...
}

build() {
    export GOPROXY="https://proxy.golang.org,direct"
    cd "${srcdir}/filestash"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    # Build with fts5 tag for SQLite full-text search
    go build \
        -buildmode=pie \
        -trimpath \
        -ldflags="-linkmode external -extldflags \"${LDFLAGS}\"" \
        -tags "fts5" \
        -o dist/filestash \
        cmd/main.go
}

package() {
    cd "${srcdir}/filestash"

    # Install binary
    install -Dm755 dist/filestash "$pkgdir/usr/bin/filestash"

    # Install systemd system service (runs as filestash user)
    install -Dm644 "$srcdir/filestash.service" "$pkgdir/usr/lib/systemd/system/filestash.service"

    # Install systemd user service (for running with systemctl --user)
    install -Dm644 "$srcdir/filestash.service.user" "$pkgdir/usr/lib/systemd/user/filestash.service"

    # Install sysusers.d configuration
    install -Dm644 "$srcdir/filestash.sysusers" "$pkgdir/usr/lib/sysusers.d/filestash.conf"

    # Install tmpfiles.d configuration
    install -Dm644 "$srcdir/filestash.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/filestash.conf"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
