# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Laurent Soest <laurent.soest(at)gmail.com>

pkgname='python38-portend'
_pkgbase="${pkgname//python38-/}"
pkgver=3.1.0
pkgrel=1
pkgdesc="Use portend to monitor TCP ports for bound or unbound states."
arch=('any')
url="https://github.com/jaraco/portend"
license=('MIT')
depends=('python' 'python38-tempora')
makedepends=('python38-setuptools' 'python38-setuptools-scm' 'python38-tox'
             'python38-tempora')
checkdepends=('python38-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase:0:1}/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('017dff68ea85f48d19398f71fbd8189329ca9c27c05d8599dd5e53632eb5ddc6dea322e94c924a0653f25f042a3c8ee1cda5f8450b02f3406a72036d54cd1aaf'
            '1106afed483b7258e4ae89c5d9459c3834412b31aac90169725ed62d2ab44f61f6f79e894d4c9e4d8bd99e14530ab778df2187784f0b25eaab86d312fad68944')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    # remove linting/style tests, not relevant for downstream packaging
    for pointless_flag in \
      --flake8 \
      --black \
      --cov \
      --cov-append \
      --doctest-modules
    do
      sed -i "s/${pointless_flag}//g" pytest.ini
    done
}

build() {
    # setuptools wont find version from git tag
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python3.8 ./setup.py build
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    # tox
    py.test -vvv -s -ra --showlocals --noconftest .
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python3.8 ./setup.py install --root="${pkgdir}" --optimize=1

    # the author has promised to include a LICENSE file in future releases:
    # https://github.com/jaraco/skeleton/issues/1
    # for now the LICENSE file has been taken from:
    # https://github.com/jaraco/skeleton/blob/skeleton/LICENSE
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
