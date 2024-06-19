# Maintainer: James Clarke <james@jamesdavidclarke.com>
# Maintainer: Meow King <mr.meowking@anche.no>

pkgname=zls-nightly-bin
pkgver=0.13.0_dev.64_bcd7784
pkgrel=2
pkgdesc="A Zig language server. [YOU MUST USE ZIG MASTER VERSION]"
arch=('x86_64' 'x86' 'aarch64')
url="https://github.com/zigtools/zls/wiki/Installation"
license=('MIT')
provides=('zls')
conflicts=('zls')
makedepends=('grep' 'awk' 'jq')
optdepends=('curl: for downloading JSON data' 'wget: for downloading JSON data')

json_data=""

# Global constant for the JSON URL
readonly ZLS_JSON_URL="https://zigtools-releases.nyc3.digitaloceanspaces.com/zls/index.json"

# Function to fetch JSON data
fetch_json() {
    if [[ -z "$json_data" ]]; then
        if command -v curl &> /dev/null; then
            json_data=$(curl -sL "$ZLS_JSON_URL")
        elif command -v wget &> /dev/null; then
            json_data=$(wget -qO- "$ZLS_JSON_URL")
        else
            echo "Error: Neither curl nor wget is installed. Please install either to proceed." >&2
            exit 1
        fi
    fi
    echo "$json_data"
}

# Function to get the latest version
get_latest_version() {
    json=$(fetch_json | jq -r '.versions | keys[]')
    highest_version=$(echo "$json" | awk -F'-dev' '{print $1"-dev"}' | sort -V | uniq | tail -n 1)
    highest_revision=$(echo "$json" | grep "^${highest_version}" | sort -V | tail -n 1)
    if [[ -z "$highest_revision" ]]; then
        echo "Error: Could not determine the latest version" >&2
        exit 1
    fi
    echo "$highest_revision"
}

pkgver() {
    case "${CARCH}" in
        x86_64|x86|aarch64)
            final_version=$(get_latest_version)
            if [[ -z "$final_version" ]]; then
                echo "Error: Could not determine the latest version" >&2
                exit 1
            fi
            cleaned_version="${final_version//[-+]/_}"
            echo "$cleaned_version"
            ;;
        *)
            echo "${CARCH} architecture is not supported, only [x86_64, x86, aarch64] is supported." >&2
            exit 1
            ;;
    esac
}

source() {
    final_version=$(get_latest_version)
    if [[ -z "$final_version" ]]; then
        echo "Error: Could not determine the latest version" >&2
        exit 1
    fi
    echo "https://zigtools-releases.nyc3.digitaloceanspaces.com/zls/${final_version}/${CARCH}-linux/zls"
}

build() {
    curl -sL -o zls "$(source)"
    chmod +x zls
}

package() {
    install -Dm755 "$srcdir/zls" "$pkgdir/usr/bin/zls"
}

