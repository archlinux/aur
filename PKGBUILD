# Maintainer: devome <evinedeng@hotmail.com>

pkgname=gcopy
pkgver=2.0.2
pkgrel=1
pkgdesc="A clipboard synchronization service for different devices that can synchronize text, screenshots, and files"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/llaoj/${pkgname}"
license=('MIT')
install="${pkgname}.install"
backup=("etc/conf.d/${pkgname}")
provides=("${pkgname}" "${pkgname}-web")
conflicts=("${pkgname}" "${pkgname}-web")
replaces=("${pkgname}-web")
makedepends=("go" "npm")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('3b186a535cca5fe9a8e5ce8b5cb9ab089ae1d3a54a81d9f6930a880a9fb46e53'
            '03d17f7cf39eaf04d36ab8defb1f14effb33eb061b52c4ab64f401d3ce2b8934')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${pkgname}-${pkgver}"
    npm --prefix=frontend ci
    npm --prefix=frontend run build
    rm -rf "internal/static/dist" &>/dev/null
    cp -ar "frontend/out" "internal/static/dist"
    go build -ldflags="-s -w -X ${url//https:\/\//}/pkg/version.version=${pkgver}" -o "${pkgname}" ./cmd
    ./"${pkgname}" -h 2>&1 | awk '
        BEGIN {
            prefix = "GCOPY_"
        }

        /^[[:space:]]+-/ {
            if (name != "") {
                print_comment_and_var()
            }

            line = $0
            sub(/^[[:space:]]*-/, "", line)

            split(line, a, /[[:space:]]+/)

            name = a[1]
            type = ""

            if (length(a) > 1) {
                type = a[2]
            }

            desc = ""
            defval = ""

            next
        }

        /^[[:space:]][[:space:]]+/ {
            if (name == "") {
                next
            }

            line = $0
            sub(/^[[:space:]]+/, "", line)

            if (desc == "") {
                desc = line

                if (match(desc, /\(default "[^"]*"\)/)) {
                    defval = substr(desc, RSTART + 10, RLENGTH - 12)
                } else if (match(desc, /\(default [^)]+\)/)) {
                    defval = substr(desc, RSTART + 9, RLENGTH - 10)
                }
            }

            next
        }

        function print_comment_and_var(    envname) {
            if (name == "version") {
                return
            }

            envname = toupper(name)
            gsub(/-/, "_", envname)
            envname = prefix envname

            print "## " desc

            if (defval == "") {
                print "#" envname "=\"\""
            } else {
                print "#" envname "=\"" defval "\""
            }

            print ""
        }

        END {
            if (name != "") {
                print_comment_and_var()
            }
        }
    ' > "${pkgname}.env"
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    cd "${pkgname}-${pkgver}"
    install -Dm644 "${pkgname}.env"     "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm755 "${pkgname}"         "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.md"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md"          "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
