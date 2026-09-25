# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ignis
pkgver=0.8.13+obsidian.1.13.7
_obver=$(echo "$pkgver" | awk -F '\\+obsidian.' '{print $2}')
pkgrel=1
pkgdesc="Run Obsidian as a self-hosted web app."
arch=("x86_64" "aarch64")
url="https://github.com/Nystik-gh/${pkgname}"
license=('AGPL-3.0-or-later')
depends=("nodejs")
makedepends=("asar" "npm")
optdepends=("obsidian-headless: for obsidian server-side headless sync")
backup=("etc/conf.d/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service"
        "obsidian-${_obver}.asar.gz::https://github.com/obsidianmd/obsidian-releases/releases/download/v${_obver}/obsidian-${_obver}.asar.gz")
sha256sums=('2c2d3283af52b83525860b429dd3c3f17656b3289ac359076d6377cacb859574'
            '75dd22bcbf0fcc96aa270bcb4726e273af36e73aff261a20f369d8f5ad65954b'
            '48b83055b593d3ab81e5e09918944f836a99f2c1e89e3810d80ce7a18e086be1'
            '36e53ddc44a502acf4576af4bbf30a2793150ace548695bd24b260104a7ff38a'
            '027f4adf77abb00a3ed2a6d59f35cb632201685b42e8b8adaab85516d2e1dbbe'
            '69253e39aa0b980e3cf96e9e8a8a4bed6b6481ef7021cd762f67872662d8d25a')

prepare() {
    rm -rf "${pkgname}-${pkgver//+/-}/docs-src" &>/dev/null
    mv -f "${pkgname}-${pkgver//+/-}/apps/docs" "${pkgname}-${pkgver//+/-}/docs-src"
    awk -F '|' '
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

        /^\|[[:space:]]*Variable[[:space:]]*\|/ {
            next
        }

        /^\|[[:space:]]*---/ {
            next
        }

        /^\|[[:space:]]*`[^`]+`[[:space:]]*\|/ {

            var  = trim($2)
            def  = trim($3)
            desc = trim($4)

            gsub(/`/, "", var)
            gsub(/`/, "", def)
            gsub(/`/, "", desc)

            if (var in skip)
                next

            if (desc !~ /\.$/)
                desc = desc "."

            if (def == "unset")
                def = ""

            if (def == "") {
                printf "## %s\n", desc
                printf "#%s=\"\"\n\n", var
            } else {
                printf "## %s Default: %s\n", desc, def
                printf "#%s=\"%s\"\n\n", var, def
            }
        }
    ' "${pkgname}-${pkgver//+/-}/docs-src/src/content/docs/server/environment.md" > "${pkgname}.env"
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
    find . -type f -name ".gitkeep" -delete
}

package() {
    install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.env"          "${pkgdir}/usr/lib/${pkgname}/${pkgname}.env.example"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    asar extract "obsidian-${_obver}.asar"   "${pkgdir}/usr/lib/${pkgname}/obsidian"

    cd "${pkgname}-${pkgver//+/-}"
    install -Dm644 "README.md"               "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "docs/ARCHITECTURE.md"    "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"
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
    
    cd docs-src/src/content/docs
    find . -type f -iname "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
