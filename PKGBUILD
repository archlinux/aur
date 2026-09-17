# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-elm327-emulator
_name=${pkgname#python-}
pkgver=4.0.0
pkgrel=1
epoch=
pkgdesc="ELM327 Emulator for testing software interfacing OBDII via ELM327 adapter."
arch=('any')
url="https://github.com/Ircama/ELM327-emulator"
license=('CC-BY-NC-SA-4.0')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-daemon
    python-lockfile
    python-yaml
    # AUR
    python-obd
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v$pkgver")
noextract=()
sha256sums=('3ca4ce404d9b6e013814f1df7fb113b7bb50b8cfa6b40edd3c082b1d6cf77c9f')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i 's/from pkg_resources import parse_version/from packaging.version import parse as parse_version/' setup.py
    cat > pyproject.toml <<'EOF'
[build-system]
requires = ["setuptools>=80", "wheel"]
build-backend = "setuptools.build_meta"
EOF
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    #     install -dm 644 "$pkgdir/usr/share/doc/$pkgname/"
    #     cp -r documentation/*.md "$pkgdir/usr/share/doc/$pkgname/"
}
