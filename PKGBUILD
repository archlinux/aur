# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Noah Sherwin <noahrsherwin@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=7.16.1
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url='https://github.com/kdeldycke/click-extra'
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('uv' 'python-pip')
depends=('python' 'python-boltons' 'python-pygments' 'python-click>=8.3.1' 'python-json5' 'python-hjson' 'python-tomli' 'python-tomlkit' 'python-yaml' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-requests' 'python-tabulate' 'python-xmltodict' 'python-wcmatch' 'python-wcwidth' 'python-docutils' 'python-sphinx')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bc22d26630e879eeb4ea2b2e4151b4df3c2a3403650c77460757cb3e0ba0b703142db0318cb590e0ef64e7b2a5d219c1b17931ea81c637566d26e5fc45647e9d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv build
}

check() {
    cd "$srcdir/$_name-$pkgver"

    # Install project
    # Install all extras, so we can check any incompatibility.
    uv --no-progress sync --frozen --all-extras --group test

    # Run local CLI
    uv run -- click-extra --version

    # Unittests
    uv --no-progress run --frozen -- pytest -m once --cov --cov-report=term
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv pip install --system --link-mode=copy --no-deps --prefix="${pkgdir}/usr" dist/*.whl

    rm "$pkgdir/usr/.lock"

    install -Dm0644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
