# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=certora-gambit-bin
_upstream_name=gambit
pkgver=1.0.6
pkgrel=1
pkgdesc="Certora's Gambit mutant generator for Solidity, used by certoraMutate"
arch=('x86_64')
url="https://github.com/Certora/gambit"
license=('MIT')
depends=('certora-cli' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source=("${_upstream_name}-${pkgver}::${url}/releases/download/v${pkgver}/${_upstream_name}-linux-v${pkgver}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Certora/${_upstream_name}/v${pkgver}/LICENSE")
sha256sums=('76321d84564ff4d8222bfb359f1fe67eae69f21e689dbc9c23760257a94864fa'
            'bb6f1839428742aee306857f853048e89c8b45ef20499ad97255099256dc2f8c')

latestver() {
    gh api --paginate "repos/Certora/${_upstream_name}/releases" --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    install -Dm755 "${_upstream_name}-${pkgver}" "${pkgdir}/usr/lib/${pkgname%-bin}/${_upstream_name}"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname%-bin}/${_upstream_name}" "${pkgdir}/usr/bin/${pkgname%-bin}"

    # certoraMutate looks for the generator beside its own site-packages tree first
    # (Mutate/mutateApp.py get_gambit_exec), and only then for "gambit" on PATH,
    # which the unrelated AUR gambit package owns the name of.
    local site_packages
    site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "${pkgdir}${site_packages}/certora_bins"
    ln -s "/usr/lib/${pkgname%-bin}/${_upstream_name}" \
        "${pkgdir}${site_packages}/certora_bins/${_upstream_name}"
}
