# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=filestash-git
pkgver=r2447.cbcd1e96
pkgrel=2
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

    # Fix video cache paths - make them respect FILESTASH_CACHE_PATH env var for XDG compliance
    # For plg_video_transcoder: remove VIDEO_CACHE_PATH from const block and add as a var after
    sed -i '/^\tVIDEO_CACHE_PATH  = "data\/cache\/video\/"$/d' server/plugin/plg_video_transcoder/index.go

    # Add path/filepath import
    sed -i '/^import (/,/^)/{
    /^)/ i\
\t"path/filepath"
  }' server/plugin/plg_video_transcoder/index.go

    # Add var declaration and init function after the const block
    sed -i '/^const ($/,/^)$/{
    /^)$/ a\
\
var VIDEO_CACHE_PATH string\
\
func init() {\
\tcachePath := os.Getenv("FILESTASH_CACHE_PATH")\
\tif cachePath == "" {\
\t\tcachePath = "/var/cache/filestash"\
\t}\
\tVIDEO_CACHE_PATH = filepath.Join(cachePath, "video") + "/"\
}
  }' server/plugin/plg_video_transcoder/index.go

    # Same for thumbnail plugin - remove VideoCachePath from const block
    sed -i '/^\tVideoCachePath = "data\/cache\/video-thumbnail\/"$/d' server/plugin/plg_video_thumbnail/index.go

    # Add path/filepath import
    sed -i '/^import (/,/^)/{
    /^)/ i\
\t"path/filepath"
  }' server/plugin/plg_video_thumbnail/index.go

    # Add var declaration and init function after the const block
    sed -i '/^const ($/,/^)$/{
    /^)$/ a\
\
var VideoCachePath string\
\
func init() {\
\tcachePath := os.Getenv("FILESTASH_CACHE_PATH")\
\tif cachePath == "" {\
\t\tcachePath = "/var/cache/filestash"\
\t}\
\tVideoCachePath = filepath.Join(cachePath, "video-thumbnail") + "/"\
}
  }' server/plugin/plg_video_thumbnail/index.go

    # Patch constants.go to support FHS-compliant log and cache paths via env vars
    # This allows separating /var/log/filestash and /var/cache/filestash from /var/lib/filestash
    sed -i '/^func init() {$/,/^}$/ {
    /rootPath := "data\/"/ a\
\t// Support FHS-compliant paths\
\tlogPath := os.Getenv("FILESTASH_LOG_PATH")\
\ttmpPath := os.Getenv("FILESTASH_CACHE_PATH")
    /LOG_PATH = filepath.Join(rootPath, LOG_PATH)/ c\
\tif logPath != "" {\
\t\tLOG_PATH = logPath\
\t} else {\
\t\tLOG_PATH = filepath.Join(rootPath, LOG_PATH)\
\t}
    /TMP_PATH = filepath.Join(rootPath, TMP_PATH)/ c\
\tif tmpPath != "" {\
\t\tTMP_PATH = tmpPath\
\t} else {\
\t\tTMP_PATH = filepath.Join(rootPath, TMP_PATH)\
\t}
  }' server/common/constants.go

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
