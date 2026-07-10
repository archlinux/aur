# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ignis
pkgver=0.8.8+obsidian.1.12.7
_obver=$(echo "$pkgver" | awk -F 'obsidian.' '{print $2}')
pkgrel=1
pkgdesc="Run Obsidian as a self-hosted web app."
arch=("x86_64" "aarch64")
url="https://github.com/Nystik-gh/${pkgname}"
license=('AGPL-3.0-or-later')
depends=("nodejs")
makedepends=("asar" "npm")
backup=("etc/conf.d/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "obsidian-${_obver}.asar.gz::https://github.com/obsidianmd/obsidian-releases/releases/download/v${_obver}/obsidian-${_obver}.asar.gz")
sha256sums=('1e9eb4d5906a6ca7b522fc8486e7cf079e5078ebe276e8d9bc433e3f20f4ca35'
            '905000c098f2ec0f88ef64a31ac20c083b77f531dcda10cd9846c6570cd13f66'
            '48b83055b593d3ab81e5e09918944f836a99f2c1e89e3810d80ce7a18e086be1'
            '36e53ddc44a502acf4576af4bbf30a2793150ace548695bd24b260104a7ff38a'
            '75dd34f14c9db558fbad19e80f0b201bc9805b51b7388370277e0f91a38bd850')

prepare() {
    awk -F'\\|' '
        BEGIN {
            skip["VAULT_ROOT"]
            skip["DATA_ROOT"]
            skip["OBSIDIAN_VERSION"]
            skip["OBSIDIAN_ASSETS_PATH"]
            skip["OBSIDIAN_PACKAGE"]
            skip["PUID"]
            skip["PGID"]
        }

        function trim(s) {
            gsub(/^[ \t]+|[ \t]+$/, "", s)
            return s
        }

        /^## Environment Variables$/ {
            in_section = 1
            next
        }

        in_section && /^\|[[:space:]]*Variable[[:space:]]*\|/ {
            in_table = 1
            next
        }

        in_table && /^\|[[:space:]]*-+/ {
            next
        }

        in_table && /^\|/ {
            var  = trim($2)
            desc = trim($3)
            def  = trim($4)

            gsub(/`/, "", var)
            gsub(/`/, "", desc)
            gsub(/`/, "", def)

            if (var in skip)
                next

            if (def == "unset")
                def = ""

            printf "## %s Default: %s\n", desc, def
            printf "#%s=\"%s\"\n\n", var, def

            next
        }

        in_table && !/^\|/ {
            exit
        }
        ' "${pkgname}-${pkgver//+/-}/apps/ignis-server/README.md" > "${pkgname}.env"
}

build() {
    cd "${pkgname}-${pkgver//+/-}"
    npm ci --ignore-scripts --no-audit --no-fund
    IGNIS_BUILD=production npm run build
    npm ci --ignore-scripts --no-audit --no-fund --omit=dev
    case $CARCH in
        aarch64) find node_modules -type d \( -name "android-*" -o -name "darwin-*" -o -name "ios-*" -o -name "linux-x64*" -o -name "win32-*" \) | xargs rm -rf;;
        x86_64)  find node_modules -type d \( -name "android-*" -o -name "darwin-*" -o -name "ios-*" -o -name "linux-arm*" -o -name "win32-*" \) | xargs rm -rf;;
    esac
}

package() {
    install -Dm644 "${pkgname}.env"      "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver//+/-}"
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp --parents -r -t "${pkgdir}/usr/lib/${pkgname}" \
        apps/ignis-server/package.json \
        apps/ignis-server/server/ \
        images/ \
        node_modules/ \
        package.json \
        package-lock.json \
        packages/bridge/package.json \
        packages/server-core/package.json \
        packages/server-core/src/ \
        packages/services/package.json \
        packages/shim/package.json \
        packages/shim/dist/ \
        packages/ui/package.json \
        packages/ui/dist/
    asar extract "../obsidian-${_obver}.asar" "${pkgdir}/usr/lib/${pkgname}/obsidian"
}
