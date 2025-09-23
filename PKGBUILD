# Maintainer: Ben Davis <bendavis78@gmail.com>

_appname="tabbyml"
_appprefix="/opt"
_appdataprefix="/var/opt"

pkgname="${_appname}-git"
pkgrel=11
pkgver=nightly.r0.ge6ee6cc31
pkgdesc="Opensource, self-hosted AI coding assistant"
arch=("x86_64")
url="https://tabby.tabbyml.com"
license=("MIT")
groups=()
depends=("python" "protobuf" "sqlite" "graphviz")
makedepends=("git" "make" "rust" "base-devel")
provides=("tabby")
source=(
    "${pkgname}::git+https://github.com/TabbyML/tabby.git"
    "git+https://github.com/ggerganov/llama.cpp.git"
    "tabbyml-server.service"
    "server.conf"
    "config.toml"
)
install="${pkgname}.install"
sha1sums=('SKIP'
          'SKIP'
          '946b6b1d5169ff57246ac63c0717f633c1fb7af6'
          'a3f26d5c57e74da76d51c7ed28753b0b867a95b7'
          '4138aaeed2a83024398acd0a117821824b24b843')
options=("!strip" "!debug")

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
    cd "$srcdir/$pkgname" || return 1

    # try to fetch tags so git-describe can use them (harmless if already present)
    git fetch --tags --quiet 2>/dev/null || true

    # get a descriptive ref: <tag>-<commits>-g<sha> OR <sha>
    desc=$(git describe --tags --long --always 2>/dev/null) || desc=""

    # strip leading v if present
    desc=${desc#v}

    if [ -z "$desc" ]; then
        # fallback: use commit count + short sha
        sha=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
        count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
        echo "0.r${count}.g${sha}"
        return 0
    fi

    # if desc contains '-' (tag-N-gSHA), convert to tag.rN.gSHA
    if printf '%s' "$desc" | grep -q -- '-'; then
        # example: 1.2.3-4-gabc1234  -> 1.2.3.r4.gabc1234
        ver=$(printf '%s' "$desc" | sed -E 's/^([^-]+)-([0-9]+)-g([0-9a-f]+)$/\1.r\2.g\3/')
        # if sed failed to transform, fallback to safe form:
        if [ -n "$ver" ]; then
            echo "$ver"
            return 0
        fi
    fi

    # else desc is either a tag (like 1.2.3) or a raw sha
    if printf '%s' "$desc" | grep -Eq '^[0-9]+(\.[0-9]+)*$'; then
        # pure numeric dotted tag -> use as-is (1.2.3)
        echo "$desc"
    else
        # likely a short sha -> convert to 0.r<count>.g<sha>
        sha=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
        count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
        echo "0.r${count}.g${sha}"
    fi
}

prepare() {
    cd "$srcdir/$pkgname"
    # init and update submodules (allow file:// if AUR provides llama.cpp as separate source)
    git submodule sync --recursive || true
    git -c protocol.file.allow=always submodule update --init --recursive --depth 1
}

build() {
    cd "$srcdir/$pkgname"
    unset SQLX_OFFLINE  # Not sure what's causing this to be set, but it causes build failre
    export RUSTFLAGS="--remap-path-prefix ${srcdir}/${pkgname}="
    cargo build --release
}

package() {
    # Install systemd service
    install -Dm644 "./tabbyml-server.service" "$pkgdir/usr/lib/systemd/system/tabbyml-server.service"

    # Install the default config file to /usr/share/$_appname/tabbyml.conf
    install -d "$pkgdir/usr/share/$_appname"
    install -Dm644 "./server.conf" "$pkgdir/usr/share/$_appname/server.conf"
    install -Dm644 "./config.toml" "$pkgdir/usr/share/$_appname/config.toml"

    install -d "$pkgdir${_appprefix}/$_appname"  # /opt/tabbyml
    install -d "$pkgdir${_appdataprefix}/$_appname"  # /var/opt/tabbyml (TABBY_ROOT)
    
    # install binaries
    install -Dm755 "$srcdir/$pkgname/target/release/tabby" "$pkgdir${_appprefix}/$_appname/bin/tabby"
    install -Dm755 "$srcdir/$pkgname/target/release/llama-server" "$pkgdir${_appprefix}/$_appname/bin/llama-server"
}
