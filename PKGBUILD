# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname=aws-sso-util
pkgver=4.33.0 # renovate: datasource=github-releases depName=61418/aws-sso-util extractVersion=^cli-v(?<version>.*)$
pkgrel=2
pkgdesc="Utilities to make AWS IAM Identity Center easier"
arch=('any')
url="https://github.com/61418/aws-sso-util"
license=('Apache-2.0')
depends=(
    'python'
    'python-aws-error-utils'
    'python-aws-sso-lib'
    'python-boto3'
    'python-click'
    'python-dateutil'
    'python-jsonschema'
    'python-requests'
    'python-yaml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
provides=('aws-sso-util')
conflicts=('aws-sso-util')
options=('!debug')
source=(
    "${url}/releases/download/cli-v${pkgver%.*}/aws_sso_util-${pkgver}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/61418/aws-sso-util/cli-v${pkgver%.*}/LICENSE"
)
sha256sums=(
    'e48d7f5911443450d28e1ac1613f81b9aa15babb1b2055b4531df87db43a09df'
    'f63f11a8ef1b3c5aa7e1ab83a16a5e82cb0c1414a5af0e761284403b83c9c8e0'
)

build() {
    cd "${srcdir}/aws_sso_util-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/aws_sso_util-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    local _site_packages
    _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

    install -d "${pkgdir}/usr/share/bash-completion/completions"
    PYTHONPATH="${pkgdir}${_site_packages}" \
        _AWS_SSO_UTIL_COMPLETE=bash_source \
        "${pkgdir}/usr/bin/aws-sso-util" \
        > "${pkgdir}/usr/share/bash-completion/completions/aws-sso-util"

    install -d "${pkgdir}/usr/share/zsh/site-functions"
    PYTHONPATH="${pkgdir}${_site_packages}" \
        _AWS_SSO_UTIL_COMPLETE=zsh_source \
        "${pkgdir}/usr/bin/aws-sso-util" \
        > "${pkgdir}/usr/share/zsh/site-functions/_aws-sso-util"

    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    PYTHONPATH="${pkgdir}${_site_packages}" \
        _AWS_SSO_UTIL_COMPLETE=fish_source \
        "${pkgdir}/usr/bin/aws-sso-util" \
        > "${pkgdir}/usr/share/fish/vendor_completions.d/aws-sso-util.fish"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}