# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=gemini-cli-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Google Gemini CLI stable channel (prebuilt single-file release)"
arch=('any')
url='https://github.com/google-gemini/gemini-cli'
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('curl' 'jq')
provides=('gemini-cli')
conflicts=('gemini-cli')
source=(
    "gemini.js::https://github.com/google-gemini/gemini-cli/releases/download/v${pkgver}/gemini.js"
    "LICENSE::https://raw.githubusercontent.com/google-gemini/gemini-cli/v${pkgver}/LICENSE"
)
sha256sums=('82d6c6f8ab952a24b01cf3f831ca5edae2b5b70246b32233a5daa888988f5737'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')

pkgver() {
    local tag
    tag=$(curl -s 'https://api.github.com/repos/google-gemini/gemini-cli/releases?per_page=20' |
        jq -r '[.[] | select((.draft|not) and (.prerelease|not) and (.tag_name | test("^v[0-9]+\\.[0-9]+\\.[0-9]+$"))) | .tag_name][0]') || return 1

    if [[ -z "$tag" || "$tag" == "null" ]]; then
        echo "Failed to determine stable tag" >&2
        return 1
    fi

    printf '%s\n' "${tag#v}"
}

package() {
    install -Dm644 "${srcdir}/gemini.js" "${pkgdir}/usr/lib/gemini-cli/gemini.js"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/gemini" <<'WRAPPER'
#!/usr/bin/env bash
exec node /usr/lib/gemini-cli/gemini.js "$@"
WRAPPER
}
