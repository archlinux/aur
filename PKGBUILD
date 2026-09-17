# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-elm327-emulator
_name=${pkgname#python-}
pkgver=3.0.5
pkgrel=3
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
sha256sums=('d15b01921b19dfd621ea6fe850ff89065545e3b237adf5ef6c1cedd979f03056')

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
